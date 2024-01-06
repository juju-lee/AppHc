<?php

header('Content-Type: application/json; charset=utf-8');

require '../config.php';

checkToken();
$out = array('t'=>time(),'success'=>true,'data'=>array());
$pacienteId = (int)$_REQUEST['pacienteId'];


//$body = array('type'=>'','query'=>$query));

$sql ="select pacienteId, nome, registroHC, nascimento, genero, estadoCivil, estado, cidade, criadoEm  from pacientes where pacienteId ='{$pacienteId}'";
$result = $DB['link']->query($sql);
$row = $result->fetch_assoc();
if(empty($row['pacienteId'])){
    error('paciente invalido');
}
$out['data']['paciente'] = $row;

$sql ="select nome,finalizadoEm,pFId,pF.formId from forms join pacienteForm pF on forms.formId = pF.formId where pacienteId ='{$pacienteId}' order by finalizadoEm desc limit 15";
$result = $DB['link']->query($sql);
while($row = $result->fetch_assoc()) {
    $out['data']['forms'][] = $row;
}


logAction('getPatient',array('pacienteId'=>$pacienteId));








echo json_encode($out);