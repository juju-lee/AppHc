<?php

header('Content-Type: application/json; charset=utf-8');

require '../config.php';

checkToken();
$out = array('t'=>time(),'success'=>true,'data'=>array());
$append ='';
$body ='';
if(strlen($_REQUEST['search']) > 0){
    $type = sanitize($_REQUEST['type'],'alphaNum');
    $search = sanitize($_REQUEST['search'],'mysql');
    switch ($type){
        case('registroHC'):{
            $search = sanitize($search,'numbers');
            $append = " where {$type} = '{$search}' ";
            break;
        }

        case('cidade'):

        case('nome'):{
            $append = " where {$type} like '%{$search}%' ";

            break;
        }


    }


}


//$body = array('type'=>'','query'=>$query));

$sql ="select pacienteId, nome, registroHC, nascimento, genero, estadoCivil, estado, cidade, criadoEm  from pacientes {$append} order by criadoEm desc limit 25";
$result = $DB['link']->query($sql);
while($row = $result->fetch_assoc()){
    $out['data'][] = $row;
}


logAction('listPatients',$body);








echo json_encode($out);