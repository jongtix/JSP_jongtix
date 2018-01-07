<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pageFile = request.getParameter("page");
	if (pageFile == null || pageFile.equals("")) {
		pageFile = "newItem";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Template Exam</title>
</head>
<body>
	<table width="960" border="1" color="gray" align="center">
		<tr>
			<td height="43" colspan="3" align="right"><jsp:include
					page="top.jsp" /></td>
		</tr>
		<tr>
			<td width="15%" height="400" align="right" valign="top"><br>
				<jsp:include page="left.jsp" />
			<td colspan=2 align="center"><jsp:include
					page='<%=pageFile + ".jsp"%>' /></td>
		</tr>
		<tr>
			<td width="100%" height="40" colspan="3"><jsp:include
					page="bottom.jsp" /></td>
		</tr>
	</table>
</body>
</html>