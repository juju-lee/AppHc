<?php

header('Content-Type: application/json; charset=utf-8');

require '../config.php';

checkToken();
checkCSRF($_REQUEST['csrf']);
$out = array('t'=>time(),'success'=>true,'data'=>array());

$formId = (int)$_REQUEST['formId'];
$patientId = (int)$_REQUEST['patientId'];
$request = json_decode($_REQUEST['data'],true);
//$request = sanitize($request);


$sql ="select nome,formId from forms where formId ='{$formId}'";
$result = $DB['link']->query($sql);
$row = $result->fetch_assoc();
if(empty($row['formId'])){
    error('Form invalido');
}
$mapCId = array("nome" => "NomedoPaciente", "registroHC" => 'RegistroInternonHC', 'nascimento' => 'DatadeNascimento', 'genero' => 'Genero', 'estadoCivil' => 'EstadoCivil', 'estado' => 'Estado', 'cidade' => 'Cidade');
$mapCIdF = array_flip($mapCId);
$query = str_replace(array('[', ']'), array('(', ')'), json_encode(array_values($mapCId)));
$sql ="select cId,fieldName from campos where fieldName in {$query} ";
$result = $DB['link']->query($sql);
while($row = $result->fetch_assoc()){
    $mapCId[$mapCIdF[$row['fieldName']]] = $row['cId'];
    if(empty($request[$row['cId']])){
        $request[$row['cId']] ='';
    }
}

if($patientId == 0) {

    if(empty($request[$mapCId['nome']]) || empty($request[$mapCId['registroHC']])){
        error('Não há nome ou registroHC para criar o paciente');
    }
    $sql ="INSERT INTO `pacientes` (`pacienteId`, `nome`, `registroHC`, `nascimento`, `genero`, `estadoCivil`, `estado`, `cidade`) VALUES (NULL, '".sanitize($request[$mapCId['nome']])."', '".sanitize($request[$mapCId['registroHC']])."', '".sanitize($request[$mapCId['nascimento']])."', '".sanitize($request[$mapCId['genero']])."', '".sanitize($request[$mapCId['estadoCivil']])."', '".sanitize($request[$mapCId['estado']])."', '".sanitize($request[$mapCId['cidade']])."') ";
    $result = $DB['link']->query($sql);
    if(!$result){
        error('Não conseguimos cadastrar o paciente, verifique registroHC ou contat o suporte');
    }
    $patientId = (int)$DB['link']->insert_id;
    logAction('newPatient',$patientId);
}else{
    $sql ="select pacienteId from pacientes where pacienteId ='{$patientId}'";
    $result = $DB['link']->query($sql);
    $row = $result->fetch_assoc();
    if(empty($row['pacienteId'])){
        error('Paciente invalido');
    }

    if(!empty($request[$mapCId['nome']]) && !empty($request[$mapCId['registroHC']])){
        $sql ="update pacientes set nome ='".sanitize($request[$mapCId['nome']])."',registroHC='".sanitize($request[$mapCId['registroHC']])."',nascimento='".sanitize($request[$mapCId['nascimento']])."',genero='".sanitize($request[$mapCId['genero']])."',estadoCivil ='".sanitize($request[$mapCId['estadoCivil']])."',estado='".sanitize($request[$mapCId['estado']])."',cidade='".sanitize($request[$mapCId['cidade']])."' where pacienteId ='{$patientId}'";
        $DB['link']->query($sql);
        logAction('editPatient',array('patientId'=>$patientId,'sql'=>$sql));
    }

}
//Caso tenhamos auto preenchimento/ auto save, devemos pular esse passo
$sql ="INSERT INTO `pacienteForm` (`pFId`, `pacienteId`, `formId`, `finalizado`, `criadoEm`, `finalizadoEm`) VALUES (NULL, '{$patientId}', '{$formId}', '0', CURRENT_TIMESTAMP, '2100-01-01 00:00:00.000000') ";
$result = $DB['link']->query($sql);
$pFId =(int)$DB['link']->insert_id;

logAction('newFormPatient',array('pFId'=>$pFId,'patientId'=>$patientId));

$sql ="select cId from campos where pId in (select pId from paginas where formId ='{$formId}') and ativo = 1";
$result = $DB['link']->query($sql);
while($row = $result->fetch_assoc()) {
    if (!empty($request[$row['cId']])) {
        $searchable = sanitize($request[$row['cId']],'mysql',32); //double work if we sanitize everything before this
        $sql ="INSERT INTO `pacienteFormResposta` (`pFRId`, `pFId`, `cId`, `respostaSearchable`, `resposta`) VALUES (NULL, '{$pFId}', '{$row['cId']}', '{$searchable}', '".sanitize($request[$row['cId']])."') ";
        $DB['link']->query($sql);
    }
}

$sql ="update pacienteForm set finalizadoEm = current_time, finalizado =1 where pFId ='{$pFId}'";
$DB['link']->query($sql);
$out['data'] = $pFId;
logAction('endFormPatient',array('pFId'=>$pFId,'patientId'=>$patientId));

echo json_encode($out);