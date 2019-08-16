<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<title>Add New Machine</title>
</head>
<body>
	<div class="header">
		<h2>Disaster Recovery Application : Add New Machine</h2>
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
			<u> Add New Machine</u>
		</h2>
		<br> <br>
		<form:form method="POST" action="saveMachine">
			<table>
				<col width="200">
				<col width="400">
				
				<tr height="40">
					<td class="select"><form:label path="id">Machine id:</form:label></td>
					<td><form:input path="id" height="40"
							value="${machine.id}" readonly="true"/></td>
				</tr>

				<tr height="40">
					<td class="select"><form:label path="code">Machine Code:</form:label></td>
					<td><form:input path="code" height="40"
							value="${machine.code}" placeholder="Enter Machine Code"
							required="required" /></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr height="40">
					<td class="select"><form:label path="description">Description:</form:label></td>
					<td><form:input path="description" height="40"
							value="${machine.description}" placeholder="Enter Description"
							required="required" /></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr height="40">
					<td class="select"><form:label path="hourly_rent">Hourly Rent:</form:label></td>
					<td><form:input path="hourly_rent" height="40"
							value="${machine.hourly_rent}" placeholder="Enter Hourly Rent"
							required="required" /></td>
				</tr>
				<tr></tr>
				<tr></tr>
				<tr></tr>
				<tr height="40">
					<td class="select"><form:label path="max_hours_per_day">Max Hours Per Day:</form:label></td>
					<td><form:input path="max_hours_per_day" height="40"
							value="${machine.max_hours_per_day}"
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