    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<!--http://localhost:8080/Regular user/roughdraft.jsp  
rough draft for user pg1 -->
<link rel="stylesheet" type="text/css" href="examplecss.css">
<head>
<meta charset="ISO-8859-1">
<title>leave this blank</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles.css">
</head>
<body>

	<div class="header">
	<h2>Disaster Recovery Application : Timecard Submission 
</h2>

<div class="header2">
		<h3>Example name</h3>
	</div> 

	</div>	

<div class="column left"> <!-- for the css -->
		<h3>Timecard Submission </h3>
	</div><!-- for the css -->


	<h1 class="sheet">Timesheet Submission  </h1>

<br>
<div class="column right">

<h2 id="mytimesheet"><a href="edit.html?id=${job.jobId}">Enter new timesheet</a></h2>
	<c:if test="${!empty jobs}">
		<table>	
			<tr class="select">
				<h3><th>Site Code</th>
				<th>Contractors Name</th>
				<th>Hourly Rate</th>
				<th>Total Hrs</th>
				<th>Total Amount</Amount>
				<th>     </th>	
			</tr>

			<c:forEach items="${jobs}" var="job">
				<tr height="40" bgcolor: #f1f1f1>
					<td><c:out value="${job.jobCode}" /></td>
					<td><c:out value="${job.jobDescription}" /></td>
					<td><c:out value="${job.jobHourlyRate}" /></td>
					<td><c:out value="${job.jobmaxHours}" /></td>
					<td align="center"><a href="edit.html?id=${job.jobId}">Edit</a>
					</td>
					<td align="center"><a href="delete.html?id=${job.jobId}">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</div>
<br>
</body>
</html>