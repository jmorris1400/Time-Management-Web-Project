<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Add New Job</title>
</head>
<body>
	<div class="header">
		<h2>Disaster Recovery Application : Add New Job</h2>
	</div>
	<div class="column left">
		<h3>
			<a href="/joblist">Job Management</a>
		</h3>
		<h3>
			<a href="/machinelist">Machine Management</a>
		</h3>
		<h3>
			<a href="/timesheetlist">TimeSheet Management</a>
		</h3>
	</div>


	<div class="column right">
		<h2 class="title">
			<u> Add New Job</u>
		</h2>
		<br> <br>
		<form:form method="POST" action="saveJob">
			<table>
				<col width="200">
				<col width="400">
				
				<tr height="40">
					<td class="select"><form:label path="jobId">Job id:</form:label></td>
					<td><form:input path="jobId" height="40"
							value="${job.jobId}" readonly="true"/></td>
				</tr>

				<tr height="40">
					<td class="select"><form:label path="jobCode">Job Code:</form:label></td>
					<td><form:input path="jobCode" height="40"
							value="${job.jobCode}" placeholder="Enter Job Code"
							required="required" /></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr height="40">
					<td class="select"><form:label path="jobDescription">Description:</form:label></td>
					<td><form:input path="jobDescription" height="40"
							value="${job.jobDescription}" placeholder="Enter Description"
							required="required" /></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr height="40">
					<td class="select"><form:label path="jobHourlyRate">Hourly Rate:</form:label></td>
					<td><form:input path="jobHourlyRate" height="40"
							value="${job.jobHourlyRate}" placeholder="Enter Hourly Rate"
							required="required" /></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr height="40">
					<td class="select"><form:label path="jobmaxHours">Max Hours Per Day:</form:label></td>
					<td><form:input path="jobmaxHours" height="40"
							value="${job.jobmaxHours}"
							placeholder="Enter Max Hours per Day" required="required" /></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr height="40">
					<td colspan="2"><input type="submit" value="Save" height="40" /></td>
				</tr>
			</table>
		</form:form>

	</div>
</body>
</html>