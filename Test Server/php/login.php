<?php
/**
 *This is the script of login
 *@author Lam Lu
 */
require_once("Authentication.php");

$email = $emailInputFromUser;
$password = $passwordInputFromUser;


$p = '{"login":"passed"}';
$f = '{"login":"failed"}';
header("Content-Type: text/json");


if ((!isset($email) || !isset($password)) || 
		(empty($email) || empty($password))) //if email and password is not set yet or empty
    echo ($f);

	
else
{
	$authentication = new Authentication($email, $password);
	if($authentication->login())
		echo($p);
	else
	       echo($f);
		
}

//decode json $d = json_decode($e);	


?>