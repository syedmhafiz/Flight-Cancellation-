<?php
$servername="localhost";
$usrname= "root";
$password= "";
$dbname= "Flightt";

$conn= mysqli_connect($servername, $usrname, $password, $dbname);
if(!$conn){
    die("Connection was not succesful! ".mysqli_connect_error());

}
echo "Connected"."<br>"

?>