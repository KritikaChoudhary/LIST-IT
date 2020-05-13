<!-- jsp page to display the form for adding tasks -->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Card</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="icon" type="image/png" href="icons8-scroll-64.png" />
</head>
</head>
<body>

	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
			<form action="AddCard" method="post">
				<caption>
				<h2>
           			Add New Card
				</h2>
				</caption>			
				<fieldset class="form-group">
					<label>Title</label> <input type="text" class="form-control" name="title" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Description</label> <input type="text" class="form-control" name="description" minlength="5">
				</fieldset>

				<fieldset class="form-group">
					<label>Status</label> <select class="form-control" name="status">
						<option value="toDo">To Do</option>
						<option value="inProgress">In Progress</option>
						<option value="complete">Complete</option>
					</select>
				</fieldset>

				<button type="submit" class="btn btn-success">Add</button>
			</form>
			</div>
		</div>
	</div>
</body>
</html>