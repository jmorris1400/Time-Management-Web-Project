<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/index.css" rel="stylesheet">
<script src="https://unpkg.com/react@16/umd/react.development.js"
	crossorigin></script>
<script
	src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"
	crossorigin></script>
<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
<script>
	var machine_options_list = new Array();
	var labor_options_list = new Array();
	let temp = null;
	<c:forEach items="${machines}" var="machine"> 
		temp = new Object();
		temp["name"] =  "${machine.code}";
		temp["rate"] =  ${machine.hourly_rent};
		temp["id"] =  ${machine.id};
		machine_options_list.push(temp);
	</c:forEach> 
	<c:forEach items="${jobs}" var="job"> 
		temp = new Object();
		temp["name"] =  "${job.jobCode}";
		temp["rate"] =  ${job.jobHourlyRate};
		temp["id"] =  ${job.jobId};
		labor_options_list.push(temp);
	</c:forEach> 

	
</script>

<title></title>
</head>
<body>
<body>
	<div id="timesheetRoot">


	<script type="text/babel" src="js/Timesheet.js" crossorigin></script>
</body>
</html>