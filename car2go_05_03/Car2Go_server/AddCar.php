<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["licencePlate"])) 
		$licencePlate = $_REQUEST["licencePlate"]; 
	else  
		$licencePlate = 'NULL'; 
	$mileage = $_REQUEST["mileage"];
	$modelType = $_REQUEST["modelType"];
	$locationNumber = $_REQUEST["locationNumber"]; 
	$fuelMode = $_REQUEST["fuelMode"];
	
	$sql = "INSERT INTO `cars`( `locationNumber`, `modelType`, `mileage`, `licencePlate`, `fuelMode`)
	VALUES ('$locationNumber', '$modelType', '$mileage', '$licencePlate', '$fuelMode')";  
	
	if ($conn->query($sql) === TRUE) 
	{ 
		echo $licencePlate;
	}
	else
	{  
		echo null;
	} 
}
catch(Exception $e) {
	echo "Exception Error See Log...."; 
	error_log($e->getMessage() , 0); 
} 
$conn->close(); 
?> 