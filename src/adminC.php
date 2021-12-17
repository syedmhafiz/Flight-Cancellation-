<html>
    <body>
        <form action="canceledforA.php" method="POST">
            Enter Flight ID: <input type="text" name="flt_id">
        <input type="submit" value="Cancel This Flight">
        </form>
    </body>
</html>


<?php

require("dbcon.php");

$sql = "SELECT * FROM flight WHERE availability = '0'";
$result = mysqli_query($conn, $sql);

echo "Booked Fligts are: <br>";
if (mysqli_num_rows($result) > 0){

    while($row = mysqli_fetch_assoc($result)){
        echo "Flight ID :   ".$row['flt_id']. ", "."Destination is from ".$row['from_IATA']. " to ".$row['to_IATA']."<br>";
    }
}else{
    echo "No Flights Booked yet";
}
mysqli_close($conn)
?>