package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.PasswordUtil;
import dao.UserDAO;
import model.User;

@WebServlet("/SignInServlet")
public class SignInServlet extends HttpServlet {
	@Override
	protected void doPost(
			HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		UserDAO dao = new UserDAO();
	
		User user = dao.findByUsername(username);
		
		if (user != null && PasswordUtil.verify(password, user.getPasswordHash())) {
			response.sendRedirect("loginSuccess.jsp");
		} else {
			response.sendRedirect("error.jsp");
		}
	}
}