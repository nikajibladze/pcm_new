<?php
if (!$_GET) {
    if (empty($_GET["file"]) || empty($_GET["filename"])) {
        http_response_code(404);
        header('location:http://medical.ge/404.php');
        die;
    }
}

$file = $_GET["file"];
$filename = $_GET["filename"];
$file_name_exp = explode(".", $file);
$current_name = explode("/", $filename);
$getname = reset($file_name_exp);
$current = explode("/", $getname);
$this_name = $current[2];
$file_extention = end($file_name_exp);
$real_name = $file_name_exp[0];
$ext = $file_name_exp[1];

if ($file_extention == 'txt') {
    $file_extention_header = "text/plain";
    $file_attachment = '';
} elseif ($file_extention == 'TXT') {
    $file_extention_header = "application/pdf";
    $file_attachment = '';
} elseif ($file_extention == 'pdf') {
    $file_extention_header = "application/pdf";
    $file_attachment = '';
} elseif ($file_extention == 'PDF') {
    $file_extention_header = "application/pdf";
    $file_attachment = '';
} elseif ($file_extention == 'xlsx') {
    $file_extention_header = "application/vnd.ms-excel";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'XLSX') {
    $file_extention_header = "application/vnd.ms-excel";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'xls') {
    $file_extention_header = "application/vnd.ms-excel";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'XLS') {
    $file_extention_header = "application/vnd.ms-excel";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'docx') {
    $file_extention_header = "text/html; charset=UTF-8";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'DOCX') {
    $file_extention_header = "text/html; charset=UTF-8";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'doc') {
    $file_extention_header = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'DOC') {
    $file_extention_header = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'zip') {
    $file_extention_header = "application/zip";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'ZIP') {
    $file_extention_header = "application/zip";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'rar') {
    $file_extention_header = "application/rar";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'RAR') {
    $file_extention_header = "application/zip";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'pptx') {
    $file_extention_header = "application/vd.openxmlformats-officedocument.presentationml.presentation";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'PPTX') {
    $file_extention_header = "application/vd.openxmlformats-officedocument.presentationml.presentation";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'ppt') {
    $file_extention_header = "application/vnd.ms-powerpoint";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'PPT') {
    $file_extention_header = "application/vnd.ms-powerpoint";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'mp3') {
    $file_extention_header = "audio/mpeg";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'vsd') {
    $file_extention_header = "application/vnd.visio";
    $file_attachment = 'attachment; ';
} elseif ($file_extention == 'VSD') {
    $file_extention_header = "application/vnd.visio";
    $file_attachment = 'attachment; ';

} else {
    $file_extention_header = "image/pjpeg";
    $file_attachment = '';
}

// We'll be outputting a PDF
header("Content-Type:  $file_extention_header");
// It will be called downloaded.pdf
header('Content-Disposition: ' . $file_attachment . '; filename="' . $filename . '.' . $file_extention . '"');
// The PDF source is in original.pdf
readfile('../' . $file);
