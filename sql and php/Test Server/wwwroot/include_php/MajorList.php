<?php
	$username="root";
	$database="TutorMeDatabase";
	$db_server = "localhost";
	
	mysql_connect($db_server,$username);
	
	@mysql_select_db($database) or die ("Error");
	
	$query="SELECT distinct department from course";
	$result= mysql_query($query) or die(mysql_error());
	$num= mysql_numrows($result);
	
	mysql_close();
	
	$rows=array();
	while($r= mysql_fetch_assoc($result))
	{
		$rows[]=$r;
	
	} echo json_encode($rows);	
	?>