<?php
if((isset($_GET["logout"]))){
   if($_GET["logout"]==true){
       session_destroy();
       header('location:login.php');
  
   }
}

 

?>