package controller;

import java.io.IOException;

import dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import util.PasswordUtil;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        String hash = PasswordUtil.hash(password);

        User user = new User();

        user.setUsername(username);
        user.setEmail(email);
        user.setPasswordHash(hash);

        UserDAO dao = new UserDAO();

        boolean success = dao.signup(user);

        if (success) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("home.jsp");
        }

    }

}