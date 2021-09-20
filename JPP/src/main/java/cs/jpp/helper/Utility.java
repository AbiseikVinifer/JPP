package cs.jpp.helper;
import java.util.regex.*;    
import java.util.*;    

public class Utility {
	public static boolean isValidEmail(String email) {
		boolean result = false;
		try {
			//Regular Expression   
	        String regex = "^(.+)@(.+)$";  
	        //Compile regular expression to get the pattern  
	        Pattern pattern = Pattern.compile(regex);  
	          
	            //Create instance of matcher   
	            Matcher matcher = pattern.matcher(email);  
	            result = matcher.matches();    
		}catch(Exception e) {
			System.out.println("Error: Utility : isValidEmail: " + e.getMessage());
		}
		return result;
	}



	public static boolean isValidMobileNo(String mobileNo){    
		boolean result = false;
	
		try {
		    Pattern pattern = Pattern.compile("^\\d{10}$");
		
		    Matcher matcher = pattern.matcher(mobileNo);
		
		    result = matcher.matches();
		}catch(Exception e) {
			System.out.println("Error: Utility : isValidMobileNo: " + e.getMessage());
		}
		return result;
	}
}
