<?php
require("dbcon.php");
$datee = $_REQUEST['date'];
$fixed = 15;
$fid = $_REQUEST['flt_id'];
$sql = "UPDATE flight SET Availability='1', Booked_for='Nobody' WHERE flt_id='$fid'";

$result = mysqli_query($conn, $sql);

if($datee<$fixed){
    echo "Refund Unavailable";
}else{
    echo "Refund Available";
}
mysqli_close($conn);
?>
