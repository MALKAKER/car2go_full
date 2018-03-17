<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["branchNumber"])) 
		$branchNumber = $_REQUEST["branchNumber"]; 
	else  
		throw 'Error' ;
	$sql = "SELECT branchNumber FROM `branches` WHERE branchNumber='$branchNumber'";
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0) 
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