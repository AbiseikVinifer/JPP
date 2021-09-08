package cs.jpp.dl;
import cs.jpp.dl.db.DbConnection;

public class AuthenticationService {
	
	public static void signIn() {
		try {
			DbConnection connection = new DbConnection();
			connection.closeDbConnection();
			
		}catch(Exception e){
			System.out.println("*** ERROR AuthenticationService signIn :" + e.getMessage());
		}
	}

}
