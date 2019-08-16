<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>TimeSheet Management</title>
</head>
<body>
<h1>TimeSheet Management</h1>
<h3><a href="newTimeSheet.html">Add New TimeSheet</a></h3>

<c:if test="${!empty timesheets}">
	<table align="center" border="1">
		<tr>
			<th>Machine Code</th>
			<th>Description</th>
			<th>Hourly Rent</th>
			<th>Max Hours Per Day</th>
			<th>Review</th>
		</tr>

		<c:forEach items="${timesheets}" var="timesheet">
			<tr>
				<td><c:out value="${timesheet.site_code}"/></td>
				<td><c:out value="${timesheet.contractor_name}"/></td>
				<td><c:out value="${timesheet.totalHours}"/></td>
				<td><c:out value="${timesheet.totalAmount}"/></td>
				<td align="center">
				<c:choose>
				<c:when test="${timesheet.isOpen == true}"><a href="review.html?id=${timesheet.id}">Review</a> </c:when>
				<c:otherwise> Finalized </c:otherwise>
				</c:choose>
				 </td>
			</tr>
		</c:forEach>
	</table>
</c:if>
</body>
</html>