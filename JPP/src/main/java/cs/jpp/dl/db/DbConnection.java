package cs.jpp.dl.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DbConnection {
	public static Connection con;
	public static Statement stmt;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(DbConfig.dbServer + DbConfig.dbName, DbConfig.userName, DbConfig.password);
			stmt = con.createStatement();
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("*** ERROR DbConnection static: ClassNotFoundException :" + e.getMessage());
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("*** ERROR DbConnection static: SQLException :" + e.getMessage());
		}
	}

	public static void closeDbConnection() {
		try {
			if (stmt != null) {
				stmt.close();
			} 

		  con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("*** ERROR DbConnection : closeDbConnection : SQLException :" + e.getMessage());
		}
		
	} 
	
	public static int executeNonQuery(String query) {
		int result = 0;
		try {
			result = stmt.executeUpdate(query);

			//closeDbConnection();
		} catch (SQLException e) {
			result = -1;
			e.printStackTrace();
			System.out.println("*** ERROR DbConnection : executeNonQuery : SQLException :" + e.getMessage());
		}
		return result;
	}
	
	public static ResultSet executeQuery(String query) {
		ResultSet rsRows = null ;
		try {
			/* if (stmt != null) {
				stmt.o();
			} */
			rsRows = stmt.executeQuery(query);

			//closeDbConnection();
		} catch (SQLException e) {
						
			System.out.println("*** ERROR DbConnection : executeQuery : SQLException :" + e.getMessage());
		}
		return rsRows;
	}

}
