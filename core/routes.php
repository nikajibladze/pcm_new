<?php 
include("data/dictionary.php");
include("data/functions.php");
if(isset($_GET["countries"])){
   echo getCountries();

}

if(isset($_GET["cooperations"])){
    echo getCooperations();
 
 }


 if(isset($_GET["structures"])){
    echo getStructures();
 
 }

 if(isset($_GET["relations"])){
    echo getRelations();
 
 }


 if(isset($_GET["status"])){
    echo getStatus();
 
 }

 
 if(isset($_GET["types"])){
   echo getTypes();

}

if(isset($_GET["get_events_data"])){
   echo getEventsData();

}

if(isset($_POST["insert_event"])){
   echo insertEvent();

} 

if(isset($_POST["insert_file"])){
   echo insertFile();

}

if(isset($_GET["get_event_structures"])){
   echo getEventStructures();

}


if(isset($_GET["get_event_cooperations"])){
   echo getEventCooperations();

}

if(isset($_POST["insert_user"])){
   echo insertUser();

}

if(isset($_POST["get_event_file"])){
   echo getEventFile();

}

if(isset($_GET["select_additional_country"])){
   echo getAdditionalCountries();

}
if(isset($_POST["insert_country"])){
   echo insertCountry();

}
if(isset($_POST["insert_structure"])){
   echo insertStructure();

}
if(isset($_POST["update_country"])){
   echo updateCountry();

}

if(isset($_POST["update_structure"])){
   echo updateStructure();

}

if(isset($_GET["get_user"])){
   echo getUser();

}

if(isset($_POST["update_users"])){
   echo updateUser();

}
if(isset($_POST["reset_tmp_password"])){
   echo updateTmpPass();

}
if(isset($_POST["update_event_id"])){
   echo updateEvent();

}
if(isset($_POST["insert_dictionary_cooperation"])){
   echo insertDictionaryCooperation();

}

if(isset($_POST["cooperation_dictionary_update"])){
   echo updateDictionaryCooperation();

}

if(isset($_POST["insert_dictionary_type"])){
   echo insertDictionaryType();

}

if(isset($_POST["types_dictionary_update"])){
   echo updateDictionaryType();

}

if(isset($_POST["insert_dictionary_status"])){
   echo insertDictionaryStatus();

}

if(isset($_POST["status_dictionary_update"])){
   echo updateDictionaryStatus();

}
if(isset($_POST["insert_dictionary_relationship"])){
   echo insertDictionaryRelationship();

}

if(isset($_POST["relationship_dictionary_update"])){
   echo updateDictionaryRelationship();

}

if(isset($_POST["remove_record"])){
   echo removeRecord();

}

if(isset($_GET["get_notifications"])){
   echo getNotifications();

}
if(isset($_POST["remove_country"])){
   echo removeCountry();

}

if(isset($_POST["update_country_event"])){
   echo updateCountryEvent();

}



if(isset($_GET["get_counters"])){
   echo getCounters();

}


?>