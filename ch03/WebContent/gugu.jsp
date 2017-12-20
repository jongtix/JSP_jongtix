<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 과제 -->
<script type="text/javascript">
	var body = document.getElementsByTagName('body')[0];
	var tbl = document.createElement('table');
	tbl.setAttribute('border', '1');
	var tbdy = document.createElement('tbody');
	var num = prompt("원하는 구구단을 입력하세요.");
	for (i = 2; i <= num; i++) {
		var tr = document.createElement('tr');
		for (j = 1; j < 10; j++) {
			var td = document.createElement('td');
			var text = i + " x " + j + " = " + i * j + "<br>";
			td.appendChild(document.createTextNode(text));
			tr.appendChild(td);
		}
		tbdy.appendChild(tr);
	}
	tbl.appendChild(tbdy);
	body.appendChild(tbl);
</script>
</head>
<body>

</body>
</html>