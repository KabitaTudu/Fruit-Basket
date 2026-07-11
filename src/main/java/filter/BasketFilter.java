package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.BasketDAO;
import model.Basket;

@WebFilter("/app/*")
public class BasketFilter implements Filter {
	public void doFilter(
			ServletRequest req,
			ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		
		HttpSession session = request.getSession(false);
		
		if (session != null && session.getAttribute("username") != null) {
			String username = (String) session.getAttribute("username");
			
			Basket basket = new Basket();
			BasketDAO bdao = new BasketDAO();
			
			basket = bdao.findBasket(username);
			
			int basketCount = basket.getCounter();
			request.setAttribute("basketCount", basketCount);
		}
		
		chain.doFilter(req, res);
	}
}