package cs.jpp.dl.customer;

import cs.jpp.dl.db.DbConnection;
import java.util.ArrayList;
import cs.jpp.dto.customer.Customer;
import java.sql.ResultSet;

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
	
	public static ArrayList<Customer> getCustomers(){
		ArrayList<Customer> customers = null;
		String query = "";
		ResultSet rsRows = null;
		Customer customer = null;
		
		try {
			customers = new ArrayList<Customer>();
			query = "select * from tbl_customer";
			rsRows = DbConnection.executeQuery(query);
			if(rsRows != null) {
				while(rsRows.next()) {
					customer = new Customer();
					customer.setCustomerId(rsRows.getInt("pk_customerId"));
					customer.setName(rsRows.getString("name"));
					customer.setBranchId(rsRows.getInt("fk_branchId"));
					customer.setAddress(rsRows.getString("address"));
					customer.setMobileNo(rsRows.getString("mobileNo"));
					customer.setEmailId(rsRows.getString("emailId"));
					customer.setStatus(rsRows.getByte("status"));
					customer.setApproved(rsRows.getByte("approved"));
					
					customers.add(customer);
				}
			}
			
		}catch(Exception e){
			System.out.println("*** ERROR CustomerService : getCustomers : Exception :" + e.getMessage());
		}
		return customers;
	}

}
