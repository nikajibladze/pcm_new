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



## Total number of records without filtering
$stmt = $conn->prepare("SELECT COUNT(*) AS allcount FROM users  ");
$stmt->execute();
$records = $stmt->fetch();
$totalRecords = $records['allcount'];

## Total number of records with filtering
$stmt = $conn->prepare("SELECT COUNT(*) AS allcount FROM users  ");
$stmt->execute($searchArray);
$records = $stmt->fetch();
$totalRecordwithFilter = $records['allcount'];

## Fetch records
$stmt = $conn->prepare("SELECT * FROM users  ORDER BY ".$columnName." ".$columnSortOrder." LIMIT :limit,:offset");

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
$role = "";
if($row['role']==1){
    $role="ადმინისტრატორი";
}elseif($row['role']==2){
    $role="მომხმარებელი";
}
elseif($row['role']==3){
    $role="მნახველი";
}

$edit = "";
$pass = "<span class='fa fa-key' onclick='editPass($id)'></span>";

      $data[] = array(
     "id"=>$row['id'],
	  "name"=>$row['name'],
      "lastname"=>$row['lastname'],
      "username"=>$row['username'],
      "role"=> $role,
      "structure"=>getStructure($row['structure']),
      "edit"=>$edit . " " .$pass
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