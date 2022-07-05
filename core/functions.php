<?php 



function getCountry($id){
    if(!$id){
        return;
    }
$db=getDB();

$statement=$db->prepare("SELECT * FROM countries where id=:id");
$statement->bindValue("id", $id,PDO::PARAM_INT);
$statement->execute();
$record=$statement->fetch();

return $record["name"];


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

function getStructure($id){
    if(!$id){
        return;
    }
$db=getDB();
$statement=$db->prepare("SELECT * FROM structures where id=:id");
$statement->bindValue("id", $id,PDO::PARAM_INT);
$statement->execute();
$record=$statement->fetch();
return $record["name"];
}


function getStructures($id){
    if(!$id){
        return;
    }
$db=getDB();
$ids = "";
$structures = array();
$statement=$db->prepare("SELECT * FROM event_structures where eventId=:id");
$statement->bindValue("id", $id,PDO::PARAM_INT);
$statement->execute();
while($record=$statement->fetch()){
    $structures = getStructure($record["structureId"]);
}
return $structures;
}

function getCooperation($id){
    if(!$id){
        return;
    }
$db=getDB();

$statement=$db->prepare("SELECT * FROM cooperations where id=:id");
$statement->bindValue("id", $id,PDO::PARAM_INT);
$statement->execute();
$record=$statement->fetch();

return $record["name"];


}


function getStatus($id){
    if(!$id){
        return;
    }
$db=getDB();

$statement=$db->prepare("SELECT * FROM status where id=:id");
$statement->bindValue("id", $id,PDO::PARAM_INT);
$statement->execute();
$record=$statement->fetch();
$name=$record["name"];

if($id==1){
    return "<span class='btn btn-sm btn-primary bg-gradient'>$name</span>";
}elseif($id==2){
    return "<span class='btn btn-sm btn-warning bg-gradient'>$name</span>";
}elseif($id==3){
    return "<span class='btn btn-sm btn-success bg-gradient'>$name</span>";
}elseif($id==4){
    return "<span class='btn btn-sm btn-danger bg-gradient'>$name</span>";
}



}


function getTypes($id){
    if(!$id){
        return;
    }
$db=getDB();

$statement=$db->prepare("SELECT * FROM types where id=:id");
$statement->bindValue("id", $id,PDO::PARAM_INT);
$statement->execute();
$record=$statement->fetch();
return $record["name"];

}



function getUser($id){
    if(!$id){
        return ;
    }
$db=getDB();

$statement=$db->prepare("SELECT * FROM users where id=:id");
$statement->bindValue("id", $id,PDO::PARAM_INT);
$statement->execute();
$record=$statement->fetch();
return $record["username"];

}


function getEventStructures($structures){
    $db=getDB();
 $response = array();   
$imploded =  implode(",",$structures);
$statement=$db->prepare("SELECT eventId FROM event_structures where structureId in ($imploded)");
$statement->execute();
while($record=$statement->fetch()){
    $response.=$record["eventId"].',';
}
$result = rtrim($response, ",");

    return $result;
    
}


function getEventCountries($country){
    $db=getDB();
 $response = array();   
$imploded =  implode(",",$country);
$statement=$db->prepare("SELECT eventId FROM event_countries where countryId in ($imploded)");
$statement->execute();
while($record=$statement->fetch()){
    $response.=$record["eventId"].',';
}
$result = rtrim($response, ",");

    return $result;
    
}

function getEventCooperations($cooperation){
    $db=getDB();
 $response ="";   
$imploded =  implode(",",$cooperation);
$statement=$db->prepare("SELECT eventId FROM event_cooperations where cooperationId in ($imploded)");
$statement->execute();
while($record=$statement->fetch()){
    $response.=$record["eventId"].',';
}
$result = rtrim($response, ",");

    return $result;
}
?>