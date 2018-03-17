<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["licencePlate"])) 
		$licencePlate = $_REQUEST["licencePlate"]; 
	else  
		throw 'Error';
	$sql = "SELECT licencePlate FROM `cars` WHERE licencePlate='$licencePlate'";
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0) 
	{
		echo 'True';
	}
	else 
	{
		echo 'False';
	}
}
catch(Exception $e) {
	echo "Exception Error See Log...."; 
	error_log($e->getMessage() , 0); 
} 
$conn->close(); 
?> 