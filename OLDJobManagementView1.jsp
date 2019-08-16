<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Job Management</title>
</head>
<body>
	<h1>Job Code Management</h1>
	<h3>
		<a href="newJob.html">Add New Job</a>
	</h3>

	<c:if test="${!empty jobs}">
		<table align="center" border="1">
			<tr>
				<th>Job Code</th>
				<th>Description</th>
				<th>Hourly Rate</th>
				<th>Max Hours Per Day</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>

			<c:forEach items="${jobs}" var="job">
				<tr>
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
</body>
</html>