<?php

header('Content-Type: application/json; charset=utf-8');

require '../config.php';

checkToken();



$out = array('t'=>time(),'success'=>true,'data'=>array());

if(isset($_REQUEST['pFId']) && !empty((int)$_REQUEST['pFId'])) {
    $pFId = (int)$_REQUEST['pFId'];

    $sql = "select pFId,pacienteId from pacienteForm where pFId ='{$pFId}' ";
}else{
    $pacienteId = (int)$_REQUEST['pacienteId'];
    $formId = (int)$_REQUEST['formId'];

    $sql = "select pFId,pacienteId from pacienteForm where pacienteId ='{$pacienteId}' and formId ='{$formId}' and finalizado =1 order by finalizadoEm desc limit 1";
}
$result = $DB['link']->query($sql);
$row = $result->fetch_assoc();
if(empty($row['pFId'])){
    error('Form invalido');
}
$pacienteId = (int)$row['pacienteId'];
$pFId = (int)$row['pFId'];
logAction('getPatientFBody',array('pacienteId'=>$pacienteId,'pFId'=>$row['pFId']));




$sql ="select cId,resposta from pacienteFormResposta where pFId ='{$pFId}' order by pFRId asc";
$result = $DB['link']->query($sql);
while($row = $result->fetch_assoc()){
    $out['data'][$row['cId']]=$row['resposta'];
}

echo json_encode($out);