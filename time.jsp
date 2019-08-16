    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<!--http://localhost:8080/Regular user/roughdraft.jsp  
	http://localhost:8080/Regular user/job_Code.jsp
	http://localhost:8080/addProduct.jsp
	http://localhost:8080/Regular user/Timecard Approval.jsp
rough draft for user pg1 -->
<link rel="stylesheet" type="text/css" href="front.css">
<head>
<meta charset="ISO-8859-1">
<title>leave this blank</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>
	<div class="wholepage">
<!--
<body BGcolor = "black" Text = "white" >
board wipe -->
	<div class="header">
	<h2><u>Disaster Recovery Application : Timecard Submission </u>
</h2>

<div class="header2">
		<h3>Example name</h3>
	</div> 

	</div>	
	<!--&emsp; &emsp;&emsp;&emsp; <a href="sometypeoffile.html">UserNameExample</a></h2>
	-->	
	

<div class="list"> <!-- for links -->
	<div class="column left"> <!-- for the css -->
<h3 id="Job"><a href="http://localhost:8080/user/code.jsp"target="_blank"><p><strong>Job code Management</strong></p>
</a></h3> 
<!-- C:/Users/Charlie/Desktop/project/h.html -->
<br><br> 

<h3 id="Machine Management"><a href="http://localhost:8080/user/machine.jsp"target="_blank">Machine Management
</a></h3>

<br><br>
<h3 id="Timecard Approval"><a href="http://localhost:8080/user/time.jsp"target="_blank">Timecard Approval
</a></h3>


</div></div>

<style type="text/css">
a{
	text-decoration: none;
	color:darkgreen;
	}
</style>
	<h1 class="sheet">&emsp;&emsp;Timecard Approval</h1>

<br>


<h2 id="mytimesheet"><a href="edit.html?id=${job.jobId}">Enter new timesheet</a> 
<br><br><br><br><br>	
<a href="edit.html?id=${job.jobId}">Edit</a>				
<a href="delete.html?id=${job.jobId}">Delete</a>

</h2>

<div class="select">
<c:if test="${!empty jobs}">
		<table>
	<tr class="select">
				<h3><th>Site Code</th>
				<th>Contractor Name</th>
				<th>Total Hrs</th>
				<th>Total Amount</th>
		</tr>
			<c:forEach items="${jobs}" var="job">
				
					<td><c:out value="${job.jobCode}" /></td>
					<td><c:out value="${job.jobDescription}" /></td>
					<td><c:out value="${job.jobHourlyRate}" /></td>
					<td><c:out value="${job.jobmaxHours}" /></td>
					<td align="center">
					</td>
					<td align="center"></td>
			
			</c:forEach>
		</table>
	</c:if>

</h3></tr>
</div>
<br>

</div> 
</body>
</html>