package dao;

import java.io.Reader;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import dto.Member;

public class LoginDao {
	private static LoginDao instance;
	private static SqlMapClient sqlMapper;

	static {
		try {
			String confPath = "dao/SqlMapConfig.xml";
			Reader reader = Resources.getResourceAsReader(confPath);
			sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
			reader.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	private LoginDao() {

	}

	public static LoginDao getInstance() {
		if (instance == null)
			instance = new LoginDao();
		return instance;
	}

	public int useCheck(String id, String password) throws Exception {
		int result = -1;
		String dbpass = (String) sqlMapper.queryForObject("userCheck2", id);
		if (password.equals(dbpass))
			result = 1;
		return result;
	}
}
