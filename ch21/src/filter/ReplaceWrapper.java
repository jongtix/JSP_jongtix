package filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class ReplaceWrapper extends HttpServletResponseWrapper {
	HttpServletResponse response;
	StringWriter sWriter;
	PrintWriter pWriter;

	public ReplaceWrapper(HttpServletResponse response) {
		super(response);
		this.response = response;
	}

	@Override
	public PrintWriter getWriter() throws IOException {
		if (sWriter == null) {
			sWriter = new StringWriter();
			pWriter = new PrintWriter(sWriter);
		}
		return pWriter;
	}

	public void modifyAndPrint() throws IOException {
		String str = sWriter.toString();
		String newStr = str.replaceAll("강아지", "고양이");
		newStr = newStr.replaceAll("멍멍멍", "야옹야옹");
		PrintWriter out = response.getWriter();
		out.print(newStr);
		out.close();
	}

}
