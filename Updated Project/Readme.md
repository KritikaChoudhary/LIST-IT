#LIST-IT
It is a web-based Kanban-style list-making application for personal use written in JAVA.

Users can create cards that can be placed in one of the lists: To Do, In Progress, Done and moved between them.

#Architecture
The application is built using JSP, JSTL, JDBC and Servlets.

It can be run using Eclipse software on Tomcat server. 


To run this project

	1. Create a database in mysql and name it myjdbc

	 2. Create a table, 'listit' in the database 

	 3. Insert 4 columns into the table:

	 	i) id (int) - primary key

	 	ii) title (varchar(45))

	 	iii)description (varchar(100))

	 	iv) status (varchar(45))

	 4. Change the username and password in appropriate jsp and servlet files according to your mysql settings 

	 5. Run the index.html file