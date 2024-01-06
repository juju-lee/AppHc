<?php


require_once("config.php");

$token = explode('_',$_COOKIE['token']);
$tokenId = 0;
if(count($token) != 2){
    $key = "";
}else {
    $key = sanitize($token[1], "alphaNum");
    $tokenId = (int)$token[0];
    if(empty($tokenId)){
        $key = "";
    }
}
if(strlen($key) == 69){
    $key = hashPass($key);
    $sql = "delete from tokenUsuario where tokenId = '{$tokenId}' and tokenKey = '{$key}'";
    $result = $DB['link']->query($sql);
}


setcookie("token", "", time()-36000);
setcookie('token', "", time()-36000 ,"/",$CFG['hostCookie'],true,true );
setcookie('token', "", time()-36000 ,"/",".".$CFG['hostCookie'],true,true );
forceRedirect("index.html?error=logout");
