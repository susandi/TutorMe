<?php
	$username="root";
	$database="TutorMeDatabase";
	$db_server = "localhost";
	
	mysql_connect($db_server,$username);
	
	@mysql_select_db($database) or die ("Error");
	
	$query="SELECT * from major_lists";
	$result= mysql_query($query) or die(mysql_error());
	$num= mysql_numrows($result);
	
	mysql_close();
	
	/*$rows=array();
	while($r= mysql_fetch_assoc($result))
	{
		$rows[]=$r;
	
	} echo json_encode($rows);	*/
	?>