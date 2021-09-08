package cs.jpp.bl.branch;

import cs.jpp.dl.branch.BranchService;
import cs.jpp.dto.branch.Branch;

public class BranchBL{
	public static int createBranch(Branch branch){
		int result = 0;
	
		try {
			
			result = BranchService.createBranch(branch);
			
			}catch(Exception e){
				
			e.printStackTrace();
			
			System.out.println("BranchBL : createBranch : Exception :" + e.getMessage());	
			}
			return result;
    }
}