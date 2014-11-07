package main;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Main")
public class coreservlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void randomQuery() {
		try {
			Connection con = ConnectDatabase.connect();
			PreparedStatement select = con
					.prepareStatement("SELECT title FROM movie");
			ResultSet rs = select.executeQuery();
			System.out.println(rs.getString(rs.getString("title")));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static boolean isInteger(String str) {
		try {
			Integer.valueOf(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	public static boolean isFloat(String str) {
		try {
			Float.valueOf(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		String address = null;
		String uid = null;
		String pwd = null;
		String movie = null;
		String actionserv = request.getParameter("action");
		int number = Integer.parseInt(actionserv);

		switch (number) {

		case 0: // User or Manager login
			uid = request.getParameter("uid");
			pwd = request.getParameter("pwd");
			// search over uid and see whether pwd matches
			// also obtain manager or user
			// if manager, redirect to manager interface
			// else redirect to user interface
			// if search yields no result, take the user to
			// wrong uid or pwd page register page

		case 1: // Register user
		{
			uid = request.getParameter("uid");
			pwd = request.getParameter("pwd");
			if ((uid.length() != 0) & (pwd.length() != 0)) {
				address = "SuccessfulRegistration.jsp";
				// Add uid and pwd for user
			} else {
				address = "FailedRegistration.jsp";
			}
		}

		case 2: // Register manager
		{
			uid = request.getParameter("uid");
			pwd = request.getParameter("pwd");
			if ((uid.length() != 0) & (pwd.length() != 0)) {
				address = "SuccessfulRegistration.jsp";
				// Add uid and upwd for manager
			} else {
				address = "FailedRegistration.jsp";
			}
		}

		// for all of the below, a not found case must be included
		case 3: // Get data of a movie
		{
			movie = request.getParameter("mname");
			if (!movie.isEmpty()) {
				// search for movie
				// request.setAttribute("o1", temp1.name);
				// if search does not give any output, redirect to NotFound.jsp
			} else {
				address = "NotFound.jsp";
			}
		}
		case 4: // Give a rating
		case 5: // Book a ticket
		case 6: // Edit a movie
		default:
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}
}
