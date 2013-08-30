<?php

/**
document here
*/
function createConnection()
{
	$conn = new mysqli("localhost", "root", "", "TutorMeDatabase");
	if (mysqli_connect_errno())
	{
		die ("error connecting to database");
		return null;
	}
	return $conn;
} 


/**
document here
*/
function getcourseIdFromCourse ($courseName)
{
	$conn = createConnection();
	$result = array("error" => null, "result"=>array());
	$retrievedCourseId = nil; 
	if (!$conn)
		return;
	$query = "select distinct courseId from course where course_name = ?";
	$statement = $conn->prepare($query);
	$statement->bind_param("s",$courseName);
	if (!$statement->execute())
		return (json_encode($result["error"] = "Failed to execute"));
	
	if (!$statement->bind_result($retrievedCourseId))
		return (json_encode($result["error"] = "Failed to bind"));
	
	while ($statement->fetch())
	{
		array_push($result["result"], $retrievedCourseId);
	}
	$statement->close();
	$conn->close();

	
	return getuserIdFromcourseId($retrievedCourseId);	
	//return $result;	
}
function getuserIdFromcourseId ($courseId)
{	//$courseName='CS 46B';
	$conn = createConnection();
	//$resultArr = array("error" => null, "resultData"=>array());
	$resultArr=array();
	$error;
	$retrievedUserId = nil; 
	if (!$conn)
		return;
	$query = "select distinct uId from user_has_courses where courseId = ?";
	$statement = $conn->prepare($query);
	$statement->bind_param("s",$courseId);
	if (!$statement->execute())
		return (json_encode($error = "Failed to execute"));
	
	if (!$statement->bind_result($retrievedUserId))
		return (json_encode($error = "Failed to bind"));
	
	while ($statement->fetch())
	{
		array_push($resultArr, $retrievedUserId);
	}
	$statement->close();
	$conn->close();
	
	return getuserNameFromuserId($resultArr);
}
function getuserNameFromuserId ($userId)
{	
	
	$error;
	$resultUserArr = array("error"=>null,"resultUserData"=>array(), "resultUserFees"=>array());
	
	$retrievedUsername=nil ;
	$retrievedUfees=nil;
	//$fullname= array("lname"=>null,"fname"=>null); 
	$id=' ';
	foreach($userId as $rows)
	{	$id=$rows;

		$conn = createConnection();
		if (!$conn)
			return;
		$query = "select concat_ws(' ',lastname,firstname)as fullname, fees from userprofile where uId = ?";
		$statement = $conn->prepare($query);
		$statement->bind_param("s",$id);
		
		if (!$statement->execute())
		return (json_encode($resultUserArr["error"] = "Failed to execute"));
		
		if(!$statement->bind_result($retrievedUsername, $retrievedUfees))
			return (json_encode($resultUserArr["error"] = "Failed to bind"));
	
	
		while ($statement->fetch())
		{
			array_push($resultUserArr["resultUserData"],$retrievedUsername);
			array_push($resultUserArr["resultUserFees"],$retrievedUfees);
			//array_push($resultUserArr["col2"], $col2);
		}
	
		$statement->close();
		$conn->close();
	}
	
	return $resultUserArr;	
}
$courseName = $_POST['courseName'];
//$courseName='CS 100W';
echo (json_encode(getcourseIdFromCourse($courseName)));

?>