package filter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class LowerWrapper extends HttpServletResponseWrapper {
	HttpServletResponse response;

	public LowerWrapper(HttpServletResponse response) {
		super(response);
		this.response = response;
	}

	public void addCookie(Cookie cookie) {
		response.setContentType("text/html;charset=utf-8");
		String name = cookie.getName();
		String value = cookie.getValue();
		value = value.toLowerCase();
		cookie.setValue(value);
		response.addCookie(cookie);
	}

}
