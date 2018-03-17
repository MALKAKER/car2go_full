<?php 
try { 
	require 'DB_Manage.php'; 
	if (isset($_REQUEST["branchNumber"])) 
		$branchNumber = $_REQUEST["branchNumber"]; 
	else  
		$branchNumber = 'NULL'; 
	$branchAddress = $_REQUEST["branchAddress"];
	$parkingSpace = $_REQUEST["parkingSpace"];
	
	 
	
	
	
	$sql = "INSERT INTO `branches`( `parkingSpace`, `branchNumber`, `branchAddress`)
	VALUES ('$parkingSpace', '$branchNumber', '$branchAddress')";  
	
	if ($conn->query($sql) === TRUE) 
	{ 
		$last_id = $conn->insert_id;
		echo $last_id; 
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