package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/sub1/*")
public class SecondFilter implements Filter {

	@Override
	public void destroy() {
		System.out.println("Filter 종료");
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain arg2)
			throws IOException, ServletException {
		System.out.println("두번째 필터 작동 전");
		arg2.doFilter(arg0, arg1);
		System.out.println("두번째 필터 작동 후");
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		System.out.println("두번째 필터 초기화");
	}

}
