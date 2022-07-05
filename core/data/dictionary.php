<?php 
include './config.php';
$db=getDB();




function getCountries()
{
    $data = array();
    $db = getDB();
    $statement = $db->prepare("SELECT * FROM countries");
    $statement->execute();

    while ($record = $statement->fetch()) {
        if ($record["id"] == true) {
            $data[] = array(
                "id" => $record["id"],
                "name" => $record["name"]);
        }
    }
    return json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}

function getCooperations()
{
    $data = array();
    $db = getDB();
    $statement = $db->prepare("SELECT * FROM cooperations");
    $statement->execute();

    while ($record = $statement->fetch()) {
        if ($record["id"] == true) {
            $data[] = array(
                "id" => $record["id"],
                "name" => $record["name"]);
        }
    }
    return json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}


function getStructures()
{
    $data = array();
    $db = getDB();
    $statement = $db->prepare("SELECT * FROM structures");
    $statement->execute();

    while ($record = $statement->fetch()) {
        if ($record["id"] == true) {
            $data[] = array(
                "id" => $record["id"],
                "name" => $record["name"]);
        }
    }
    return json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}


function getRelations()
{
    $data = array();
    $db = getDB();
    $statement = $db->prepare("SELECT * FROM relations");
    $statement->execute();

    while ($record = $statement->fetch()) {
        if ($record["id"] == true) {
            $data[] = array(
                "id" => $record["id"],
                "name" => $record["name"]);
        }
    }
    return json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}



function getStatus()
{
    $data = array();
    $db = getDB();
    $statement = $db->prepare("SELECT * FROM status");
    $statement->execute();

    while ($record = $statement->fetch()) {
        if ($record["id"] == true) {
            $data[] = array(
                "id" => $record["id"],
                "name" => $record["name"]);
        }
    }
    return json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}

function getTypes()
{
    $data = array();
    $db = getDB();
    $statement = $db->prepare("SELECT * FROM types");
    $statement->execute();

    while ($record = $statement->fetch()) {
        if ($record["id"] == true) {
            $data[] = array(
                "id" => $record["id"],
                "name" => $record["name"]);
        }
    }
    return json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
}
?>