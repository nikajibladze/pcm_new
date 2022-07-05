<?php
function structureNames($cond)
{
    $db = getDB();
    $select_condition = $db->prepare("SELECT name FROM structures where id=:cond");
    $select_condition->bindValue("cond", $cond, PDO::PARAM_INT);
    $select_condition->execute();
    $condition2 = $select_condition->fetch();
    return $condition2["name"];
}

function structureId($cond)
{
    if(!$cond){
        return "";
      }
    $structures="";
    $db = getDB();
    $select_condition = $db->prepare("SELECT structureId FROM event_structures where eventId=:cond");
    $select_condition->bindValue("cond", $cond, PDO::PARAM_INT);
    $select_condition->execute();
    $lfcr = chr(10) . chr(13);
    while($condition2 = $select_condition->fetch()){
      $structures.=structureNames($condition2["structureId"]).", $lfcr ";
    }
	
    return substr_replace($structures ,"", -1);
   
    
}

function getStatus($cond)
{
    if(!$cond){
      return "";
    }
    $db = getDB();
    $select_condition = $db->prepare("SELECT name FROM status where id=:cond");
    $select_condition->bindValue("cond", $cond, PDO::PARAM_INT);
    $select_condition->execute();
    $condition2 = $select_condition->fetch();
    return $condition2["name"];
}


function getRealtion($id){
    if(!$id){
        return;
    }
$db=getDB();

$statement=$db->prepare("SELECT * FROM relations where id=:id");
$statement->bindValue("id", $id,PDO::PARAM_INT);
$statement->execute();
$record=$statement->fetch();

return $record["name"];


}




function countries($cond)
{
    $db = getDB();
    $select_condition = $db->prepare("SELECT name FROM countries where id=:cond");
    $select_condition->bindValue("cond", $cond, PDO::PARAM_INT);
    $select_condition->execute();
    $condition2 = $select_condition->fetch();
    return $condition2["name"];
}

function countryId($cond)
{
    if(!$cond){
        return "";
      }
    $structures="";
    $db = getDB();
    $select_condition = $db->prepare("SELECT countryId FROM event_countries where eventId=:cond");
    $select_condition->bindValue("cond", $cond, PDO::PARAM_INT);
    $select_condition->execute();
    while($condition2 = $select_condition->fetch()){
      $structures.=countries($condition2["countryId"]).",";
    }
	
    return substr_replace($structures ,"", -1);
   
    
}




function cooperations($cond)
{
    
    $db = getDB();
    $select_condition = $db->prepare("SELECT name FROM cooperations where id=:cond");
    $select_condition->bindValue("cond", $cond, PDO::PARAM_INT);
    $select_condition->execute();
    $condition2 = $select_condition->fetch();
    return $condition2["name"];
}

function cooperationId($cond)
{
    if(!$cond){
        return "";
      }
    $structures="";
    $db = getDB();
    $select_condition = $db->prepare("SELECT cooperationId FROM event_cooperations where eventId=:cond");
    $select_condition->bindValue("cond", $cond, PDO::PARAM_INT);
    $select_condition->execute();

    while($condition2 = $select_condition->fetch()){
      $structures.=cooperations($condition2["cooperationId"]) . ',';
    }
	
    return substr_replace($structures ,"", -1);
   
    
}

?>
