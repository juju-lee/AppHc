<?php

header('Content-Type: application/json; charset=utf-8');

require '../config.php';

checkToken();


$formId = (int)$_REQUEST['formId'];

$out = array('t'=>time(),'success'=>true,'data'=>array());

$sql ="select nome,formId from forms where formId ='{$formId}'";
$result = $DB['link']->query($sql);
$row = $result->fetch_assoc();
if(empty($row['formId'])){
    error('Form invalido');
}
$out['meta']= array('name'=>$row['nome']);


$sql ="select identificador from paginas where formId ='{$formId}' order by ordem asc";
$result = $DB['link']->query($sql);
while($row = $result->fetch_assoc()){
    $out['data'][]=$row['identificador'];
}

echo json_encode($out);