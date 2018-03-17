<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["orderNumber"]) and isset($_REQUEST["kilometers"]) and isset($_REQUEST["endRent"] ) )
	{
		$orderNumber = $_REQUEST["orderNumber"];
		$kilometers = $_REQUEST["kilometers"]; 
		$endRent = $_REQUEST["endRent"];
		$billAmount = $_REQUEST["billAmount"];
		$locationNumber = $_REQUEST["locationNumber"];
	}
	else  
	{
		throw new Exception('Error'); 
	}
	$findStartMil = "SELECT `startMileage` FROM `orders` WHERE `orders`.`orderNumber` = '$orderNumber';";
	$result = $conn->query($findStartMil);
	$tmp = $result->fetch_assoc();
	$startMileage = $tmp['startMileage'];
	$total = (string)((float)$startMileage  +  (float)$kilometers);
	$tmp = $conn->query("SELECT `carNumber` FROM `orders` WHERE `orders`.`orderNumber` = '$orderNumber';"); 
	$tmp1 = $tmp->fetch_assoc();
	$licencePlate = $tmp1['carNumber'];
	if(isset($_REQUEST["isFuel"]))
	{
		$isFuel = $_REQUEST["isFuel"] == 'true';
		$fuelVol = $_REQUEST["fuelVol"];
		#update order
		$sql = "UPDATE `orders` SET `endMileage` = '$total', `endRent` = '$endRent', `isFuel` ='$isFuel', `fuelVol`='$fuelVol', `billAmount`='$billAmount', `orderStatus`='false' WHERE `orders`.`orderNumber` = '$orderNumber';";
		if((int)$fuelVol > 40)
		{
			$fuelMode = 'Full';
		}else if((int)$fuelVol > 30)
		{
			$fuelMode = 'Medium';
		}else if((int)$fuelVol > 20)
		{
			$fuelMode = 'Low';
		}else
		{
			$fuelMode = 'Empty';
		}
		
		//update the car
		$updateCarSql = "UPDATE `cars` SET `mileage` = '$total', `carStatus`='true', `fuelMode`='$fuelMode', `locationNumber`='$locationNumber' WHERE `licencePlate` = '$licencePlate';";
	}
	else
	{
		$sql = "UPDATE `orders` SET `endMileage` = '$total', `endRent` = '$endRent', `isFuel`='false', `billAmount`='$billAmount', `orderStatus`='false' WHERE `orders`.`orderNumber` = '$orderNumber';";
		$updateCarSql = "UPDATE `cars` SET `carStatus`=true, `mileage` = '$total', `locationNumber`='$locationNumber' WHERE `licencePlate` = '$licencePlate';";
	}
	if ($conn->query($sql) === TRUE and $conn->query($updateCarSql) === TRUE) 
	{ 	
		#echo $sql."    ".$updateCarSql." orderNumber=".$orderNumber." kilometers=".$kilometers." endRent=".$endRent." billAmount=".$billAmount." locationNumber=".$locationNumber;
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