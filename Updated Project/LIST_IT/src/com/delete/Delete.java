package com.delete;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.function.Functionality;

/**
 * Servlet implementation class Delete
 * Acts as an interface between client page and server for deletion of tasks
 */
@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Functionality func;

	public void init() {
		func = new Functionality();
	}

    public Delete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		try {
			func.delete(id);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() +"/list.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
