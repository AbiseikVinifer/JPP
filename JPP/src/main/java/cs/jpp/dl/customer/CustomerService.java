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
	
	// Function to fetch all the Customers Details:
	
	public static ArrayList<Customer> getCustomers(int pageNo){
		
		ArrayList<Customer> customers = null;
		String query = "";
		ResultSet rsRows = null;
		Customer customer = null;
		int limit = 0;
		int pageSize = 5;
		
		try {
			pageNo = pageSize * (pageNo - 1);
			customers = new ArrayList<Customer>();
			query = "select pk_customerId, name, fk_branchId, address, mobileNo, emailId, status, approved from tbl_customer where status = 1 order by pk_customerId desc limit " + pageNo + "," + pageSize;
			//query = "select pk_customerId, name, fk_branchId, address, mobileNo, emailId, status, approved from tbl_customer order by pk_customerId desc limit " + pageNo + "," + pageSize;
			
			System.out.println(query);
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
	
	// Function to get the customer details againt Customer ID:
	
	public static Customer getCustomer(int cus_id){
		
		Customer customer = null;
		String query = "";
		ResultSet rsRows = null;
		
		try {
			query = "select * from tbl_customer where pk_customerId = " + cus_id;
			rsRows = DbConnection.executeQuery(query);
			if(rsRows != null) {
				if(rsRows.next()) {
					customer = new Customer();
					customer.setCustomerId(rsRows.getInt("pk_customerId"));
					customer.setName(rsRows.getString("name"));
					customer.setBranchId(rsRows.getInt("fk_branchId"));
					customer.setAddress(rsRows.getString("address"));
					customer.setMobileNo(rsRows.getString("mobileNo"));
					customer.setEmailId(rsRows.getString("emailId"));
					customer.setStatus(rsRows.getByte("status"));
					customer.setApproved(rsRows.getByte("approved"));
					
				}
			}
			
		}catch(Exception e){
			System.out.println("*** ERROR CustomerService : getCustomer : Exception :" + e.getMessage());
		}
		return customer;
	}
	
	public static int updateCustomer(Customer customer) {
		
		int result = 0;
		String query = "";
		
		try {
			// Generate query for Update Customer:
			
			query = "update tbl_customer ";
			query = query + "set name = " + "'" + customer.getName() + "',";
			query = query + "fk_branchId = " + customer.getBranchId() + ",";
			query = query + "address = " + "'" + customer.getAddress() + "',";
			query = query + "mobileNo = " +  "'" + customer.getMobileNo() + "',";
			query = query + "emailId = " + "'" + customer.getEmailId() + "',";
			query = query + "updatedBy = " + customer.getUpdatedBy() + " where pk_customerId = " + customer.getCustomerId();
			
				
			result = DbConnection.executeNonQuery(query);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("*** ERROR CustomerService : updateCustomer : Exception :" + e.getMessage());
		}
		
		return result;
	}
	
	public static int changeCustomerStatus(int cus_Id, byte status) {
		
		int result = 0;
		String query = "";
		
		try {
			// Generate query for Change the Status of the Customer:
			
			query = "update tbl_customer ";
			query = query + "set status = "  + status + " where pk_customerId = " + cus_Id;
			
				
			result = DbConnection.executeNonQuery(query);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("*** ERROR CustomerService : changeCustomerStatus : Exception :" + e.getMessage());
		}
		
		return result;
	}

	// Function to get the customer details against Customer Name:
	
		public static ArrayList<Customer> getCustomerByKey(String searchKey){
			
			ArrayList<Customer> customers = null;
			Customer customer = null;
			String query = "";
			ResultSet rsRows = null;
			
			try {
				query = "select * from tbl_customer where name like '%" + searchKey + "%' or emailId ='" + searchKey +"' or mobileNo ='" + searchKey +"'";
				System.out.println(query);
				rsRows = DbConnection.executeQuery(query);
				if(rsRows != null) {
					customers = new ArrayList<Customer>();
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
				System.out.println("*** ERROR CustomerService : getCustomerByKey : Exception :" + e.getMessage());
			}
			return customers;
		}
		
		public static int getActiveCustomerCount(){
			
			String query = "";
			ResultSet rsRows = null;
			int count = 0;
			
			try {
				query = "select count(*) from tbl_customer where status = 1 ";
				//query = "select count(*) from tbl_customer";
				System.out.println(query);
				rsRows = DbConnection.executeQuery(query);
				if(rsRows != null) {
					if(rsRows.next()) {
						count = rsRows.getInt(1);
					}
				}
				
			}catch(Exception e){
				System.out.println("*** ERROR CustomerService : getActiveCustomerCount : Exception :" + e.getMessage());
			}
			return count;
		}

}
