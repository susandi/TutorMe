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
function getCourseFromMajor ($department)
{
	$conn = createConnection();
	$result = array("error" => null, "result"=>array());
	$retrievedCourse = nil; 
	if (!$conn)
		return;
	$query = "select distinct course_name from course where department = ?";
	$statement = $conn->prepare($query);
	$statement->bind_param("s",$department);
	if (!$statement->execute())
		return (json_encode($result["error"] = "Failed to execute"));
	
	if (!$statement->bind_result($retrievedCourse))
		return (json_encode($result["error"] = "Failed to bind"));
	
	while ($statement->fetch())
	{
		array_push($result["result"], $retrievedCourse);
	}
	$statement->close();
	$conn->close();
	return $result;	
}

$department = $_POST['department'];
//$department='ART';
echo (json_encode(getCourseFromMajor($department)));
?>