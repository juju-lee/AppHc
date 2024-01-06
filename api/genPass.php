<?php
include("config.php");

if(!empty($_POST['pass'])){
    echo hashPass($_POST['pass']);
}
?>
<form method="post">
    <input type="password" name="pass">
    <input type="submit">

</form>
