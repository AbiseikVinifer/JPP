package cs.jpp.bl.branch;

import cs.jpp.dl.branch.BranchService;
import cs.jpp.dto.branch.Branch;
import java.util.ArrayList;

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
	
	public static ArrayList<Branch> getBranches(){
		ArrayList<Branch> branches = null;
		try {
			branches = BranchService.getBranches();
		}catch(Exception e) {
			//e.printStackTrace();
			System.out.println("*** ERROR BranchBL : getBranches : Exception :" + e.getMessage());
		}
		return branches;
	}
	
	public static Branch getBranch(int branchId){
		Branch branch = null;
		try {
			branch = BranchService.getBranch(branchId);
		}catch(Exception e) {
			//e.printStackTrace();
			System.out.println("*** ERROR BranchBL : getBranch : Exception :" + e.getMessage());
		}
		return branch;
	}
}