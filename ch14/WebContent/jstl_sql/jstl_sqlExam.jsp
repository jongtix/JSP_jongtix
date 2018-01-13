<%@ page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<html><head><title>JSTL sql 라이브러리 사용하기</title></head>
<body>
	<sql:setDataSource var="conn" driver="oracle.jdbc.driver.OracleDriver"
	  url="jdbc:oracle:thin:@localhost:1521:xe" user="hr" password="hr" />
	 <!-- insert update delete 작업  -->
	 <sql:update dataSource="${conn}">
	    insert into test(num,name) values (201,'홍길동')
	 </sql:update>
	 <sql:update dataSource="${conn}">
	    insert into test(num,name) values (301,'홍길동')
	 </sql:update>
	 <sql:update dataSource="${conn}">
	    insert into test(num,name) values (401,'홍길동')
	 </sql:update>
	 <sql:update dataSource="${conn}">
	    insert into test(num,name) values (501,'홍길동')
	 </sql:update>
	 <sql:update dataSource="${conn}">
	    update test set name='김길동' where num=501
	 </sql:update>
	  <sql:update dataSource="${conn}">
	    delete test where num=201
	 </sql:update>
	 
	 <!--조회 작업  -->
	 <sql:query var="rs" dataSource="${conn}">
	 	select * from test where name like ?
	 <sql:param>홍길동</sql:param>
	 </sql:query>
	 <!-- 조회 결과값 출력 변수로 선언한 rs에서 출력  -->
	 <c:forEach var="data" items="${rs.rows}">
	 <c:out value="${data['num'] }"/>
	 <c:out value="${data['name'] }" />
	 <br>
	 </c:forEach>
</body>
</html>