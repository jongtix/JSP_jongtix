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
public class ReplaceFilter implements Filter {

	public ReplaceFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		ReplaceWrapper re = new ReplaceWrapper((HttpServletResponse) response);
		chain.doFilter(request, re);
		re.modifyAndPrint();
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
