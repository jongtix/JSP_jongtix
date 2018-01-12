package bookshop.shopping;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
public class MemberDao {	
	private static MemberDao instance;   
    public static MemberDao getInstance() {   	
    	if (instance == null) {	instance = new MemberDao();    	}
    	return instance; 
    }   
    private MemberDao() {}   
    private Connection getConnection() throws Exception {
        Connection conn=null; 	 
      	Context init = new InitialContext();
     		DataSource ds = 
     			(DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
     		conn = ds.getConnection();
         return conn;
    }
    //회원가입
    public void insertMember(Member member) 
    throws Exception {
    	Connection conn = null;
        PreparedStatement pstmt = null;
         
        try {
            conn = getConnection();
           
            pstmt = conn.prepareStatement(
           	 "insert into member2 values (?,?,?,?,?,?,?,?)");
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPasswd());
            pstmt.setString(3, member.getName());
            pstmt.setTimestamp(4, member.getReg_date());
            pstmt.setString(5, member.getTel());
            pstmt.setString(6, member.getAddress());
          
            pstmt.executeUpdate();
        }catch(Exception ex) {
        	ex.printStackTrace();
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
	 public int userCheck(String id, String passwd) throws Exception {
		 Connection conn = null; PreparedStatement pstmt = null;
		 ResultSet rs= null;     String dbpasswd=""; int x=-1; 
		 String sql = "select passwd from member2 where id = ?";
		 try {	conn = getConnection();           
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);  rs= pstmt.executeQuery();
			if(rs.next()){
				dbpasswd= rs.getString("passwd"); 
				if(dbpasswd.equals(passwd))	x= 1; //인증 성공
				else x= 0; //비밀번호 틀림
			}else    x= -1;//해당 아이디 없음
         }catch(Exception ex) {      	 ex.printStackTrace();
         } finally {
			 if (rs != null) try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
		 return x;
	 }

	 public int confirmId(String id) //중복아이디 체크
	 throws Exception {
		 Connection conn = null;
         PreparedStatement pstmt = null;
		 ResultSet rs= null;
		 int x=-1;
       
		 try {
			 conn = getConnection();
           
             pstmt = conn.prepareStatement(
           	  "select id from member2 where id = ?");
             pstmt.setString(1, id);
             rs= pstmt.executeQuery();

			 if(rs.next())
				 x= 1; //해당 아이디 있음
			 else
				 x= -1;//해당 아이디 없음		
         }catch(Exception ex) {
             ex.printStackTrace();
         } finally {
			 if (rs != null) try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
		 return x;
	 }

     public Member getMember(String id) {
    	 Connection conn = null; PreparedStatement pstmt = null;
         ResultSet rs = null;    Member member=null;
         String sql = "select * from member2 where id = ?";
         try { conn = getConnection();           
             pstmt = conn.prepareStatement(sql);
             pstmt.setString(1, id);
             rs = pstmt.executeQuery();
             if (rs.next()) {
            	 member = new Member();            	 
                 member.setId(rs.getString("id"));
                 member.setPasswd(rs.getString("passwd"));
				 member.setName(rs.getString("name"));
				 member.setReg_date(rs.getTimestamp("reg_date")); 
                 member.setTel(rs.getString("tel"));
                 member.setAddress(rs.getString("address"));     
			 }
         }catch(Exception e) {System.out.println();
         }finally {
             if (rs != null) try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
		 return member;
     }
   
     public void updateMember(Member member) //회원의 정보수정
     throws Exception {
    	 Connection conn = null;
         PreparedStatement pstmt = null;
       
         try {
        	 conn = getConnection();
           
             pstmt = conn.prepareStatement(
               "update member2 set passwd=?,name=?,tel=?,address=? "+
               "where id=?");
             pstmt.setString(1, member.getPasswd());
             pstmt.setString(2, member.getName());
             pstmt.setString(3, member.getTel());
             pstmt.setString(4, member.getAddress());
             pstmt.setString(5, member.getId());
           
             pstmt.executeUpdate();
         }catch(Exception ex) {
             ex.printStackTrace();
         }finally {
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
     }
   
     public int deleteMember(String id, String passwd) //회원탈퇴
     throws Exception {
         Connection conn = null;
         PreparedStatement pstmt = null;
         ResultSet rs= null;
         String dbpasswd="";
         int x=-1;
         
         try {
			 conn = getConnection();

             pstmt = conn.prepareStatement(
           	  "select passwd from member2 where id = ?");
             pstmt.setString(1, id);
             rs = pstmt.executeQuery();
           
			 if(rs.next()){
				 dbpasswd= rs.getString("passwd"); 
				 if(dbpasswd.equals(passwd)){
					 pstmt.close();
					 pstmt = conn.prepareStatement(
           	             "delete from member2 where id=?");
                     pstmt.setString(1, id);
                     pstmt.executeUpdate();
					 x= 1; //회원탈퇴 성공
				 }else
					 x= 0; //비밀번호 틀림
			 }
         }catch(Exception ex) {
             ex.printStackTrace();
         }finally {
             if (rs != null) try { rs.close(); } catch(SQLException ex) {}
             if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
             if (conn != null) try { conn.close(); } catch(SQLException ex) {}
         }
		 return x;
     }
}