<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["model"])) 
		$model = $_REQUEST["model"]; 
	else  
		throw 'Error' ;
	$sql = "SELECT model FROM `models` WHERE model='$model'";
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