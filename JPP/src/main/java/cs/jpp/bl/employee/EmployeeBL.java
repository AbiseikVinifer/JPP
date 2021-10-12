package cs.jpp.bl.employee;

import java.util.ArrayList;
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
	
	public static ArrayList<Employee> getEmployees() {
		ArrayList<Employee> employees = null;

		try {

			employees = EmployeeService.getEmployees();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EmployeeBL : ArrayList<Employee> : Exception :" + e.getMessage());

		}
		return (employees);
	}
	
	public static Employee getEmployee(int emp_id) {
		Employee employee = null;

		try {

			employee = EmployeeService.getEmployee(emp_id);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EmployeeBL : getEmployee : Exception :" + e.getMessage());

		}
		return (employee);
	}
	
	public static int updateEmployee(Employee employee) {
		int result = 0;

		try {
			result = EmployeeService.updateEmployee(employee);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EmployeeBL : updateEmployee : Exception :" + e.getMessage());

		}
		return result;
	}
	
	public static int changeEmployeeStatus(int emp_id, byte status) {
		int result = 0;
		
		try {
			result = EmployeeService.changeEmployeeStatus(emp_id, status);
		}catch(Exception e) {
			System.out.println("EmployeeBL : changeEmployeeStatus : Exception : " + e.getMessage());
		}
		return result;
	}
}
