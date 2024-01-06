<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

//error_reporting(0);
//ini_set('display_errors', 0);

$CFG=array();
$CFG['rootPath']=dirname(__FILE__)."/";


$CUI =0;

$CFG['sessionValidity']=16; //em horas


$CFG['salt']='uMbY3xrTwDtVSLaJN2vRHs'; // salt para a criptografia de senhas. recomendavel: 32 chars
$CFG['hostMysql']='localhost'; // host do mysql
$CFG['userMysql']='zouli_tcc'; // user do mysql
$CFG['passMysql']='z8HBZkWo9^Gf'; // senha do mysql
$CFG['db']='zouli_tcc'; // db do mysql
$CFG['hostCookie']='tcc.zouli.work'; // dominio para o cookie de login
$CFG['systemUrl']='https://tcc.zouli.work/'; // url base que está rodando o html


date_default_timezone_set('America/Sao_Paulo');

require_once($CFG['rootPath'].'functions.php');
$DB['link'] = mysqli_connect ($CFG['hostMysql'], $CFG['userMysql'], $CFG['passMysql'],$CFG['db']);
mysqli_set_charset($DB['link'],'utf8mb4');


$CFG['reqUA'] = sanitize(mb_convert_encoding($_SERVER['HTTP_USER_AGENT'], 'ISO-8859-1', 'UTF-8'));
$CFG['reqIp']=sanitize(getIp()); //nunca se sabe quando algum server mal configurado deixa sobreescrever ip com qualquer string aleatoria