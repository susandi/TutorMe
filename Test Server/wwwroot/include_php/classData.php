<?php

//connect to database
function connect() {
  $dbh = mysql_connect ("localhost", "root", "") or die ('Cannot connect to the database because: ' . mysql_error());
  mysql_select_db("tutorMeDatabase", $dbh); 
  return $dbh;
}

//store posted data
if(isset($_POST['department'])){
  $dbh = connect();
  $department = $_POST['department'];
  $query = mysql_query("SELECT course_name FROM TutorMeDatabase WHERE department = $department;") or die("Error: " . mysql_error());;

  $rows = array();
  while($r = mysql_fetch_assoc($query)) {
    $rows[] = $r;
  }      
  echo $rows;
  echo json_encode($rows);
  mysql_close();
}
?>