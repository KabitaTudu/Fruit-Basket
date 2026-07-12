package controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;

import model.Fruit;
import model.Basket;

import dao.FruitDAO;
import dao.BasketDAO;

@WebServlet("/app/addFruit")
public class AddFruitServlet extends HttpServlet {
	@Override
	protected void doPost(
			HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String fruitName = request.getParameter("fruit-name");
		double price = Double.parseDouble(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		price = price * quantity;
		
		HttpSession session = request.getSession(false);
		String username = (String)session.getAttribute("username");
		
		Basket basket = new Basket();
		BasketDAO bdao = new BasketDAO();
		basket = bdao.findBasket(username);
		
		boolean fullBasket = bdao.isBasketFull(username, basket, quantity);
		
		if (!fullBasket) {
			Fruit fruit = new Fruit();
			fruit.setUserId(username);
			fruit.setFruitName(fruitName);
			fruit.setQuantity(quantity);
			fruit.setPrice(price);
		
			FruitDAO fdao = new FruitDAO();
			fdao.addFruit(fruit);
			
			int updatedCounter = basket.getCounter() + fruit.getQuantity();
			System.out.println("Updated counter = " + updatedCounter);
			bdao.updateBasket(basket, updatedCounter);
			
			response.sendRedirect(request.getContextPath() + "/app/main");
		} else {
			request.getRequestDispatcher("/WEB-INF/views/basketFull.jsp").forward(request, response);
		}
	}
}