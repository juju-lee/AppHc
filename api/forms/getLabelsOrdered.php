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


$sql ="select pId,ordem from paginas where formId ='{$formId}' order by ordem asc";
$result = $DB['link']->query($sql);
while($row = $result->fetch_assoc()){
    $sql ="select cId,fieldName,label from campos where pId ='{$row['pId']}' and ativo = 1 order by `row` asc, `col` asc ";
//    error($sql);
    $result2 = $DB['link']->query($sql);
    while($row2 = $result2->fetch_assoc()){
        $out['data'][]=$row2;
    }
}



echo json_encode($out);