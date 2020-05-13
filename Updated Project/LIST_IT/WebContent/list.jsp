<!-- jsp page to display all the tasks -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LIST-IT - The Kanban Style</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@700&display=swap" rel="stylesheet">
	<link rel="icon" type="image/png" href="icons8-scroll-64.png" />
</head>
<body>

	<sql:setDataSource
        var="myDS"
        driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/myjdbc"
        user="root" password="kc@241099"
    />
	
	<sql:query var="addCardtoLists"   dataSource="${myDS}">
        SELECT * FROM listit;
    </sql:query>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a  class="navbar-brand" style="color:white"> JAVA PROJECT</a>
			</div>
		</nav>
	</header>
	
	<div class="row">
		<div class="container">
			<h3 class="text-center" color="#1f4068" style="font:'Ubuntu, sans-serif'">LISTS</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/AddCard.jsp"
					class="btn btn-success">Add Card</a>
			</div>
			<br>
			<table class="table table-bordered">
			<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a  class="navbar-brand" style="color:white"> To Do</a>
			</div>
			</nav>
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Description</th>
						<th>Action</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="add" items="${addCardtoLists.rows}">
						<c:if test="${add.status == 'toDo'}">
						<tr>
							<td><c:out value="${add.id}" /></td>
							<td><c:out value="${add.title}" /></td>
							<td><c:out value="${add.description}" /></td>
							<td><a href="<c:url value="/Delete">
                             	<c:param name="id" value="${add.id}"/>
                         	</c:url>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="MoveP?id=<c:out value='${add.id}'/>&status=<c:out value='${add.status}'/>">Move to next</a>
							</td>
						</tr>
						</c:if>
					</c:forEach>
	
				</tbody>

			</table>
			<table class="table table-bordered">
			<nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
				<div>
					<a  class="navbar-brand" style="color:white"> In-Progress</a>
				</div>
			</nav>
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Description</th>
						<th>Action</th>							
					</tr>
				</thead>
				<tbody>
					<c:forEach var="add" items="${addCardtoLists.rows}">
						<c:if test="${add.status == 'inProgress'}">
						<tr>
							<td><c:out value="${add.id}" /></td>
							<td><c:out value="${add.title}" /></td>
							<td><c:out value="${add.description}" /></td>
							<td><a href="<c:url value="/Delete">
                             	<c:param name="id" value="${add.id}"/>
                         	</c:url>">Delete</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="MoveC?id=<c:out value='${add.id}'/>&status=<c:out value='${add.status}'/>">Move to next</a>
							</td>
						</tr>
						</c:if>
					</c:forEach>
	
				</tbody>

			</table>
			<table class="table table-bordered">
				<nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
				<div>
					<a  class="navbar-brand" style="color:white"> Done</a>
				</div>
				</nav>
				<thead>
					<tr>
						<th>Id</th>
						<th>Title</th>
						<th>Description</th>	
						<th>Action</th>						
					</tr>
				</thead>
				<tbody>
					<c:forEach var="add" items="${addCardtoLists.rows}">
						<c:if test="${add.status == 'complete'}">
						<tr>
							<td><del><c:out value="${add.id}" /></del></td>
							<td><del><c:out value="${add.title}" /></del></td>
							<td><del><c:out value="${add.description}" /></del></td>
							<td><a href="<c:url value="/Delete">
                             	<c:param name="id" value="${add.id}"/>
                         	</c:url>">Delete</a>
							</td>
						</tr>
						</c:if>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>

</body>
</html>