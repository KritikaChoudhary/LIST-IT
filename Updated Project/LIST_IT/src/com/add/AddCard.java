package com.add;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.function.Functionality;


/**
 * Servlet implementation class AddCard
 * Acts as an interface between client page and server for creation of new tasks 
 */
@WebServlet("/AddCard")
public class AddCard extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Functionality func;

	public void init() {
		func = new Functionality();
	}
	public static List<Add> addCardtoList;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

			String title = request.getParameter("title");
			String status = request.getParameter("status");
			String description = request.getParameter("description");

			Add add = new Add(title, description, status);
			try {
				func.insert(add);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			response.sendRedirect(request.getContextPath() +"/list.jsp");
		}
	
	}
