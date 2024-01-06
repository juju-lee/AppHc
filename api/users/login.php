<?php

require("../config.php");

header('Content-Type: application/json; charset=utf-8');
$out = array("t" => time(), "success" => true);
$out['data'] = array();




$email = sanitize($_REQUEST['email']);
$email = str_replace(array('%','#','*'),'',$email);
$email = strtolower($email);
$pass = hashPass($_REQUEST['password']);


$sql ="select userId,ativo from usuarios where email like '{$email}' and senha ='{$pass}'";
$result = $DB['link']->query($sql);
$row = $result->fetch_assoc();
if(empty($row['userId'])){
    error('Usuario e/ou Senha incorreto(s)!');
}
$CUI = (int)$row['userId'];
if($row['ativo'] != '1'){
    logAction('bloqLogin',$CFG['reqUA']);
    error('Usuario bloqueado!');
}

logAction('login',$CFG['reqUA']);


$key = randGen(59,"alphanum");
$validity = date("Y-m-d H:i:s",(time() + (3600 * $CFG['sessionValidity'])  ));

$sql ="INSERT INTO `tokenUsuario` (`tokenId`, `userId`, `tokenKey`, `lastIp`, `lastUA`, `createTime`, `validUntil`) VALUES (NULL, '{$CUI}', '".hashPass($key)."', '{$CFG['reqIp']}', '{$CFG['reqUA']}', CURRENT_TIMESTAMP, '{$validity}') ";

$result = $DB['link']->query($sql);
$tokenId = $DB['link']->insert_id;

setcookie('valid', "1", time() + (3600 * $CFG['sessionValidity']),"/",$CFG['hostCookie'],true,false ); //JS visible
setcookie('token', $tokenId ."_".$key, time() + (3600 * $CFG['sessionValidity']),"/",$CFG['hostCookie'],true,true );
echo json_encode($out);
