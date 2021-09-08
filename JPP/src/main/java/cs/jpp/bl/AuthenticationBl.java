package cs.jpp.bl;
import cs.jpp.dl.AuthenticationService;

public class AuthenticationBl {
	
	public static void signIn() {
		try {
			AuthenticationService.signIn();
		}catch(Exception e) {
			System.out.println("*** ERROR AuthenticationBl signIn :" + e.getMessage());
		}
	}

}
