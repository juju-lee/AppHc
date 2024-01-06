<?php

header('Content-Type: application/json; charset=utf-8');

require '../config.php';

checkToken();
$out = array('t'=>time(),'success'=>true);
$sql ="select userId, nome, email from usuarios where userId ='{$CUI}'";
$result = $DB['link']->query($sql);
$row = $result->fetch_assoc();
$out['data']=$row;

if(empty($_COOKIE['C'])){
    $CSRFTOKEN = randGen(6);
    setcookie('C', $CSRFTOKEN, time() + (259200),"/",$CFG['hostCookie'],true,true );
}else{
    $CSRFTOKEN = sanitize($_COOKIE['C'],"alphaNum");
    if(strlen($CSRFTOKEN) != 6){
        $CSRFTOKEN = randGen(6);
        setcookie('C', $CSRFTOKEN, time() + (259200),"/",$CFG['hostCookie'],true,true );
    }
}
$sql ="update usuarios set vistoPorUltimo = current_time where userId ='{$CUI}'";
$DB['link']->query($sql);

$out['data']['csrf']= $CSRFTOKEN;

echo json_encode($out);