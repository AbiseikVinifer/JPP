package cs.jpp.dl.customer;

import cs.jpp.dl.db.DbConnection;
import cs.jpp.dto.customer.Customer;

public class CustomerService {
	public static int createCustomer(Customer customer) {
		int result = 0;
		String query = "";
		
		try {
			// Generate query for Customer
			
			query = "insert into tbl_customer (";
			query = query + "name,";
			query = query + "fk_branchId,";
			query = query + "address,";
			query = query + "mobileNo,";
			query = query + "emailId,";
			query = query + "status,";
			query = query + "approved,";
			query = query + "createdBy)";
			query = query + "values(";
			query = query + "'" + customer.getName() + "',";
			query = query +  customer.getBranchId() + ",";
			query = query + "'" + customer.getAddress() + "',";
			query = query + "'" + customer.getMobileNo() + "',";
			query = query + "'" + customer.getEmailId() + "',";
			query = query + customer.getStatus() + ",";
			query = query + customer.getApproved() + ",";
			query = query + customer.getCreatedBy() + ")";
			
				
			result = DbConnection.executeNonQuery(query);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("*** ERROR CustomerService : createCustomer : Exception :" + e.getMessage());
		}
		
		return result;
	}

}
