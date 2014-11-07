package main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * @author ayush
 */

public class ConnectDatabase {
	static Connection con;
	public ConnectDatabase(){
		con=null;
	}

	public static Connection connect() throws Exception {
		con = null;
		try {
			String url;
			url = "jdbc:mysql://" + Config.DB_SERVER + "/" + Config.DB_NAME
					+ "?user=" + Config.DB_USERNAME + "&password="
					+ Config.DB_PASSWORD;
			Class.forName("org.postgresql.Driver");
			con = DriverManager.getConnection(url);
		} catch (SQLException sqle) {
			System.out
					.println("SQLException: Unable to open connection to db: "
							+ sqle.getMessage());
			throw sqle;
		} catch (Exception e) {
			System.out.println("Exception: Unable to open connection to db: "
					+ e.getMessage());
			throw e;
		}

		return con;
	}

	public static void disconnect() throws Exception {
		try {
			if (con != null)
				con.close();
		} catch (SQLException se) {
			se.printStackTrace();

		}
	}

}
