<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>2의 거듭제곱</title>
</head>
<body>
	2^1 =
	<%=power(2, 1)%><br> 2^2 =
	<%=power(2, 2)%><br> 2^3 =
	<%=power(2, 3)%><br> 2^4 =
	<%=power(2, 4)%><br> 2^5 =
	<%=power(2, 5)%><br>

</body>
</html>
<%!private int power(int base, int exponent) {
		int result = 1;
		for (int cnt = 0; cnt < exponent; cnt++) {
			result = result * base;
		}
		return result;
	}%>