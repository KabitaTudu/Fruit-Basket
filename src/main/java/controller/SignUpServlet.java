package controller;

import java.io.IOException;

import dao.BasketDAO;
import dao.UserDAO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;
import model.Basket;
import util.PasswordUtil;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	@Override
	protected void doGet(
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/signUp.jsp").forward(request, response);
	}

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
        
        // basket for the new user
        Basket basket = new Basket();
        
        basket.setBUserId(username);
        
        BasketDAO bdao = new BasketDAO();
        
        boolean basketCreated = bdao.createBasket(basket);

        if (success && basketCreated) {
        	request.getRequestDispatcher("/WEB-INF/views/success.jsp").forward(request, response);
        } else {
        	request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
        }

    }

}