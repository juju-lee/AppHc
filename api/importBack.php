<?php

require_once 'config.php';
//die;


$form =2;

foreach (glob('../paginas2/*.json') as $file){
    $name = basename($file);
    $file = json_decode(file_get_contents($file),true);
    $name = sanitize($name,'mysql');
    $sql ="select pId from paginas where identificador ='{$name}'";
    $result = $DB['link']->query($sql);
    $row = $result->fetch_assoc();
    if(empty($row['pId'])) {
        $sql = "INSERT INTO `paginas` (`pId`, `formId`, `identificador`, `ordem`) VALUES (NULL, '{$form}', '{$name}', '1') ";
        $result = $DB['link']->query($sql);
        $pId = (int)$DB['link']->insert_id;
        echo $name . PHP_EOL;
    }else{
        echo $name.PHP_EOL;
        $pId = (int)$row['pId'];
    }
    foreach($file as $field){
        if(isset($field['cfg']['fieldName'])){
            $fieldName = $field['cfg']['fieldName'];
        }else{
            $fieldName = labelToFieldName($field['cfg']['label']);
        }
        $fieldName = sanitize($fieldName,'mysql');
        $cfg = sanitize(json_encode($field['cfg']),'mysql');
        if(empty($field['colsize'])){
            $field['colsize'] =12;
        }
        $field = sanitize($field,'mysql');
        if($field['colsize'] == 6){
            print_r($field);
        }
        $sql ="INSERT INTO `campos` (`cId`, `pId`, `tipo`, `fieldName`, `label`, `row`, `col`, `colsize`, `cfg`, `ativo`) VALUES (NULL, '{$pId}', '{$field['type']}', '{$fieldName}', '{$field['cfg']['label']}', '{$field['row']}', '{$field['col']}', '{$field['colsize']}', '{$cfg}', '1') ";
        $result = $DB['link']->query($sql);


    }


}
include(dirname(__FILE__).'/cachePages.php');
