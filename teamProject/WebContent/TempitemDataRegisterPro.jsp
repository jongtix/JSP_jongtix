<%@page import="dao.ItemDao"%>
<%@page import="dto.Item"%>
<%@page import="sun.security.krb5.Confounder"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 임시 boardData 생성 프로세스 -->
<%
	for (int i = 1; i < 10; i++) {

		Item item = new Item();

		item.setNum(i);
		item.setItem_id(i);
		String[] kind = { "전자제품", "자동차", "옷", "캠핑용품" };
		int r = (int) (Math.random() * 4);
		item.setItem_kind(kind[r]);
		item.setItem_name("제품명" + i);

		r = ((int) (Math.random() * 500)) * 100;
		item.setItem_price(r);

		r = (int) (Math.random() * 100) + 1;
		item.setItem_count(r);

		String[] image = { ".jpg", ".gif", ".png" };
		r = (int) (Math.random() * 3);
		item.setItem_image("ItemImage" + i + image[r]);

		Date conFromDate = new Date();
		long ttl = conFromDate.parse("Jan 1, 1990 0:0:0");
		long now = conFromDate.parse("Dec 31, 2017 0:0:0");
		long randomDate = (long) (Math.random() * (now - ttl)) + ttl;
		item.setStartday(new java.sql.Date(new Date(randomDate).getTime()));

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
		item.setEndday(new java.sql.Date(new Date(randomDate1).getTime()));

		String[] type = { "직구", "택배" };
		r = (int) (Math.random() * 2);
		item.setTrans_type(type[r]);

		long randomDate2 = 0;
		do {
			Date conFromDate2 = new Date();
			long ttl2 = conFromDate2.parse("Jan 1, 1990 0:0:0");
			long now2 = conFromDate2.getTime();
			randomDate2 = (long) (Math.random() * (now2 - ttl2)) + ttl2;
			if (randomDate > randomDate2) {
				break;
			}
		} while (true);
		item.setReg_date(new java.sql.Date(new Date(randomDate2).getTime()));

		ItemDao dao = ItemDao.getInstance();
		int result = dao.insert(item);
	}
%>
완료!!
