package cs.jpp.bl.customer;

import cs.jpp.dl.customer.CustomerService;
import cs.jpp.dl.db.DbConnection;

import java.sql.ResultSet;
import java.util.ArrayList;
import cs.jpp.dto.customer.Customer;

public class CustomerBL {
	public static int createCustomer(Customer customer) {
		int result = 0;

		try {

			result = CustomerService.createCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CustomerBL : createCustomer : Exception :" + e.getMessage());

		}
		return (result);
	}
	
	public static ArrayList<Customer> getCustomers(int pageNo) {
		ArrayList<Customer> customers = null;
		

		try {

			customers = CustomerService.getCustomers(pageNo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CustomerBL : getCustomers : Exception :" + e.getMessage());

		}
		return customers;
	}
	
	public static Customer getCustomer(int cus_id) {
		Customer customer = null;
		

		try {

			customer = CustomerService.getCustomer(cus_id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CustomerBL : getCustomer : Exception :" + e.getMessage());

		}
		return customer;
	}
	
	public static int updateCustomer(Customer customer) {
		int result = 0;

		try {

			result = CustomerService.updateCustomer(customer);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CustomerBL : updateCustomer : Exception :" + e.getMessage());

		}
		return (result);
	}
	
	public static int changeCustomerStatus(int cus_id, byte status) {
		int result = 0;

		try {

			result = CustomerService.changeCustomerStatus(cus_id, status);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CustomerBL : changeCustomerStatus : Exception :" + e.getMessage());

		}
		return (result);
	}
	
	public static ArrayList<Customer> getCustomerByKey(String searchKey) {
		ArrayList<Customer> customers = null;
		

		try {

			customers = CustomerService.getCustomerByKey(searchKey);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("CustomerBL : getCustomerByKey : Exception :" + e.getMessage());

		}
		return customers;
	}
	
	public static int getActiveCustomerCount(){
		
		int count = 0;
		
		try {
			count = CustomerService.getActiveCustomerCount();
			
		}catch(Exception e){
			System.out.println("*** ERROR CustomerBL : getActiveCustomerCount : Exception :" + e.getMessage());
		}
		return count;
	}
}