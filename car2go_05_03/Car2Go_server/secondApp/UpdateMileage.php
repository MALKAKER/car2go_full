<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["mileage"])) 
		$mileage = $_REQUEST["mileage"]; 
	else  
		$mileage = 0; 
	
	$licencePlate = $_REQUEST["licencePlate"]; 
	
	#fetching if the model have limitage in the mileage and the limit
	$isLimitQ = "SELECT `mileageNumber`,`isLimitMileage` FROM `models` WHERE `model` = (SELECT DISTINCT `modelType` FROM `cars` WHERE `licencePlate` = '$licencePlate')";
	$limitq = $conn->query($isLimitQ);
	#the answers
	$limit = $limitq->fetch_assoc();
	#fetch the current mileage
	$presql = "SELECT mileage FROM cars WHERE `licencePlate` = '$licencePlate'";
	$result = $conn->query($presql);
	$row = $result->fetch_assoc();
	#sum the new mileage
	$new = (string)($row['mileage'] + $mileage);
	#if the condition below is not true there is no query named $sql so the function will return false
	if (intval($limit['mileageNumber']) > intval($new) && (string)$limit['isLimitMileage'] === 'true' || (string)$limit['isLimitMileage'] === 'false')
	{
		$sql = "UPDATE cars SET `mileage`='$new' WHERE `licencePlate` = '$licencePlate'";
	}
	

	if ($conn->query($sql) === TRUE) 
	{ 		
		echo 'true'; 
	}
	else
	{  
		echo 'false';
	} 
}
catch(Exception $e) {
	echo "Exception Error See Log...."; 
	error_log($e->getMessage() , 0); 
} 
$conn->close(); 
?> 