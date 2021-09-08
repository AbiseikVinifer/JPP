package cs.jpp.bl.employee;

import cs.jpp.dl.employee.EmployeeService;
import cs.jpp.dto.employee.Employee;

public class EmployeeBL {
	public static int createEmployee(Employee employee) {
		int result = 0;

		try {

			result = EmployeeService.createEmployee(employee);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EmployeeBL : createEmployee : Exception :" + e.getMessage());

		}
		return (result);
	}
}
