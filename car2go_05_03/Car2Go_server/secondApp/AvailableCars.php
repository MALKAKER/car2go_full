<?php
try 
{  
	require 'DB_Manage.php';
	if(isset($_REQUEST["locationNumber"]))
	{
		$locationNumber = $_REQUEST["locationNumber"];
		$sql = "SELECT * FROM `cars` WHERE `locationNumber`='$locationNumber' AND `carStatus`=true";
	}
	else
	{
		$sql = "SELECT * FROM `cars` WHERE `carStatus`=true";
	}
	$result = $conn->query($sql);  $data = array();
	if ($result->num_rows > 0) 
	{   
		// output data of each row    
		while ($row = $result->fetch_assoc()) 
		{    
			array_push($data, $row);   
		}    
		echo json_encode(array('availableCars' => $data));
	}  
	else 
	{   
		echo "";  
	} 
} 
catch(Exception $e) 
{ 
	echo "Exception Error See Log....";
	error_log($e->getMessage() , 0);
}  
$conn->close(); 
?>  