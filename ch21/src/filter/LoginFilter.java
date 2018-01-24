package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/sub2/*")
public class LoginFilter implements Filter {

	public LoginFilter() {

	}

	public void destroy() {
		System.out.println("LoginFilter 종료");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest rq = (HttpServletRequest) request;
		HttpServletResponse rs = (HttpServletResponse) response;
		HttpSession session = rq.getSession();
		if (session == null) {
			rs.sendRedirect("../login.jsp");
			return;
		}
		String id = (String) session.getAttribute("id");
		if (id == null || id.equals("")) {
			rs.sendRedirect("../login.jsp");
			return;
		}
		chain.doFilter(request, response);

	}

	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("LoginFilter 초기화");
	}

}
