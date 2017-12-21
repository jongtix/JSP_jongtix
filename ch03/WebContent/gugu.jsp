<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 과제 -->
<script type="text/javascript">
	var num = prompt("원하는 구구단을 입력하세요.");
	document.write('<table border = 1 bgcolor="yellow">');
	document.write('<caption><h3>구구단</h3></caption>');
	document.write('<tr>');
	for (var i = 2; i <= num; i++) {
		document.write("<th>" + i + "단</th>");
	}
	document.write('</tr>');
	for (j = 1; j < 10; j++) {
		document.write('<tr>');
		for (i = 2; i <= num; i++) {
			document.write('<td>');
			document.write(i + " x " + j + " = " + i * j);
			document.write('</td>');
		}
		document.write('</tr>');
	}
	document.write('</table>');
</script>
</head>
<body>

</body>
</html>