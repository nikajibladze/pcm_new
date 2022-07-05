<?php
require '../vendor/autoload.php';
require_once('reportFunctions.php');
require_once('config.php');
$db=getDB();
$where = '';
 if(!empty($_POST["relationship"])){
    $where.='AND relationship='.$_POST['relationship'];
 }
 if(!empty($_POST["status"])){
  $where.='AND status='.$_POST['status'];
}

if(!empty($_POST["type"])){
  $where.='AND status='.$_POST['type'];
}
if(!empty($_POST["face"])){
  $where.='AND status='.$_POST['face'];
}

if(!empty($_POST["startDate"])){
  $startDate = $_POST["startDate"];
  $where2 .=" AND startDate >='$startDate' ";
 }

 if(!empty($_POST["endDate"])){
  $endDate = $_POST["endDate"];
  $where2 .=" AND endDate <='$endDate' ";
 }

//  if(!empty($_POST["municipality_id"])){
//   $where.=' AND a.municipality_id='.$_POST['municipality_id'];
// }

// if(!empty($_POST["object_id"])){
//   $where.=' AND a.id='.$_POST['object_id'];
// }

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
$date = date('Y-m-d');
$filename= "report_pcm_$date.xlsx";
$spreadsheet = new Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();
$sheet->setCellValue('A1', 'ნუმერაცია');
$sheet->setCellValue('B1', 'ღონისძიების ტიპი');
$sheet->setCellValue('C1', 'ქვეყანა');
$sheet->setCellValue('D1', 'საერთაშორისო ურთოერთობები');
$sheet->setCellValue('E1', 'პასუხისმგებელი სტრუქტურა');
$sheet->setCellValue('F1', 'ღონისძიების სახე');
$sheet->setCellValue('G1', 'თანამშრომლობის სფერო');
$sheet->setCellValue('H1', 'დაწყების/დამთავრების დრო');
$sheet->setCellValue('I1', 'სტატუსი');
$sheet->setCellValue('J1', 'რაოდენობა');

$statement = $db->prepare("SELECT * FROM events where id>0  $where ");
$statement->execute();
$numbering = 1;
$counter = 2;

while($data=$statement->fetch()){

    $sheet->setCellValue("A$counter", $numbering);
    $sheet->setCellValue("B$counter", $data["name"]);
    $sheet->setCellValue("C$counter",  countryId($data["id"]));
    $sheet->setCellValue("D$counter", getRealtion($data["relationship"]));
    $sheet->setCellValue("E$counter",  structureId($data["id"]));
    $sheet->setCellValue("F$counter", $data["face"]);
    $sheet->setCellValue("G$counter", cooperationId($data["id"]));
    $sheet->setCellValue("H$counter", $data["startDate"]." / " .$data["endDate"]);
    $sheet->setCellValue("I$counter", getStatus($data["status"]) );
    
    $counter++;
    $numbering++;

   
}
$sum = $numbering -1;
$sheet->setCellValue("J$counter","სულ ჯამში: ". $sum); 
foreach(range('A',"J") as $col){
    $sheet->getColumnDimension($col)->setAutoSize(true);
   
    $sheet->getStyle($col)
    ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $sheet->getStyle($col)
    ->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);   
  }
  $sheet->getStyle("A1:J1"."1")->applyFromArray(
    array(
       'font'  => array(
           'bold'  =>  true,
           'size' => 12
       )    
    )
  );
  $sheet->getStyle("J$counter"."1")->applyFromArray(
    array(
       'font'  => array(
           'bold'  =>  true,
           'size' => 12
       )    
    )
  );
  $sheet->getStyle("A2:I2"."1")->applyFromArray(
    array(
       'font'  => array(
           'bold'  =>  false,
           'size' => 12
       )    
    )
  );
$writer = new Xlsx($spreadsheet);
header('Content-Type: application/vdn.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="'. urlencode($filename).'"');
$writer->save("php://output");

?>