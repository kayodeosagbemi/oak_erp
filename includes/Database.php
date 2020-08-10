<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
        $servername="localhost";
	$dbname="oak_erp_db";
	$dbUsername="root";
	$dbPassword="";
	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $dbUsername, $dbPassword);
        // set the PDO error mode to exception
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

	/**
	 * Get the value of a form element whose name is @param $form_element_name_id and the <code>FORM</code> method is
	 * @param $method. If the method is not specified, then POST is assumed.
	*/
	function input($form_element_name_id, $method="post") 
	{
		switch(strtolower($form_element_name_id))
		{
			case "post":
				return $_POST[$form_element_name_id];
			break;
			case "get":
				return $_GET[$form_element_name_id];
			break;
			default:
			throw new Exception("This form method is not supported");
		break;
		}
	}
?>