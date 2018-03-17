<?php
 header('Content-Type: text/html; charset=utf-8');
 $servername = "localhost"; 
 $username = "maker";
 $password = "malkithebest100"; 
 $dbname = "maker_rentCar_app";
 // Create connection 
 $conn = new mysqli($servername, $username, $password, $dbname);
 mysql_query("SET NAMES 'utf8'", $conn);  
 // Check connection 
 if ($conn->connect_error) {  die("Connection failed: " . $conn->connect_error); 
 } 
 ?> 