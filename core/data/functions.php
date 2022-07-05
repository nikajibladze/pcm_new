<?php 

function insertFile(){
  $db=getDB();

  if ($_FILES['event_file']['size'] != 0 && $_FILES['event_file']['error'] != 0)
{
    

                            for ($i = 0; $i < count($_FILES["event_file"]['name']); $i++) {
                        
                                    if (isset($_FILES["event_file"]["name"][$i]) && $_FILES["event_file"]["name"][$i] != '') {
                                        $id = $_POST["id"];
                                        $image_name = $_FILES["event_file"]["name"][$i];
                                        $array = explode(".", $image_name);
                                        $extension = end($array);
                                        $temporary_name = $_FILES["event_file"]["tmp_name"][$i];
                                        $allowed_extension = array("jpg", "png","PNG", "pdf", "xlx", "xlsx", "txt", "doc", "docx", "zip", "rar", "ppt", "pptx", "PPT", "PPTX", "JPG", "XLX", "DOC", "DOCX", "VSD", "vsd");
                                        if (!in_array($extension, $allowed_extension)) {
                                            $error .= '<p>Invalid File</p>';
                                        } else {
                                            $images = rand() . '.' . $extension;
                                            $folder = rand(1, 100);
                                            $real_name = $array[0];
                        
                                            move_uploaded_file($temporary_name, '../uploads/' . $folder . '/' . $images);
                        
                                        }
                        
                                     
                                            $statement = $db->prepare("INSERT INTO files (
                                    name,
                                    storageName,
                                    eventId)
                                      VALUES
                                      (:name,
                                      :storageName,
                                      :eventId
                                   )");
                                            $statement->execute(array(
                                                "name" => $real_name,
                                                "storageName" => 'uploads/' . $folder . '/' . $images,
                                                "eventId" => $id
                                            ));
                        
                                        
                        
                                    }
                        
                                }
                                return;
                            
                        }
                    }

function getEventsData()
{
    $db = getDB();
    $id = $_GET["id"];
    $response = array();
    $statement = $db->prepare("SELECT * FROM events where id=$id ");
    $statement->execute();
    $events = $statement->fetchAll(PDO::FETCH_NAMED);
    $events_count = countEvents();
    $merge = array_merge($events , $events_count);
    echo json_encode($merge);

}

function insertEvent(){
    $db = getDB();
    $response = array();
    if(!$_POST["name"]){
        $response = array("status"=>400, "message"=>"შეიყვანეთ ღონისძიების დასახელება");
        return json_encode($response);  
    }
    if(!$_POST["status"]){
        $response = array("status"=>400, "message"=>"მიუთითეთ ღონისძიების სტატუსი","field"=> "status");
        return json_encode($response);  
    }
    $name = $_POST["name"] ? $_POST["name"] : null;
    $type = $_POST["type"] ? $_POST["type"] : null;
    $face = $_POST["face"] ? $_POST["face"] : null;
    $relationship = $_POST["relationship"] ? $_POST["relationship"] : null;
    $status = $_POST["status"] ? $_POST["status"] : null;
    $startDate = $_POST["startDate"] ? $_POST["startDate"] : null;
    $endDate = $_POST["endDate"] ? $_POST["endDate"] : null;
    $quantity = $_POST["quantity"] ? $_POST["quantity"] : null;
    $place = $_POST["place"] ? $_POST["place"] : null;
    $reminder = $_POST["reminder"] ? $_POST["reminder"] : null;
    $about = $_POST["about"] ? $_POST["about"] : null;
    $comment = $_POST["comment"] ? $_POST["comment"] : null;
    $travel = $_POST["travel"] ? $_POST["travel"] : null;
    $eat = $_POST["eat"] ? $_POST["eat"] : null;
    $learn = $_POST["learn"] ? $_POST["learn"] : null;
    $transport = $_POST["transport"] ? $_POST["transport"] : null;
    $visit = $_POST["visit"] ? $_POST["visit"] : null;
    $other = $_POST["other"] ? $_POST["other"] : null;
    $other_text = $_POST["other_text"] ? $_POST["other_text"] : null;
    $place = $_POST["place"] ? $_POST["place"] : null;
    $userId =$_SESSION['user_id'];

 
    $statement = $db->prepare("INSERT INTO events(
      name,
      type,
      face,
      relationship,
      status,
      startDate,
      endDate,      
      travel,
      eat,
      learn,
      transport,
      visit,
      other,
      other_text,
      place,
      quantity,
      reminder,
      about,
      comment,
      userId )
        VALUES
        (:name,
        :type,
        :face,
        :relationship,
        :status,
        :startDate,
        :endDate,
        :travel,
        :eat,
        :learn,
        :transport,
        :visit,
        :other,
        :other_text,
        :place,
        :quantity,
        :reminder,
        :about,
        :comment,
        :userId

     )");
    $statement->execute(array(
        "name" => $name,
        "type" => $type,
        "face" => $face,
        "relationship" => $relationship,
        "status" => $status,
        "startDate" => $startDate,
        "endDate" => $endDate,
        "travel" => $travel,
        "eat" => $eat,
        "learn" => $learn,
        "transport" => $transport,
        "visit" => $visit,
        "other" => $other,
        "other_text" => $other_text,
        "place" => $place,
        "quantity" => $quantity,
        "reminder" => $reminder,
        "about" => $about,
        "comment" => $comment,
        "userId" => $userId
    ));
        $event_id = $db->lastInsertId();



    if(!empty($_POST["cooperation"])){
        foreach ($_POST["cooperation"] as $key => $val) {
    
                    $cooperation =$_POST["cooperation"][$key] ;        
                    $statement = $db->prepare("INSERT INTO event_cooperations(
                    cooperationId,
                    eventId
                    )
                VALUES
                (:cooperationId,
                :eventId)");
                    $statement->execute(array(
                        "cooperationId" => $cooperation,
                        "eventId" => $event_id ,
                    ));        
                }
            }


            if(!empty($_POST["structures"])){
                foreach ($_POST["structures"] as $key => $val) {
            
                            $structures =$_POST["structures"][$key] ;        
                            $statement = $db->prepare("INSERT INTO event_structures(
                            eventId,
                            structureId
                            )
                        VALUES
                        (:eventId,
                        :structureId)");
                            $statement->execute(array(
                                "eventId" => $event_id,
                                "structureId" => $structures ,
                            ));        
                        }
                    }
      
            if(!empty($_POST["countries"])){
                foreach ($_POST["countries"] as $key => $val) {           
                            $countries =$_POST["countries"][$key] ;     
                            $additional_dateFrom =$_POST["additional_dateFrom"][$key] ;  
                            $additional_dateTo =$_POST["additional_dateTo"][$key] ;     
                            $statement = $db->prepare("INSERT INTO event_countries(
                            eventId,
                            countryId,
                            dateFrom,
                            dateTo
                            )
                        VALUES
                        (:eventId,
                        :countries,
                        :additional_dateTo,
                        :additional_dateFrom)");
                            $statement->execute(array(
                                "eventId" => $event_id,
                                "countries" => $countries,
                                "additional_dateFrom"=>$additional_dateFrom,
                                "additional_dateTo"=>$additional_dateTo
                            ));        
                        }
                    }

                    $statement = $db->prepare("INSERT INTO notifications(
                        eventId,
                        dateFrom,
                        days,
                        userId)
                          VALUES
                          (:eventId,
                          :startDate,
                          :days,
                          :userId
                  
                       )");
                      $statement->execute(array(
                          "eventId" => $event_id,
                          "startDate" => $startDate,
                          "days" => $reminder,
                          "userId" => $userId
                      ));

                    $response = array("status"=>200, "message"=>"ღონისძიება წარმატებით დაემატა", "id"=>$event_id,"eventId"=>$event_id);
                    echo json_encode($response);




                    
            die;

}

function getEventStructures(){

    $db = getDB();
    $id = $_GET["id"];
    $structures = array();
    $i = 0;
    $statement = $db->prepare("SELECT * FROM event_structures where eventId=:id");
    $statement->bindValue("id", $id, PDO::PARAM_INT);
    $statement->execute();
    while ($structure = $statement->fetch()) {
        $structures[] = array("structureId" => $structure["structureId"]);

    }

    echo json_encode($structures);

}


function getEventCooperations(){

    $db = getDB();
    $id = $_GET["id"];
    $cooperations = array();
    $i = 0;
    $statement = $db->prepare("SELECT * FROM event_cooperations where eventId=:id");
    $statement->bindValue("id", $id, PDO::PARAM_INT);
    $statement->execute();
    while ($cooperation = $statement->fetch()) {
        $cooperations[] = array("cooperationId" => $cooperation["cooperationId"]);

    }

    echo json_encode($cooperations);

}
function checkUser($username){
    $db=getDB();
    $nRows = $db->query("select count(1) from users where username='$username' ")->fetchColumn(); 
    return $nRows;



    
}

function insertUser(){
    $response = array();
    $db = getDB();
    unset($_POST["insert_user"]);
    unset($_POST["user_id"]);
  
    if(!$_POST["name"] || !$_POST["lastname"] || !$_POST["username"]){
    $response = array("status" => 400, "message" => "შეავსეთ ყველა სავალდებულო ველი");
    return json_encode($response);
    
    }
    $checkUser = checkUser($_POST["username"]);
   if($checkUser>0){
    $response = array("status" => 400, "message" => "ასეთი მომხმარებელი უკვე არსებობს");
    return json_encode($response);
   }
   if(!$_POST["password"] ){
    $response = array("status" => 400, "message" => "დააგენერირეთ ერთჯერადი პაროლი");
    return json_encode($response);
   }
    $password = $_POST["password"];
    $_POST["password"] =  password_hash($_POST["password"], PASSWORD_DEFAULT); 
    $post = $_POST;
    $n = array_keys($post);
    $this_new_arr = array();
    $fields = implode(", ", $n);
    $values = ":" . implode(", :", $n);
    $insert = "INSERT INTO users ($fields) VALUES ($values)";
    $query = $db->prepare($insert);
    foreach ($post as $key => &$value) {
        switch (gettype($value)) {
            case 'integer':
            case 'double':
                $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
                break;
            default:
                $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
        }
    }
    $query->execute();
    $id = $db->lastInsertId();
    $response = array("status" => 200, "message" => "მომხმარებელი დამატებულია <br> ერთჯერადი პაროლი : $password", "id" => $id);
    echo json_encode($response);
}

function getEventFile() {

    $db = getDB();
    $id = $_POST["id"];
    $response = array();
    $statement = $db->prepare("SELECT * FROM files where eventId=:id");
    $statement->bindValue("id", $id, PDO::PARAM_INT);
    $statement->execute();
    $files = $statement->fetchAll(PDO::FETCH_NAMED);

    echo json_encode($files);
}


function getUser() {

    $db = getDB();
    $id = $_GET["id"];
    $response = array();
    $statement = $db->prepare("SELECT * FROM users where id=:id");
    $statement->bindValue("id", $id, PDO::PARAM_INT);
    $statement->execute();
    $files = $statement->fetchAll(PDO::FETCH_NAMED);

    echo json_encode($files);
}


function getAdditionalCountries() {
    $db = getDB();
    $id = $_GET["id"];
    $response = array();
    $statement = $db->prepare("SELECT * FROM event_countries where eventId=:id");
    $statement->bindValue("id", $id, PDO::PARAM_INT);
    $statement->execute();
    $files = $statement->fetchAll(PDO::FETCH_NAMED);
    echo json_encode($files);
}

function insertCountry(){

    if(!$_POST["name"]){
        $response = array("status" => 400, "message" => "ველი ქვეყანა სავალდებულოა");
        return json_encode($response);
    }else{
        $name = $_POST["name"];
    }
    $db=getDB();
    $statement = $db->prepare("INSERT INTO countries(
        name)
          VALUES
          (:name
  
       )");
      $statement->execute(array(
          "name" => $name
      ));

    $response = array("status"=>200, "message"=>"ქვეყანა $name დამატებულია");
    echo json_encode($response);
}


function insertStructure(){

    if(!$_POST["name"]){
        $response = array("status" => 400, "message" => "ველი სტრუქტურა სავალდებულოა");
        return json_encode($response);
    }else{
        $name = $_POST["name"];
    }
    $db=getDB();
    $statement = $db->prepare("INSERT INTO structures(
        name)
          VALUES
          (:name
  
       )");
      $statement->execute(array(
          "name" => $name
      ));

    $response = array("status"=>200, "message"=>"სტრუქტურა $name დამატებულია");
    echo json_encode($response);
}


function updateCountry(){
 $db=getDB();
 if(!$_POST["name"]){
    $response = array("status" => 400, "message" => "ველი ქვეყანა სავალდებულოა");
    return json_encode($response);
}
    try {
        unset($_POST["update_country"]);
        $id = $_POST["id"];
        unset($_POST["id"]);
        $post = $_POST;
        $n = array_keys($post);
        $this_new_arr = array();
        $fields = implode(", ", $n);
        $values = ":" . implode(", :", $n);
        $update_array = array();

        foreach ($n as $item) {
            $update_array[] = $item . "=:" . $item;
        }
        $fields_update = implode(", ", $update_array);

        $insert = "UPDATE  countries SET $fields_update WHERE  id=$id";
        $query = $db->prepare($insert);
        foreach ($post as $key => &$value) {
            switch (gettype($value)) {
                case 'integer':
                case 'double':
                    $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_INT);
                    break;
                default:
                    $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
            }
        }
        $query->execute();
        //$last_id = $db->lastInsertId();

        $response = array("status" => 200, "message" => "მონაცემები წარმატებით დარედაქტირდა ", "id" => $id);
        echo json_encode($response);
    } catch (Exception $e) {
        $response = array("status" => 400, "message" => "მოხდა შეცდომა", "error_name" => $e->getMessage());
        echo json_encode($response);

    }

}

function updateStructure(){
    $db=getDB();
    if(!$_POST["name"]){
       $response = array("status" => 400, "message" => "ველი ქვეყანა სავალდებულოა");
       return json_encode($response);
   }
       try {
           unset($_POST["update_structure"]);
           $id = $_POST["id"];
           unset($_POST["id"]);
           $post = $_POST;
           $n = array_keys($post);
           $this_new_arr = array();
           $fields = implode(", ", $n);
           $values = ":" . implode(", :", $n);
           $update_array = array();
   
           foreach ($n as $item) {
               $update_array[] = $item . "=:" . $item;
           }
           $fields_update = implode(", ", $update_array);
   
           $insert = "UPDATE  structures SET $fields_update WHERE  id=$id";
           $query = $db->prepare($insert);
           foreach ($post as $key => &$value) {
               switch (gettype($value)) {
                   case 'integer':
                   case 'double':
                       $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_INT);
                       break;
                   default:
                       $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
               }
           }
           $query->execute();
           //$last_id = $db->lastInsertId();
   
           $response = array("status" => 200, "message" => "მონაცემები წარმატებით დარედაქტირდა ", "id" => $id);
           echo json_encode($response);
       } catch (Exception $e) {
           $response = array("status" => 400, "message" => "მოხდა შეცდომა", "error_name" => $e->getMessage());
           echo json_encode($response);
   
       }
   
   }



    function  updateUser(){
        $response = array();
        $db = getDB();
        try {
            unset($_POST["update_users"]);
            $id = $_POST["user_id"];
            unset($_POST["user_id"]);
            $post = $_POST;
            $n = array_keys($post);
            $this_new_arr = array();
            $fields = implode(", ", $n);
            $values = ":" . implode(", :", $n);
            $update_array = array();
    
            foreach ($n as $item) {
                $update_array[] = $item . "=:" . $item;
            }
            $fields_update = implode(", ", $update_array);
    
            $insert = "UPDATE  users SET $fields_update WHERE  id=$id";
            $query = $db->prepare($insert);
            foreach ($post as $key => &$value) {
                switch (gettype($value)) {
                    case 'integer':
                    case 'double':
                        $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_INT);
                        break;
                    default:
                        $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
                }
            }
            $query->execute();
            //$last_id = $db->lastInsertId();
    
            $response = array("status" => 200, "message" => "მონაცემები წარმატებით დარედაქტირდა ", "id" => $id);
            echo json_encode($response);
        } catch (Exception $e) {
            $response = array("status" => 400, "message" => "მოხდა შეცდომა", "error_name" => $e->getMessage());
            echo json_encode($response);
    
        }
    }



    function updateTmpPass(){
        $db=getDB();
        $response=array();
        if(!empty($_SESSION['user_id'])){
            try{
                $current_pasword = $_POST["user_password_tmp"];
                $new_password = $_POST["user_password"];
                $new_password_confirm = $_POST["user_password_confirm"];
             $user_id = $_SESSION["user_id"];
            $user_info = $db->prepare("SELECT * FROM users WHERE id=:id"); 
            $user_info->bindParam("id", $user_id, PDO::PARAM_INT);
                    $user_info->execute();
                    $user = $user_info->fetch();
                     if(!$user){
                        $response = array("status" => 402, "message" => "მომხმარებელი არ მოიძებნა");
                     }else{
                         if($user["id"]!=$_SESSION["user_id"]){
                          
                             return false;
                         }else{
                            if(!password_verify($current_pasword, $user['password']) ){
                                $response = array("status" => 402, "message" => "ერთჯერადი პაროლი არასწორია");
                                echo  json_encode($response);
                                return;                            
                            }
                            if( $new_password=="" && $new_password_confirm==""){
                                $response = array("status" => 402, "message" => "პაროლის ველი სავალდებულოა");
                                echo  json_encode($response);
                                return;                            
                            }
    
                            if( $new_password!=$new_password_confirm){
                                $response = array("status" => 402, "message" => "პაროლები არ ემთხვევა ერთმანეთს");
                                echo  json_encode($response);
                                return;                            
                            }
    
    
                            $statement = $db->prepare('UPDATE `users` SET 
                            password=:password,
                            temporary=:temporary
                            where id=:user_id');
                      
                                $statement->execute(array(
                                "password" => password_hash($new_password, PASSWORD_DEFAULT),
                                "temporary" =>2,
                                "user_id"=>$user_id
                                 ));
                                 $_SESSION["tmp_pass"] =2;
                                 $tmp = $_SESSION["tmp_pass"];
                         }
                     }
                     $response = array("status" => 200, "message" => "პაროლი წარმატებით შეიცვალა","tmp" => $tmp);
                     echo  json_encode($response);
                     return;    
                }
            catch(PDOException $e) {
            echo '{"error":{"text":'. $e->getMessage() .'}}';
            }
            }
        
    
    }


    function updateEvent(){
    $db=getDB();
    if(!$_POST["name"]){
        $response = array("status"=>400, "message"=>"შეიყვანეთ ღონისძიების დასახელება");
        return json_encode($response);  
    }
    $id = $_POST["update_event_id"];    
    $name = $_POST["name"] ? $_POST["name"] : null;
    $type = $_POST["type"] ? $_POST["type"] : null;
    $face = $_POST["face"] ? $_POST["face"] : null;
    $relationship = $_POST["relationship"] ? $_POST["relationship"] : null;
    $status = $_POST["status"] ? $_POST["status"] : null;
    $startDate = $_POST["startDate"] ? $_POST["startDate"] : null;
    $endDate = $_POST["endDate"] ? $_POST["endDate"] : null;
    $quantity = $_POST["quantity"] ? $_POST["quantity"] : null;
    $place = $_POST["place"] ? $_POST["place"] : null;
    $reminder = $_POST["reminder"] ? $_POST["reminder"] : null;
    $about = $_POST["about"] ? $_POST["about"] : null;
    $comment = $_POST["comment"] ? $_POST["comment"] : null;
    $travel = $_POST["travel"] ? $_POST["travel"] : null;
    $eat = $_POST["eat"] ? $_POST["eat"] : null;
    $learn = $_POST["learn"] ? $_POST["learn"] : null;
    $transport = $_POST["transport"] ? $_POST["transport"] : null;
    $visit = $_POST["visit"] ? $_POST["visit"] : null;
    $other = $_POST["other"] ? $_POST["other"] : null;
    $other_text = $_POST["other_text"] ? $_POST["other_text"] : null;
    $place = $_POST["place"] ? $_POST["place"] : null;
    $districtId = $_POST["districtId"] ? $_POST["districtId"] : null; 
    $userId = $_SESSION["user_id"];
    $where = "";
    if($_SESSION["role"]=!1){
        $where.="AND userId = $userId";
    }
        
    $statement = $db->prepare("UPDATE events SET 
    `name`=:name,
    `type`=:type,
    `face`=:face,
    `relationship`=:relationship,
    `status`=:status,
    `startDate`=:startDate,
    `endDate`=:endDate,
    `quantity`=:quantity,
    `place`=:place,
    `reminder`=:reminder,
    `about`=:about,
    `comment`=:comment,
    `travel`=:travel,
    `eat`=:eat,
    `learn`=:learn,
    `transport`=:transport,
    `visit`=:visit,
    `other`=:other,
    `other_text`=:other_text,
    `place`=:place,
    `districtId`=:districtId
     where `id`=:id $where");

        $statement->execute(array(
        "name" => $name,
        "type" => $type,
        "face" => $face,
        "relationship" => $relationship,
        "status" => $status,
        "startDate" => $startDate,
        "endDate" => $endDate,
        "quantity" => $quantity,
        "place" => $place,
        "reminder" => $reminder,
        "about" => $about,
        "comment" => $comment,
        "travel" => $travel,
        "eat" => $eat,
        "learn" => $learn,
        "transport" => $transport,
        "visit" => $visit,
        "other" => $other,
        "other_text" => $other_text,
        "place" => $place,
        "userId" => $userId,
        "districtId" => $districtId,
        "id"=>$id
         ));

         if(!empty($_POST["structures"])){
       
            $dalate_blog_query=$db->prepare("DELETE FROM event_structures where eventId =:id");      
            $dalate_blog_query->bindParam("id", $id, PDO::PARAM_INT);      
            $dalate_blog_query->execute();

            foreach ($_POST["structures"] as $key => $val) {
        
                        $structures =$_POST["structures"][$key] ;        
                        $statement = $db->prepare("INSERT INTO event_structures(
                        eventId,
                        structureId
                        )
                    VALUES
                    (:eventId,
                    :structureId)");
                        $statement->execute(array(
                            "eventId" => $id,
                            "structureId" => $structures ,
                        ));        
                    }
                }


                if(!empty($_POST["cooperation"])){
                    foreach ($_POST["cooperation"] as $key => $val) {
                
                                $cooperation =$_POST["cooperation"][$key] ;        
                                $statement = $db->prepare("INSERT INTO event_cooperations(
                                cooperationId,
                                eventId
                                )
                            VALUES
                            (:cooperationId,
                            :eventId)");
                                $statement->execute(array(
                                    "cooperationId" => $cooperation,
                                    "eventId" => $id ,
                                ));        
                            }
                        }

         
    $response = array("status" => 200, "message" => "ღონისძიება წარმატებით დარედაქტირდა","tmp" => $userId);
    echo  json_encode($response);
    return;  
}



    
  


    function  insertDictionaryCooperation(){
       
    $response = array();
    $db = getDB();
    unset($_POST["insert_dictionary_cooperation"]);

    if(!$_POST["name"]){
    $response = array("status" => 400, "message" => "შეავსეთ ყველა სავალდებულო ველი");
    return json_encode($response);
    
    }

    $post = $_POST;
    $n = array_keys($post);
    $this_new_arr = array();
    $fields = implode(", ", $n);
    $values = ":" . implode(", :", $n);
    $insert = "INSERT INTO cooperations ($fields) VALUES ($values)";
    $query = $db->prepare($insert);
    foreach ($post as $key => &$value) {
        switch (gettype($value)) {
            case 'integer':
            case 'double':
                $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
                break;
            default:
                $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
        }
    }
    $query->execute();
    $id = $db->lastInsertId();

    $response = array("status" => 200, "message" => "ჩანაწერი წარმატებით დაემატა", "id" => $id);
    echo json_encode($response);
   }


   function  insertDictionaryType(){
       
    $response = array();
    $db = getDB();
    unset($_POST["insert_dictionary_type"]);

    if(!$_POST["name"]){
    $response = array("status" => 400, "message" => "შეავსეთ ყველა სავალდებულო ველი");
    return json_encode($response);
    
    }

    $post = $_POST;
    $n = array_keys($post);
    $this_new_arr = array();
    $fields = implode(", ", $n);
    $values = ":" . implode(", :", $n);
    $insert = "INSERT INTO types ($fields) VALUES ($values)";
    $query = $db->prepare($insert);
    foreach ($post as $key => &$value) {
        switch (gettype($value)) {
            case 'integer':
            case 'double':
                $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
                break;
            default:
                $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
        }
    }
    $query->execute();
    $id = $db->lastInsertId();

    $response = array("status" => 200, "message" => "ჩანაწერი წარმატებით დაემატა", "id" => $id);
    echo json_encode($response);
   }


   function updateDictionaryCooperation(){
    $db=getDB();
    if(!$_POST["name"]){
       $response = array("status" => 400, "message" => "ველი დასახელება სავალდებულოა");
       return json_encode($response);
   }
       try {
           unset($_POST["cooperation_dictionary_update"]);
           $id = $_POST["cooperation_id"];
           unset($_POST["cooperation_id"]);
           $post = $_POST;
           $n = array_keys($post);
           $this_new_arr = array();
           $fields = implode(", ", $n);
           $values = ":" . implode(", :", $n);
           $update_array = array();
   
           foreach ($n as $item) {
               $update_array[] = $item . "=:" . $item;
           }
           $fields_update = implode(", ", $update_array);
   
           $insert = "UPDATE  cooperations SET $fields_update WHERE  id=$id";
           $query = $db->prepare($insert);
           foreach ($post as $key => &$value) {
               switch (gettype($value)) {
                   case 'integer':
                   case 'double':
                       $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_INT);
                       break;
                   default:
                       $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
               }
           }
           $query->execute();
           //$last_id = $db->lastInsertId();
   
           $response = array("status" => 200, "message" => "მონაცემები წარმატებით დარედაქტირდა ", "id" => $id);
           echo json_encode($response);
       } catch (Exception $e) {
           $response = array("status" => 400, "message" => "მოხდა შეცდომა", "error_name" => $e->getMessage());
           echo json_encode($response);
   
       }
   
   }


   function updateDictionaryType(){

    $db=getDB();
    if(!$_POST["name"]){
       $response = array("status" => 400, "message" => "ველი დასახელება სავალდებულოა");
       return json_encode($response);
   }
       try {
           unset($_POST["types_dictionary_update"]);
           $id = $_POST["type_id"];
           unset($_POST["type_id"]);
           $post = $_POST;
           $n = array_keys($post);
           $this_new_arr = array();
           $fields = implode(", ", $n);
           $values = ":" . implode(", :", $n);
           $update_array = array();
   
           foreach ($n as $item) {
               $update_array[] = $item . "=:" . $item;
           }
           $fields_update = implode(", ", $update_array);
   
           $insert = "UPDATE  types SET $fields_update WHERE  id=$id";
           $query = $db->prepare($insert);
           foreach ($post as $key => &$value) {
               switch (gettype($value)) {
                   case 'integer':
                   case 'double':
                       $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_INT);
                       break;
                   default:
                       $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
               }
           }
           $query->execute();
           //$last_id = $db->lastInsertId();
   
           $response = array("status" => 200, "message" => "მონაცემები წარმატებით დარედაქტირდა ", "id" => $id);
           echo json_encode($response);
       } catch (Exception $e) {
           $response = array("status" => 400, "message" => "მოხდა შეცდომა", "error_name" => $e->getMessage());
           echo json_encode($response);
   
       }
   }


   function  insertDictionaryStatus() {  
    $response = array();
    $db = getDB();
    unset($_POST["insert_dictionary_status"]);

    if(!$_POST["name"]){
    $response = array("status" => 400, "message" => "შეავსეთ ყველა სავალდებულო ველი");
    return json_encode($response);
    
    }

    $post = $_POST;
    $n = array_keys($post);
    $this_new_arr = array();
    $fields = implode(", ", $n);
    $values = ":" . implode(", :", $n);
    $insert = "INSERT INTO status ($fields) VALUES ($values)";
    $query = $db->prepare($insert);
    foreach ($post as $key => &$value) {
        switch (gettype($value)) {
            case 'integer':
            case 'double':
                $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
                break;
            default:
                $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
        }
    }
    $query->execute();
    $id = $db->lastInsertId();

    $response = array("status" => 200, "message" => "ჩანაწერი წარმატებით დაემატა", "id" => $id);
    echo json_encode($response);
   }
  





   function updateDictionaryStatus(){

    $db=getDB();
    if(!$_POST["name"]){
       $response = array("status" => 400, "message" => "ველი დასახელება სავალდებულოა");
       return json_encode($response);
   }
       try {
           unset($_POST["status_dictionary_update"]);
           $id = $_POST["status_id"];
           unset($_POST["status_id"]);
           $post = $_POST;
           $n = array_keys($post);
           $this_new_arr = array();
           $fields = implode(", ", $n);
           $values = ":" . implode(", :", $n);
           $update_array = array();
   
           foreach ($n as $item) {
               $update_array[] = $item . "=:" . $item;
           }
           $fields_update = implode(", ", $update_array);
   
           $insert = "UPDATE  status SET $fields_update WHERE  id=$id";
           $query = $db->prepare($insert);
           foreach ($post as $key => &$value) {
               switch (gettype($value)) {
                   case 'integer':
                   case 'double':
                       $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_INT);
                       break;
                   default:
                       $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
               }
           }
           $query->execute();
           //$last_id = $db->lastInsertId();
   
           $response = array("status" => 200, "message" => "მონაცემები წარმატებით დარედაქტირდა ", "id" => $id);
           echo json_encode($response);
       } catch (Exception $e) {
           $response = array("status" => 400, "message" => "მოხდა შეცდომა", "error_name" => $e->getMessage());
           echo json_encode($response);
   
       }
   }

  
   
   function insertDictionaryRelationship(){

    $response = array();
    $db = getDB();
    unset($_POST["insert_dictionary_relationship"]);

    if(!$_POST["name"]){
    $response = array("status" => 400, "message" => "შეავსეთ ყველა სავალდებულო ველი");
    return json_encode($response);
    
    }

    $post = $_POST;
    $n = array_keys($post);
    $this_new_arr = array();
    $fields = implode(", ", $n);
    $values = ":" . implode(", :", $n);
    $insert = "INSERT INTO relations ($fields) VALUES ($values)";
    $query = $db->prepare($insert);
    foreach ($post as $key => &$value) {
        switch (gettype($value)) {
            case 'integer':
            case 'double':
                $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
                break;
            default:
                $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
        }
    }
    $query->execute();
    $id = $db->lastInsertId();

    $response = array("status" => 200, "message" => "ჩანაწერი წარმატებით დაემატა", "id" => $id);
    echo json_encode($response);
   }



   
   function updateDictionaryRelationship(){

    $db=getDB();
    if(!$_POST["name"]){
       $response = array("status" => 400, "message" => "ველი დასახელება სავალდებულოა");
       return json_encode($response);
   }
       try {
           unset($_POST["relationship_dictionary_update"]);
           $id = $_POST["relationship_id"];
           unset($_POST["relationship_id"]);

           
           $post = $_POST;
           $n = array_keys($post);
           $this_new_arr = array();
           $fields = implode(", ", $n);
           $values = ":" . implode(", :", $n);
           $update_array = array();
   
           foreach ($n as $item) {
               $update_array[] = $item . "=:" . $item;
           }
           $fields_update = implode(", ", $update_array);
   
           $insert = "UPDATE  relations SET $fields_update WHERE  id=$id";
           $query = $db->prepare($insert);
           foreach ($post as $key => &$value) {
               switch (gettype($value)) {
                   case 'integer':
                   case 'double':
                       $query->bindParam(':' . $key, $value != '' ? $value : null, PDO::PARAM_INT);
                       break;
                   default:
                       $query->bindValue(':' . $key, $value != '' ? $value : null, PDO::PARAM_STR);
               }
           }
           $query->execute();
           //$last_id = $db->lastInsertId();
   
           $response = array("status" => 200, "message" => "მონაცემები წარმატებით დარედაქტირდა ", "id" => $id);
           echo json_encode($response);
       } catch (Exception $e) {
           $response = array("status" => 400, "message" => "მოხდა შეცდომა", "error_name" => $e->getMessage());
           echo json_encode($response);
   
       }
   }


function removeRecord(){
    $db=getDB();
    if($_POST['remove_record']){
        $record = $_POST["record"];
        $id=$_POST['id'];        
          $dalate_blog_query=$db->prepare("DELETE FROM $record where id =:id");      
          $dalate_blog_query->bindParam("id", $id, PDO::PARAM_INT);      
          $dalate_blog_query->execute();
          $response = array("status" => 200, "message" => "ჩანაწერი წაშლილია");
          echo json_encode($response);

      }

}



function getNotifications(){

    $db = getDB();
    $userId= $_GET["userId"];
    $reservations=array();
    $statement = $db->prepare("SELECT * FROM notifications where userId=:userId");
    $statement->bindValue("userId",$userId,PDO::PARAM_INT);
    $statement->execute();
    while($notifications = $statement->fetch()){
        $id= $notifications["id"];
        $statement2 = $db->prepare("SELECT id,name,place,about,startDate FROM events where id=:id");
        $statement2->bindValue("id",$id,PDO::PARAM_INT);        
        $statement2->execute();
        while($event=$statement2->fetch()){
        $reservations[] = array (
         "id" => $id,
        "name" => $event['name'],
        "about" => $event['about'],
        "startDate" => $event['startDate'] ?  $event['startDate'] : ''
      );
    }
       
    }

    echo json_encode($reservations);

}


function removeCountry(){
    $db=getDB();
    if($_POST['remove_country']){
          $id = $_POST["id"];
          $id=$_POST['id'];        
          $dalate_blog_query=$db->prepare("DELETE FROM event_countries where id =:id");      
          $dalate_blog_query->bindParam("id", $id, PDO::PARAM_INT);      
          $dalate_blog_query->execute();
          $response = array("status" => 200, "message" => "ჩანაწერი წაშლილია");
          echo json_encode($response);

      }

}

function updateCountryEvent(){
 
    if(!$_POST["country"]){
        $response = array("status" => 404, "message" => "ქვეყანა სავალდებულოა");
        echo json_encode($response);
        return false;
    }
    $db=getDB();
	$id=$_POST['id'];
	$countryId=$_POST['country'];
	$dateFrom=$_POST['calendar'];
	$dateTo=$_POST['calendar_to'];

    

    $statement = $db->prepare('UPDATE `event_countries` SET 
      `countryId`=:countryId,
      `dateFrom`=:dateFrom,
      `dateTo`=:dateTo
      where `id`=:id');

          $statement->execute(array(
          "countryId" => $countryId,
          "dateFrom" => $dateFrom,
          "dateTo" => $dateTo,
          "id" => $id
           ));

           $response = array("status" => 200, "message" => "ჩანაწერი დარედაქტირებულია");
           echo json_encode($response);
}


function countEvents(){

    $db = getDB();
    $userId= $_SESSION["user_id"];
    $response = array();
    $current = $db->query("SELECT count(1) FROM events where status=1 and userId=$userId")->fetchColumn();
    $process = $db->query("SELECT count(1) FROM events where  status=2 and userId=$userId")->fetchColumn();
    $finished = $db->query("SELECT count(1) FROM events where  status=3 and userId=$userId")->fetchColumn();
    $rejected = $db->query("SELECT count(1) FROM events where  status=4 and userId=$userId")->fetchColumn();

    $response=array("current"=>$current,"process"=>$process,"finished"=>$finished,"rejected"=>$rejected);

    return $response;

}

function getCounters(){
    $db = getDB();
    $response = array();
    $current = $db->query("SELECT count(1) FROM events where status=1 ")->fetchColumn();
    $process = $db->query("SELECT count(1) FROM events where  status=2 ")->fetchColumn();
    $finished = $db->query("SELECT count(1) FROM events where  status=3 ")->fetchColumn();
    $rejected = $db->query("SELECT count(1) FROM events where  status=4 ")->fetchColumn();

    $response=array("current"=>$current,"process"=>$process,"finished"=>$finished,"rejected"=>$rejected);

    return json_encode($response);
}
?>