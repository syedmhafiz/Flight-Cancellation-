<html>
    <body>
        <form action="canceledfinal.php" method="POST">
            Enter Remaining days untill Takeoff: <input type="text" name="date">
            Enter Flight ID: <input type="text" name="flt_id">
        <input type="submit" value="Show Info">
        </form>
    </body>
</html>


<?php

require("dbcon.php");
$u_id = $_REQUEST['Booked_for'];
$sql = "SELECT * FROM flight WHERE Booked_for= '$u_id'";
$result = mysqli_query($conn, $sql);

echo "Booked Fligts are: <br>";
if (mysqli_num_rows($result) > 0){

    while($row = mysqli_fetch_assoc($result)){
        echo "Flight ID :   ".$row['flt_id']. ", "."Destination is from ".$row['from_IATA']. " to ".$row['to_IATA']." Take-off: ".$row['Departure_date']."<br>";
    }
}else{
    echo "No Flights Booked yet";
}
mysqli_close($conn)
?>