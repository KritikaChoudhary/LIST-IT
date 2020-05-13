package com.move;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.function.Functionality;

/**
 * Servlet implementation class Move
 * Acts as an interface between client page and server for moving tasks which are in-progress to completion
 */
@WebServlet("/MoveC")
public class MoveC extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Functionality func;

	public void init() {
		func = new Functionality();
	}
    
    public MoveC() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String status = request.getParameter("status");
		int id = Integer.parseInt(request.getParameter("id"));

		try {
			func.moveC(status, id);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() +"/list.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
