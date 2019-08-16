<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<style>
	table, th, td {
	  border: 2px solid black;
	  border-collapse:collapse;
	}
	
	</style>
	<link href="/css/index.css" rel="stylesheet">
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
</head>
<body>
	<p>Date : ${timesheet.date}</p>
	<p>Contractor Name : ${timesheet.contractor_name}
	<p>Site Code : ${timesheet.site_code}</p>
	<br>
	<p>Machine Entries</p>
	<table>
		<tr>
			<th>Machine Code</th>
			<th>Hours Used</th>
			<th>Total</th>
		</tr>
		<c:forEach items="${machines}" var="mach">
			<tr>
				<c:forEach items="${mach}" var="machitem">
					<td><c:out value="${machitem}"/></td>
				</c:forEach>
			</tr>
		</c:forEach>


	</table>
	<br>
	<p>Labor Entries</p>
	<table>
		<tr>
			<th>Labor Code</th>
			<th>Hours Worked</th>
			<th>Total</th>
		</tr>
		<c:forEach items="${labors}" var="lab">
			<tr>
				<c:forEach items="${lab}" var="labitem">
					<td><c:out value="${labitem}"/></td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	<br>
      <form action="/timesheetConfirm/${timesheet.id}">
         <button type="submit">Validate</button>
      </form>

</body>
</html>