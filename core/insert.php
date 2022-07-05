<?php 
include("config.php");
$db=getDB();
$data = file_get_contents ("test.json");
        $json = json_decode($data, true);
        foreach ($json as $key => $value) {
            if (!is_array($value)) {
                echo $key . '=>' . $value . '<br/>';
            } else {
                foreach ($value as $key => $val) {
                    $statement = $db->prepare("INSERT INTO countries(
                        name)
                    VALUES
                    (:name)");
                        $statement->execute(array(
                            "name" =>$val));
                   
                }
            }
        }


//$statement=$db->prepare("INSERT INTO countries ")
?>