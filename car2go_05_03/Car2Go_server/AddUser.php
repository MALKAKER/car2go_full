<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["clientID"])) 
		$clientID = $_REQUEST["clientID"]; 
	else  
		$clientID = 'NULL'; 
	$firstName = $_REQUEST["firstName"];
	$lastName = $_REQUEST["lastName"];
	$phoneNumber = $_REQUEST["phoneNumber"]; 
	$email = $_REQUEST["email"];
	$creditCard = $_REQUEST["creditCard"];
	$userName = $_REQUEST["userName"];
	$password = $_REQUEST["password"]; 
	
	
	
	$sql = "INSERT INTO `users`( `firstName`, `lastName`, `clientID`, `phoneNumber`, `email`,`creditCard`, `userName`, `password`)
	VALUES ('$firstName', '$lastName', '$clientID', '$phoneNumber', '$email', '$creditCard', '$userName', '$password')";  
	
	if ($conn->query($sql) === TRUE) 
	{ 
		
		echo $clientID; 
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