<%@page import="dao.MemberDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="dto.Member"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@page import="sun.security.krb5.Confounder"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 임시 boardData 생성 프로세스 -->
<%
	for (int i = 1; i < 111; i++) {

		Member m = new Member();

		m.setId("MemberId" + i);
		m.setPassword("1111");
		m.setName("MemberName" + i);

		Date conFromDate = new Date();
		long ttl = conFromDate.parse("Jan 1, 1990 0:0:0");
		long now = conFromDate.getTime();
		long randomDate = (long) (Math.random() * (now - ttl)) + ttl;
		Date birth = new java.sql.Date(new Date(randomDate).getTime());
		DateFormat f = new SimpleDateFormat("yyMMdd");
		String strBirth = f.format(birth);
		m.setRrnum1(strBirth);

		String rrnum2 = "";
		int r = (int) (Math.random() * 2) + 1;
		if (Integer.parseInt(strBirth.substring(0, 2)) <= 18)
			r += 2;
		rrnum2 += r + "";
		for (int j = 0; j < 6; j++) {
			r = (int) (Math.random() * 10);
			rrnum2 += r + "";
		}
		m.setRrnum2(rrnum2);

		String zipno = "1";
		for (int j = 0; j < 4; j++) {
			r = (int) (Math.random() * 10);
			zipno += r + "";
		}
		m.setZipno(zipno);

		m.setAddress1("주소지" + i);
		m.setAddress2("상세주소지" + i);
		m.setTel1("010");

		String tel2 = "";
		for (int j = 0; j < 4; j++) {
			r = (int) (Math.random() * 10);
			tel2 += r + "";
		}
		m.setTel2(tel2);

		String tel3 = "";
		for (int j = 0; j < 4; j++) {
			r = (int) (Math.random() * 10);
			tel3 += r + "";
		}
		m.setTel3(tel3);

		String[] email = { "naver.com", "daum.net", "gmail.com", "nate.com" };
		r = (int) (Math.random() * 4);
		m.setEmail("email" + i + "@" + email[r]);

		long randomDate1 = 0;
		do {
			Date conFromDate1 = new Date();
			long ttl1 = conFromDate1.parse("Jan 1, 1990 0:0:0");
			long now1 = conFromDate1.getTime();
			randomDate1 = (long) (Math.random() * (now1 - ttl1)) + ttl1;
			if (randomDate < randomDate1) {
				break;
			}
		} while (true);
		m.setRegdate(new java.sql.Date(new Date(randomDate1).getTime()));

		m.setUse_flag('0');
		m.setManager_flag('0');

		MemberDao dao = MemberDao.getInstance();
		dao.insertMember(m);
	}
%>
완료!!
