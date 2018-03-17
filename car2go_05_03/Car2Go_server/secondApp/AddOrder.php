<?php 
try { 
	require 'DB_Manage.php'; 
	
	$clientNumber = $_REQUEST["clientNumber"];
	$carNumber = $_REQUEST["carNumber"];
	$startRent  = $_REQUEST["startRent"];
	
	$initDetails = $conn->query("SELECT `fuelMode`, `mileage` FROM `cars` WHERE `licencePlate`='$carNumber';");
	$tmp = $initDetails->fetch_assoc();
	$startMileage = $tmp["mileage"];
	$fuelVol  = $tmp["fuelMode"];
	
	switch ($fuelVol) {
		case "Empty":
			$fuelVol = 0;
			break;
		case "Low":
			$fuelVol = 20;
			break;
		case "Medium":
			$fuelVol = 35;
			break;
		case "Full":
			$fuelVol = 50;
			break;
	}
	$sql = "INSERT INTO `orders`(`clientNumber`, `carNumber` , `startMileage` , `fuelVol`, `startRent`)
	VALUES ('$clientNumber', '$carNumber', '$startMileage', '$fuelVol', '$startRent')"; 

	$updateCar = "UPDATE `cars` SET `carStatus` = 'false' WHERE `licencePlate` = '$carNumber';";
	
	if ($conn->query($updateCar) and $conn->query($sql) === TRUE  ) 
	{ 
		$last_id = $conn->insert_id;
		echo $last_id; 
	}
	else
	{  
		echo "Error: " . $sql . "\n" . $conn->error;
	} 
}
catch(Exception $e) {
	echo "Exception Error See Log...."; 
	error_log($e->getMessage() , 0); 
} 
$conn->close(); 
?> 