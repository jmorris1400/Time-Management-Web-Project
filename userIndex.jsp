<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/index.css" rel="stylesheet">


<title></title>
</head>

<body>
	<div class="header">
		<h1 align="center">Disaster Recovery Application</h1>
	</div>
	<div id="root">
		<div id="top_container"></div>
		<div id="bottom_container">

			<div id="tabcontainer">
				<div class="tab">
					<ul id="tabbar">
						<li>
							<button class="tablinks centerhorizontal"
								">Timesheet
								List</button>
						</li>
					</ul>
				</div>
			</div>
			
			<!-- Tab content -->
			<div id="contentcontainer">
				<div id="timesheet_table" class="column right">
					<h2 class="title">
						<u> TimeSheet Management</u>
					</h2>
					<h3 align="right">
						<a href="timesheetForm">Add New Timesheet</a>
					</h3>
					
					<c:if test="${!empty timesheets}">
						<table>
							<col width="200">
							<col width="400">
							<col width="200">
							<col width="400">
							<col width="100">
							<col width="100">
							<tr class="select" height="40">
								<th>Site Code</th>
								<th>Contractor Name</th>
								<th>Total Hours</th>
								<th>Total Amount</th>
								<th>Review</th>
							</tr>

							<c:forEach items="${timesheets}" var="timesheet">
								<tr align="center" height="40" bgcolor=#f1f1f1>
									<td><c:out value="${timesheet.site_code}" /></td>
									<td><c:out value="${timesheet.contractor_name}" /></td>
									<td><c:out value="${timesheet.totalHours}" /></td>
									<td><c:out value="${timesheet.totalAmount}" /></td>
									<td align="center"><c:choose>
											<c:when test="${timesheet.isOpen == true}">
												<a href="timesheetReview/${timesheet.id}">Open</a>
											</c:when>
											<c:otherwise><a href="timesheetReview/${timesheet.id}">Finalized</a></c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>

			</div>
		</div>
	</div>
	
</body>
</html>