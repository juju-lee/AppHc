<?php

require_once 'config.php';


$dir = dirname(__FILE__).'/../paginas/';


$sql ="select pId,identificador from paginas  ";//Caution with php;
$result = $DB['link']->query($sql);
while($row = $result->fetch_assoc()){
    $row['identificador'] =explode('.',$row['identificador']);
    $row['identificador'] = sanitize($row['identificador'][0],'alphaNum');
    $row['identificador'] .= '.json';
    $json = array();

    $sql ="select fieldName,tipo,label,`row`,col,colSize,cfg,cId from campos where ativo =1 and pId ='{$row['pId']}' order by `row`,col ";
//    echo $sql;
    $result2 = $DB['link']->query($sql);
    while($row2 = $result2->fetch_assoc()){
        $cfg = json_decode($row2['cfg'],true);
        $cfg['fieldName'] =$row2['fieldName'];
//        {"type":"title","row":1,"col":0,"colsize":12,"cfg":{"label":"Antecedentes Clínicos","classes":""}}
        $item = array('type'=>$row2['tipo'],'cId'=>(int)$row2['cId'],'row'=>(int)$row2['row'],'col'=>(int)$row2['col'],'colsize'=>$row2['colSize'],'cfg'=>$cfg);
        $json[]=$item;
    }

    echo $row['identificador'];
    file_put_contents($dir.$row['identificador'],json_encode($json));
}