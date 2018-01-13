package test;

import java.sql.Connection;

import util.Connections;

public class Test {

	public static void main(String[] args) {
		Connection conn = Connections.getInstance().getConnections();
		System.out.println(conn);

	}

}
