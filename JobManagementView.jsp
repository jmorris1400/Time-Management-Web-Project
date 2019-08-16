<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Job Management</title>
</head>
<body>
	<div class="header">
		<h2>Disaster Recovery Application : Job Management</h2>
	</div>
	<div class="column left">
		<h3><a href="/joblist">Job Management</a></h3>
		<h3><a href="/machinelist">Machine Management</a></h3>
		<h3><a href="/timesheetlist">TimeSheet Management</a></h3>
	</div>
	<div class="column right">
		<h2 class="title">
			<u> Job Management</u>
		</h2>
		<h3 align="right">
			<a href="newjob.html">Add New Job</a>
		</h3>

		<c:if test="${!empty jobs}">
			<table>
				<col width="200">
				<col width="400">
				<col width="200">
				<col width="400">
				<col width="100">
				<col width="100">
				<tr class="select" height="40">
					<th>Job Code</th>
					<th>Description</th>
					<th>Hourly Rate</th>
					<th>Max Hours Per Day</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>

				<c:forEach items="${jobs}" var="job">
					<tr align="center" height="40" bgcolor= #f1f1f1 >
						<td><c:out value="${job.jobCode}" /></td>
						<td><c:out value="${job.jobDescription}" /></td>
						<td><c:out value="${job.jobHourlyRate}" /></td>
						<td><c:out value="${job.jobmaxHours}" /></td>
						<td><a
							href="editjob.html?id=${job.jobId}">Edit</a></td>
						<td><a
							href="deletejob.html?id=${job.jobId}">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>