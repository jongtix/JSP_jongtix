package filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class UpperWrapper extends HttpServletRequestWrapper {
	// 생성자의 매개변수로 받은 request객체를 저장할 필드 변수 선언
	HttpServletRequest request;

	// HttpServletRequest를 매개변수로 받는 생성자
	public UpperWrapper(HttpServletRequest request) {
		super(request);
		this.request = request;
	}

	public String getParameter(String name) {
		String value = request.getParameter(name);
		value = value.toUpperCase();

		return value;
	}

	public String[] getParameterValues(String name) {
		String[] values = request.getParameterValues(name);
		String[] nVal = new String[values.length];
		for (int i = 0; i < nVal.length; i++) {
			nVal[i] = values[i].toUpperCase() + " 변형";
		}
		return nVal;
	}

}
