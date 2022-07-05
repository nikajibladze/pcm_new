<?php 
header('Content-Type: application/json');

include("core/config.php");

$db=getDB();
if(isset($_POST["searchTerm"])){
    $q = $_POST["searchTerm"];
    $statement=$db->prepare("SELECT id, name FROM users where name like '%".$q."%' limit 5");
}else{
    $statement=$db->prepare("SELECT id, name FROM users limit 1");
}

$statement->execute();
$data = array();

while($users = $statement->fetch()){
    $data[] = array("id"=>$users["id"],"name"=> $users["name"]);

}


echo json_encode($data);


?>