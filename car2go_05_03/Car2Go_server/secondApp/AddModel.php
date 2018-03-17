<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["model"])) 
		$model = $_REQUEST["model"]; 
	else  
		$model = 'NULL'; 
	$modelName = $_REQUEST["modelName"];
	$engineVol = $_REQUEST["engineVol"];
	$carColor = $_REQUEST["carColor"]; 
	$isGearBox = $_REQUEST["isGearBox"];
	$isLimitMileage = $_REQUEST["isLimitMileage"];
	$mileageNumber = $_REQUEST["mileageNumber"];
	$numberOfSeats = $_REQUEST["numberOfSeats"]; 
	$trunkHeight = $_REQUEST["trunkHeight"];
	$trunkWidth = $_REQUEST["trunkWidth"];
	$airConditioning = $_REQUEST["airConditioning"];
	$isSafetySystem = $_REQUEST["isSafetySystem"]; 
	$carCompany = $_REQUEST["carCompany"];
	$safetyType = $_REQUEST["safetyType"];
	$pollutionLevel = $_REQUEST["pollutionLevel"];
	
	
	$sql = "INSERT INTO `models`( `model`, `modelName`, `engineVol`, `mileageNumber`, `pollutionLevel`,`numberOfSeats`, `trunkHeight`, `trunkWidth`, `isGearBox`, `isLimitMileage`, `airConditioning`, `isSafetySystem`, `carCompany`, `safetyType`, `carColor`)
	VALUES ('$model', '$modelName', '$engineVol', '$mileageNumber', '$pollutionLevel', '$numberOfSeats', '$trunkHeight', '$trunkWidth', '$isGearBox', '$isLimitMileage', '$airConditioning', '$isSafetySystem', '$carCompany', '$safetyType', '$carColor')";  
	
	if ($conn->query($sql) === TRUE) 
	{ 
		echo $model; 
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