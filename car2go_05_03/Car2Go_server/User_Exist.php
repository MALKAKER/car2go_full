<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["clientID"])) 
		$clientID = $_REQUEST["clientID"]; 
	else  
		throw 'Error' ;
	$sql = "SELECT clientID FROM `users` WHERE clientID='$clientID'";
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