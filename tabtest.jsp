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
	var machine_options_list = [ "machine1", "machine2", "machine3" ];
	var labor_options_list = [ "job1", "job2", "job3" ];
</script>
<script type="text/javascript" src="js/tabselector.js"></script>


<title></title>
</head>
<body>
<body>
	<div id="root">
		<div id="top_container"></div>
		<div id="bottom_container">
			<div id="tabcontainer">
				<div class="tab">
					<ul id="tabbar">
						<li>
							<button class="tablinks" onclick="openTab('Tab1')">tab1</button>
						</li>
						<li>
							<button class="tablinks"
								onclick="openTab('timesheet_tab')">Timesheet</button>
						</li>
						<li>
							<button class="tablinks"
								onclick="openTab('timesheet_table')">Timesheet List</button>
						</li>
					</ul>
				</div>
			</div>

			<!-- Tab content -->
			<div id="contentcontainer">



				<div id="Tab1" class="tabcontent">
					<div>
						<div>
							<p>Hi</p>
						</div>
					</div>
				</div>




				<div id="timesheet_tab" class="tabcontent">
					<div id="timesheetRoot"></div>
				</div>

				<div id="timesheet_table" class="column right tabcontent">
					<h2 class="title">
						<u> TimeSheet Management</u>
					</h2>
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
								<tr height="40" bgcolor: #f1f1f1>
									<td><c:out value="${timesheet.site_code}" /></td>
									<td><c:out value="${timesheet.contractor_name}" /></td>
									<td><c:out value="${timesheet.totalHours}" /></td>
									<td><c:out value="${timesheet.totalAmount}" /></td>
									<td align="center"><c:choose>
											<c:when test="${timesheet.isOpen == true}">
												<a href="review.html?id=${timesheet.id}">Review</a>
											</c:when>
											<c:otherwise> Finalized </c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</table>
					</c:if>
				</div>

			</div>
		</div>
	</div>


<script> 
	if("${tab}")
		openTab("${tab}");
</script>
</body>
</html>