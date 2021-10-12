package cs.jpp.dl.branch;

import cs.jpp.dl.db.DbConnection;
import cs.jpp.dto.branch.Branch;
import java.util.ArrayList;
import java.sql.ResultSet;

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
	
	public static ArrayList<Branch> getBranches(){
		ArrayList<Branch> branches = null;
		String query = "";
		ResultSet rsRows = null;
		try {
			
			query = "select * from tbl_branch where status = 1";
			rsRows = DbConnection.executeQuery(query);
			if(rsRows != null) {
				branches = new ArrayList<Branch>();
				while(rsRows.next()) {
					Branch branch = new Branch();
					branch.setBranchId(rsRows.getInt("pk_branchId"));
					branch.setName(rsRows.getString("name"));
					branch.setLocation(rsRows.getString("location"));
					branch.setAddress(rsRows.getString("address"));
					branch.setLicenseNo(rsRows.getString("licenseNo"));
					branch.setManagerId(rsRows.getInt("managerId"));
					branch.setPhoneNo(rsRows.getString("phoneNo"));
					branch.setEmailId(rsRows.getString("emailId"));
					branch.setStatus(rsRows.getByte("status"));
					branch.setApproved(rsRows.getByte("approved"));
					
					branches.add(branch);
				}
			}
		}catch(Exception e) {
			//e.printStackTrace();
			System.out.println("*** ERROR BranchService : getBranches : Exception :" + e.getMessage());
		}
		return branches;
	}
	
	public static Branch getBranch(int branchId){
		Branch branch = null;
		String query = "";
		ResultSet rsRows = null;
		try {
			
			query = "select * from tbl_branch where pk_branchId =" + branchId;
			rsRows = DbConnection.executeQuery(query);
			if(rsRows != null) {
				branch = new Branch();
				if(rsRows.next()) {
					branch.setBranchId(rsRows.getInt("pk_branchId"));
					branch.setName(rsRows.getString("name"));
					branch.setLocation(rsRows.getString("location"));
					branch.setAddress(rsRows.getString("address"));
					branch.setLicenseNo(rsRows.getString("licenseNo"));
					branch.setManagerId(rsRows.getInt("managerId"));
					branch.setPhoneNo(rsRows.getString("phoneNo"));
					branch.setEmailId(rsRows.getString("emailId"));
					branch.setStatus(rsRows.getByte("status"));
					branch.setApproved(rsRows.getByte("approved"));
				}
			}
		}catch(Exception e) {
			//e.printStackTrace();
			System.out.println("*** ERROR BranchService : getBranch : Exception :" + e.getMessage());
		}
		return branch;
	}

}
