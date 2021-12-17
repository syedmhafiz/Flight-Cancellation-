<?php
require("dbcon.php");

$f_id = $_REQUEST['flt_id'];
$sql = "UPDATE flight SET Availability='1', Booked_for='Nobody' WHERE flt_id='$f_id'";

$result = mysqli_query($conn, $sql);
mysqli_close($conn);
?>