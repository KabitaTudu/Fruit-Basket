package filter;

import java.io.IOException;

import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.ServletException;
import javax.servlet.FilterChain;
import javax.servlet.http.HttpSession;

@WebFilter("/app/*")
public class AuthenticationFilter extends HttpFilter {
	@Override
	public void doFilter(
			ServletRequest request,
			ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession session = req.getSession(false);
		
		boolean loggedIn = session != null && session.getAttribute("username") != null;
		
		if (loggedIn) {
			chain.doFilter(request, response);
		} else {
			res.sendRedirect(req.getContextPath() + "/signin");
		}
	}
}