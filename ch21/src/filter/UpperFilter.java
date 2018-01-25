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

@WebFilter("/sub3/*")
public class UpperFilter implements Filter {

	public UpperFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		UpperWrapper up = new UpperWrapper((HttpServletRequest) request);
		chain.doFilter(up, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
