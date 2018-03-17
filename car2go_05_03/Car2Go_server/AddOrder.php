<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["orderNumber"])) 
		$orderNumber = $_REQUEST["orderNumber"]; 
	else  
		$orderNumber = 'orderNumber'; 
	$clientNumber = $_REQUEST["clientNumber"];
	$orderStatus = $_REQUEST["orderStatus"];
	$carNumber = $_REQUEST["carNumber"];
	$startRent  = $_REQUEST["startRent"];
	$endRent = $_REQUEST["endRent"];
	$startMileage = $_REQUEST["startMileage"];
	$endMileage = $_REQUEST["endMileage"];
	$isFuel = $_REQUEST["isFuel"];
	$fuelVol  = $_REQUEST["fuelVol"];
	$billAmount = $_REQUEST["billAmount"];
	 	
	$sql = "INSERT INTO `orders`( `orderNumber`, `clientNumber`, `carNumber` , `startMileage` , `endMileage` , `fuelVol`,  `billAmount`, `startRent` , `endRent` , `orderStatus` , `isFuel`)
	VALUES ('$orderNumber', '$clientNumber', '$carNumber', '$startMileage', '$endMileage', '$fuelVol', '$billAmount', '$startRent', '$endRent', '$orderStatus', '$isFuel')";  
	
	if ($conn->query($sql) === TRUE) 
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