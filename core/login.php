<?php
    session_start();
    include('config.php');
    $response = "";
    if (isset($_POST['login'])) {
        $db=getDB();
         $username = $_POST['user_name'];
         $password = $_POST['password'];
        $query = $db->prepare("SELECT * FROM users WHERE username=:username");
        $query->bindParam("username", $username, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch();             
        if (!$result) {
            $response="<div class='alert alert-danger text-center'><b>მომხმარებლის პაროლი ან სახელი არასწორია</b></div>";       
        } else {            
            if (password_verify($password, $result['password'])) {
                $roles_array = array();               
                $_SESSION['username'] = $result['username'];
              
                $response="<div class='alert alert-success text-center'><b>მომხმარებლის მონაცემები სწორია</b></div>";
                $_SESSION["role"] = $result['role'];
                $_SESSION['user_id'] = $result['id'];
                $_SESSION['tmp_pass'] = $result['temporary'];
                // var_dump($_SESSION);
                // die;
               header("location:index.php");
             
            } else {
                //echo '<p class="error">Username password combination is wrong!</p>';
                $response="<div class='alert alert-danger text-center'><b>მომხმარებლის პაროლი ან სახელი არასწორია</b></div>";
            }
        }
    }
?>