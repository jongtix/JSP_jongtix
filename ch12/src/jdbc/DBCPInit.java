package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 서블릿이 초기화
	public void init(ServletConfig config) throws ServletException {
		loadJDBCDriver();
		initConnectionPool();
	}

	private void loadJDBCDriver() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException cnfe) {
			throw new RuntimeException("fail to load JDBC DRiver", cnfe);
		}
	}

	private void initConnectionPool() {
		try {
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "hr";
			String password = "hr";

			ConnectionFactory connFactory = new DriverManagerConnectionFactory(url, user, password);

			PoolableConnectionFactory poolableConnectionFactory = new PoolableConnectionFactory(connFactory, null);

			poolableConnectionFactory.setValidationQuery("select 1");

			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			// pool에 머물 수 있는 유휴시간
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			// 유효성 검사
			poolConfig.setTestWhileIdle(true);
			// 유휴 커넥션 갯수
			poolConfig.setMinIdle(4);
			// 최대 접속 갯수
			poolConfig.setMaxTotal(50);

			// Pool객체 생성
			GenericObjectPool<PoolableConnection> connectionPool = new GenericObjectPool<>(poolableConnectionFactory,
					poolConfig);

			Class.forName("org.apache.commons.dbcp2.PoolingDriver");
			PoolingDriver driver = (PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("oraDb", connectionPool);

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
