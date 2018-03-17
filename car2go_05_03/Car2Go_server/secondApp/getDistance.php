<?php>
	/**
	*
	* Author: CodexWorld
	* Function Name: getDistance()
	* $addressFrom => From address.
	* $addressTo => To address.
	* $unit => Unit type.
	*
	**/
	
	require 'DB_Manage.php';
	function getDistance($addressFrom, $addressTo, $unit){
		//Change address format
		$formattedAddrFrom = str_replace(' ','+',$addressFrom);
		$formattedAddrTo = str_replace(' ','+',$addressTo);

		//Send request and receive json data
		$geocodeFrom = file_get_contents('http://maps.google.com/maps/api/geocode/json?address='.$formattedAddrFrom.'&sensor=false');
		$outputFrom = json_decode($geocodeFrom);
		$geocodeTo = file_get_contents('http://maps.google.com/maps/api/geocode/json?address='.$formattedAddrTo.'&sensor=false');
		$outputTo = json_decode($geocodeTo);

		//Get latitude and longitude from geo data
		$latitudeFrom = $outputFrom->results[0]->geometry->location->lat;
		$longitudeFrom = $outputFrom->results[0]->geometry->location->lng;
		$latitudeTo = $outputTo->results[0]->geometry->location->lat;
		$longitudeTo = $outputTo->results[0]->geometry->location->lng;

		//Calculate distance from latitude and longitude
		$theta = $longitudeFrom - $longitudeTo;
		$dist = sin(deg2rad($latitudeFrom)) * sin(deg2rad($latitudeTo)) +  cos(deg2rad($latitudeFrom)) * cos(deg2rad($latitudeTo)) * cos(deg2rad($theta));
		$dist = acos($dist);
		$dist = rad2deg($dist);
		$miles = $dist * 60 * 1.1515;
		$unit = strtoupper($unit);
		if ($unit == "K") {
			return ($miles * 1.609344);  #.' km'
		} else if ($unit == "N") {
			return ($miles * 0.8684); #.' nm'
		} else {
			return $miles; # .' mi'
    	}
	}
	try{
		if (isset($_REQUEST["radius"]))
		{
			$radius = $_REQUEST["radius"]; 
			$loc = $_REQUEST["loc"]; 
		}
		else  
			throw new Exception('Error') ;
		#$addressFrom = 'Beitar';
		#$addressTo = 'Jerusalem';
		#$distance = getDistance($addressFrom, $addressTo, "K");
		
		$getBranches = $conn->query("SELECT `branchAddress`, `branchNumber` FROM `branches`;");
		$branches =array();
		// output data of each row    
		while ($branch = $getBranches->fetch_assoc()) 
		{    
			$distance = getDistance($loc, $branch['branchAddress'], "K");
			#echo var_dump($distance)." ".var_dump($radius)." ".((int)$distance <= (int)$radius );
			if ((int)$distance <= (int)$radius ){
				array_push($branches, $branch['branchNumber']);  
			}
			#echo $branch['branchAddress'].",".$distance.",";
		} 
		$cars =array();
		foreach ($branches as $value) {
			#echo $value." ";
			$sql = "SELECT * FROM `cars` WHERE `locationNumber`='$value' AND `carStatus`=true;";
			$result = $conn->query($sql);
			
			# output data of each row    
			while ($row = $result->fetch_assoc()) 
			{    
				array_push($cars, $row);   
			}    
		}
		
		#echo js;
		if(count($cars)!=0)
			{echo json_encode(array('cars' => $cars));}
		else
		{echo null;}

		#echo $distance;
	}
	catch(Exception $e) 
	{ 
		echo "Exception Error See Log....";
		error_log($e->getMessage() , 0);
	}  
	$conn->close(); 
?>