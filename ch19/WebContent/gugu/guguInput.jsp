<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title>구구단 단수 입력 폼</title>
<script type="text/javascript">
	function chk() {
		var num1 = document.getElementById('num1');
		var num2 = document.getElementById('num2');
		if (!num1.value) {
			alert('num1값을 입력하세요.');
			num1.focus();
			return false;
		}
		if (!num2.value) {
			alert('num2값을 입력하세요.');
			num2.focus();
			return false;
		}

		if (isNaN(num1.value)) {
			alert('숫자를 입력하세요.');
			num1.value = '';
			num1.focus();
			return false;
		}
		if (isNaN(num2.value)) {
			alert('숫자를 입력하세요.');
			num2.value = '';
			num2.focus();
			return false;
		}

		if (parseInt(num1.value) > parseInt(num2.value)) {
			alert('num1은 num2보다 작아야합니다.');
			num1.value = '';
			num2.value = '';
			num1.focus();
			return false;
		}
		if (parseInt(num1.value) < 2) {
			alert('num1은 2 이상이어야 합니다.');
			num1.value = '';
			num1.focus();
			return false;
		}
		if (parseInt(num2.value) > 9) {
			alert('num2는 9 이하이어야 합니다.');
			num2.value = '';
			num2.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<form action="gugu.do" onsubmit="return chk()">
		<input type="text" name="num1" id="num1" size="3"> ~ <input
			type="text" name="num2" id="num2" size="3">
		<p>
			<input type="submit" value="전송"> <input type="reset"
				value="지우기">
	</form>
</body>
</html>