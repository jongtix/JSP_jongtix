package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/sub4/*")
public class LowerFilter implements Filter {

	public LowerFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		LowerWrapper low = new LowerWrapper((HttpServletResponse) response);
		chain.doFilter(request, low);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
