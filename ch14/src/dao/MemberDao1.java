package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.Member;
import util.Connections;

public class MemberDao1 {
	Connection conn=null;
	private Connection getConnection() {
		 //Connection conn = null;
		 DataSource ds=null;
		try {
			Context init = new InitialContext();
			ds = (DataSource)init.lookup("java:comp/env/jdbc/OraDB");
			conn=ds.getConnection();	
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	 }//getConnection()메소드 끝.
	 
	 //회원가입 메소드
	public int insertMember(Member member){
		int result = 0;
		//연결 얻기
		//Connection conn = Connections.getInstance().getConnection();
        conn = getConnection();
		System.out.println("connection:"+conn);
		
		PreparedStatement pstmt=null;
		String sql1 = "insert into member2(id,password,name,birth) " 
		              + " values(?,?,?,?)";
		String sql2 = "insert into member2Info(id,address,tel,email) "
		              +" values(?,?,?,?)";
		 try{
				//Autocommit disable;
				conn.setAutoCommit(false);
			   //3단계 - 1.쿼리 객체 설정
				pstmt = conn.prepareStatement(sql1);//기본 정보 저장
			    pstmt.setString(1, member.getId());
			    pstmt.setString(2, member.getPassword());
			    pstmt.setString(3,member.getName());
			    pstmt.setString(4,member.getBirth());//
			
			    result = pstmt.executeUpdate();//기본 정보 저장 처리
			    if(result>0){
			    	pstmt = conn.prepareStatement(sql2);//추가정보 저장
			    	pstmt.setString(1,member.getId());
			    	pstmt.setString(2,member.getAddress());
			    	pstmt.setString(3,member.getTel());
			    	pstmt.setString(4,member.getEmail());
			    	
			    	result = pstmt.executeUpdate();//추가정보 저장 처리
			    	conn.commit();//DB에 저장 처리
			    }
		}catch(Exception e){
			try {
			      conn.rollback();
			  }catch(Exception ex) {}
		   System.out.print(e.getMessage());
		}finally{
			try{
				conn.setAutoCommit(true);//예외 방생과 상관없이 처리
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e){
				System.out.print(e.getMessage());
			}
		}
		return result; 
	}//inserMember()메소드 끝.
	
	//회원체크 메소드
	public int userCheck(String id,String password){
		int result=2;//정상1, 패스워드 이상0, 아이디 없을 때 2
		PreparedStatement pstmt=null;
		String sql = "select password from member2 where id=?";
		Connection conn =null;
		try {
			   //conn  = Connections.getInstance().getConnection();
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbpass = rs.getString(1);
				System.out.println("dbpass="+dbpass);
				if(password.equals(dbpass))
					result = 1;//정상1
				else
					result = 0;//패스워드 이상0
			}else
				result = 2;//아이디 없을 때 2
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		System.out.println("result="+result);
		return result;
	}
}
