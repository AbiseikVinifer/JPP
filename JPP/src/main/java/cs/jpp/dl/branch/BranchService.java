package cs.jpp.dl.branch;

import cs.jpp.dl.db.DbConnection;
import cs.jpp.dto.branch.Branch;


public class BranchService {
	public static int createBranch(Branch branch) {
		int result = 0;
		String query = "";
		
		try {
			// Generate query for Customer
			
			query = "insert into tbl_employee (";
			query = query + "name,";
			query = query + "location,";
			query = query + "address,";
			query = query + "licenseNo,";
			query = query + "managerId,";
			query = query + "phoneNo,";
			query = query + "emailId,";
			query = query + "status,";
			query = query + "approved,";
			query = query + "createdBy)";
			query = query + "values(";
			query = query + "'" + branch.getName() + "',";
			query = query + "'" + branch.getLocation() + "',";
			query = query + "'" + branch.getAddress() + "',";
			query = query + "'" + branch.getLicenseNo() + "',";
			query = query + branch.getManagerId() + ",";
			query = query + "'" + branch.getPhoneNo() + "',";
			query = query + "'" + branch.getEmailId() + "',";
			query = query + branch.getStatus() + ",";
			query = query + branch.getApproved() + ",";
			query = query + branch.getCreatedBy() + ")";
			
				
			result = DbConnection.executeNonQuery(query);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("*** ERROR BranchService : createBranch : Exception :" + e.getMessage());
		}
		
		return result;
	}

}
