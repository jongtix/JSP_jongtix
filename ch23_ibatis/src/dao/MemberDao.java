package dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import dto.Member;

public class MemberDao {
	private static MemberDao instance;
	private static SqlMapClient sqlMapper;

	// 초기화
	static {
		try {
			// sqlMap설정 정보 초기화
			String confPath = "dao/SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(confPath);
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}// static 끝.

	// 생성자 private
	private MemberDao() {

	}

	// getInstance public
	public static MemberDao getInstance() {
		if (instance == null)
			instance = new MemberDao();
		return instance;
	}

	public List<Member> selectMemberAll() {
		List<Member> list = new ArrayList<Member>();
		try {
			list = sqlMapper.queryForList("selectAll");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	public int insertMember(Member member) throws Exception {
		int result = 0;
		// Object obj;
		// sqlMapper.insert("insertMember",member);
		result = sqlMapper.update("insertMember", member);
		return result;
	}

	public Member getMemberInfo(String id) throws Exception {
		return (Member) sqlMapper.queryForObject("selectMemberInfo", id);
	}

	public int updateMember(Member member) throws Exception {
		return sqlMapper.update("updateMember", member);
	}

	public int deleteMember(String id) throws Exception {
		return sqlMapper.delete("deleteMember", id);
	}

	public int useCheck(String id, String password) throws Exception {
		int result = -1;
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		String dbpass = (String) sqlMapper.queryForObject("userCheck", member);
		if (password.equals(dbpass))
			result = 1;
		return result;
	}
}
