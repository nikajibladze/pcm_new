<?php 
include '../config.php';
include '../functions.php';
$conn=getDB();
## Read value
$draw = $_GET['draw'];
$row = $_GET['start'];
$rowperpage = $_GET['length']; // Rows display per page
$columnIndex = $_GET['order'][0]['column']; // Column index
$columnName = $_GET['columns'][$columnIndex]['data']; // Column name
$columnSortOrder = $_GET['order'][0]['dir']; // asc or desc
$searchValue = $_GET['search']['value']; // Search value
$searchArray = array();
$doctor_id = $_SESSION['user_id'] ;
$where="";
$where2 = "";

if(!empty($_GET["status"])){
 $where2 .=" AND status=".$_GET["status"];
}

if(!empty($_GET["type"])){
    $where2 .=" AND type=".$_GET["type"];
   }

   if(!empty($_GET["startDate"])){
    $startDate = $_GET["startDate"];
    $where2 .=" AND startDate >='$startDate' ";
   }

   if(!empty($_GET["endDate"])){
    $endDate = $_GET["endDate"];
    $where2 .=" AND endDate <='$endDate' ";
   }

   if(!empty($_GET["cooperation"])){
    $cooperation = $_GET["cooperation"];
    $where2 .=" AND cooperation='$cooperation' ";
   }


   if(!empty($_GET["relationship"])){
    $relationship = $_GET["relationship"];
    $where2 .=" AND relationship=$relationship ";
   }

   if(!empty($_GET["face"])){
    $face = $_GET["face"];
    $where2 .=" AND face=$face ";
   }

     
   if(!empty($_GET["structures"])){
      $structures = array();
      $structures = $_GET["structures"];
      $response =   getEventStructures($structures);
      $where2 .=" AND id IN ($response) ";
     }

     
     if(!empty($_GET["country"])){
      $country = array();
      $country = $_GET["country"];
      $response =   getEventCountries($country);
      $where2 .=" AND id IN ($response) ";

     }
     if(!empty($_GET["cooperations"])){
      $cooperations = array();
      $cooperations = $_GET["cooperations"];
      $cooperationIds =   getEventCooperations($cooperations);
        
      $where2 .=" AND id IN ( $cooperationIds ) ";

    

     }

   
   $where.=" where userId is not null ";

   
//    if($_SESSION["role"]!=1){
//     $user_id = $_SESSION["user_id"];
//     $where.=" WHERE user_id=$user_id ";

//    }else{
//     $where.=" where id>1 ";
//    }

// if(!empty($_GET["visit_number"])){
//    $where2 .=" AND a.medical_visit_number=".$_GET["visit_number"];
//  }

//  if(!empty($_GET["history"])){
//    $where2 .=" AND a.history_number=".$_GET["history"];
//  }

//  if(!empty($_GET["personal"])){
//    $where2 .=" AND a.personal_no=".$_GET["personal"];
//  }
// if(!array_search(1, $_SESSION["roles"])) {
   
//    $where =" WHERE (doctor_id= $doctor_id or id in (select visit_id from med_visits_doctor_on_duty where doctor_id = $doctor_id )
//    or id in (select visit_id from med_visits_doctor_specialist where doctor_id = $doctor_id)) ";
// }
//echo $where2;
//die;
## Total number of records without filtering
$stmt = $conn->prepare("SELECT COUNT(*) AS allcount FROM events $where $where2 ");
$stmt->execute();
$records = $stmt->fetch();
$totalRecords = $records['allcount'];

## Total number of records with filtering
$stmt = $conn->prepare("SELECT COUNT(*) AS allcount FROM events $where $where2 ");
$stmt->execute($searchArray);
$records = $stmt->fetch();
$totalRecordwithFilter = $records['allcount'];

## Fetch records
$stmt = $conn->prepare("SELECT * FROM events $where $where2 ORDER BY " . $columnName . " " . $columnSortOrder . " LIMIT :limit,:offset");

// echo "SELECT (select 1 from med_visits_doctor_on_duty k
// where doctor_id = $doctor_id
// and k.visit_id = a.id
// union all
// select 2 from med_visits_doctor_specialist h
// where doctor_id = $doctor_id
// and h.visit_id = a.id) as doctor_type ,
// a.* 
// from med_visits a  $where $where2   ORDER BY id desc LIMIT :limit,:offset";

// die;
// Bind values
foreach($searchArray as $key=>$search){
   $stmt->bindValue(':'.$key, $search,PDO::PARAM_STR);
}

$stmt->bindValue(':limit', (int)$row, PDO::PARAM_INT);
$stmt->bindValue(':offset', (int)$rowperpage, PDO::PARAM_INT);
$stmt->execute();
$empRecords = $stmt->fetchAll();

$data = array();

foreach($empRecords as $row){
    $id=$row['id'];
    
    $face ="";
    if($row['face']==1){
       $face ="შიდა";
    }elseif($row['face']==2){
       $face ="გარე";
    }
    $edit = "<i class='fa fa-edit'></i>";
    
    
          $data[] = array(
         "id"=>$row['id'],
          "name"=>$row['name'],
         "type"=>getTypes($row['type']),
         "country"=>getCountry($row['country']),
          "relationship"=>getRealtion($row['relationship']),
          "structure"=>getStructure($row['structure']),
          "face"=>$face,
          "cooperation"=>getCooperation($row['cooperation']),
          "startDate"=>$row['startDate'] ." / " .$row['startDate'],
          "status"=>getStatus($row['status']),
          "edit"=>$edit
       );
    }
    

## Response
$response = array(
   "draw" => intval($draw),
   "iTotalRecords" => $totalRecords,
   "iTotalDisplayRecords" => $totalRecordwithFilter,
   "aaData" => $data
);

echo json_encode($response);


?>