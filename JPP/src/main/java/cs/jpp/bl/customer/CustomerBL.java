package cs.jpp.bl.customer;

import cs.jpp.dl.customer.CustomerService;
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
}