package com.function;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import com.add.Add;
import com.database.DatabaseConnection;

/**
 * Servlet implementation class Functionality
 * Performs the database operations (add, delete, move)
 */
public class Functionality extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public List<Add> cardToList = new ArrayList<Add>();
	public ResultSet set;
	
	public void insert(Add addCard) throws ClassNotFoundException {		
	
		String insert = " insert into listit (id, title, description, status)" + " values (?, ?, ?, ?);";
		cardToList.add(addCard);
		
		try {
			Connection connection = DatabaseConnection.getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(insert);
			preparedStatement.setString(2, addCard.getTitle());
			preparedStatement.setInt(1, addCard.getId());
			preparedStatement.setString(3, addCard.getDescription());
			preparedStatement.setString(4, addCard.getStatus());
			preparedStatement.executeUpdate();
			connection.close();
		} catch (SQLException exception) {
			DatabaseConnection.printSQLException(exception);
		}
	}
		
	public void delete(int id) throws ClassNotFoundException {
		
		String del = " delete from listit where id = ?;";
		
		try {
			Connection connection = DatabaseConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(del);
			statement.setInt(1, id);
			statement.executeUpdate();
			connection.close();
		} catch (SQLException exception) {
			DatabaseConnection.printSQLException(exception);
		}
		for(Add a : cardToList) {
			if(a.getId() == id)
				cardToList.remove(a);
		}
	}
	
	public void moveC(String status, int id) throws ClassNotFoundException {
		String mov = "update listit set status = 'complete' where id = ?;";
		
		try {
			Connection connection = DatabaseConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(mov);
			statement.setInt(1, id);
			statement.executeUpdate();
		} catch (SQLException exception) {
			DatabaseConnection.printSQLException(exception);
		}	
	}
	
	public void moveP(String status, int id) throws ClassNotFoundException {
		String mov = "update listit set status = 'inProgress' where id = ?;";
		
		try {
			Connection connection = DatabaseConnection.getConnection();
			PreparedStatement statement = connection.prepareStatement(mov);
			statement.setInt(1, id);
			statement.executeUpdate();
		} catch (SQLException exception) {
			DatabaseConnection.printSQLException(exception);
		}
	}


}
