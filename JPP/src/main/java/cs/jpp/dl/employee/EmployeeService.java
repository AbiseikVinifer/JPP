package cs.jpp.dl.employee;

import java.util.ArrayList;
import java.sql.ResultSet;
import cs.jpp.dl.db.DbConnection;
import cs.jpp.dto.employee.Employee;

public class EmployeeService {
	public static int createEmployee(Employee employee) {
		int result = 0;
		String query = "";
		
		try {
			// Generate query for Employee:
			
			query = "insert into tbl_employee (";
			query = query + "name,";
			query = query + "fk_branchId,";
			query = query + "address,";
			query = query + "mobileNo,";
			query = query + "emailId,";
			query = query + "qualification,";
			query = query + "type,";
			query = query + "status,";
			query = query + "approved,";
			query = query + "createdBy)";
			query = query + "values(";
			query = query + "'" + employee.getName() + "',";
			query = query +  employee.getBranchId() + ",";
			query = query + "'" + employee.getAddress() + "',";
			query = query + "'" + employee.getMobileNo() + "',";
			query = query + "'" + employee.getEmailId() + "',";
			query = query + "'" + employee.getQualification() + "',";
			query = query + employee.getType() + ",";
			query = query + employee.getStatus() + ",";
			query = query + employee.getApproved() + ",";
			query = query + employee.getCreatedBy() + ")";
			
				
			result = DbConnection.executeNonQuery(query);
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("*** ERROR EmployeeService : createEmployee : Exception :" + e.getMessage());
		}
		
		return result;
	}
	
	// Function to fetch all the Employees Details:
	public static ArrayList<Employee> getEmployees(){
		ArrayList<Employee> employees = null;
		String query = "";
		ResultSet rsRows = null;
		Employee employee = null;
		
		try {
			employees = new ArrayList<Employee>();
			query = "select * from tbl_employee where status = 1";
			rsRows = DbConnection.executeQuery(query);
			if(rsRows != null) {
				while(rsRows.next()) {
					employee = new Employee();
					employee.setEmployeeId(rsRows.getInt("pk_employeeId"));
					employee.setName(rsRows.getString("name"));
					employee.setBranchId(rsRows.getInt("fk_branchId"));
					employee.setAddress(rsRows.getString("address"));
					employee.setMobileNo(rsRows.getString("mobileNo"));
					employee.setEmailId(rsRows.getString("emailId"));
					employee.setQualification(rsRows.getString("qualification"));
					employee.setType(rsRows.getInt("type"));
					employee.setStatus(rsRows.getByte("status"));
					employee.setApproved(rsRows.getByte("approved"));
					
					employees.add(employee);
				}
			}
			
		}catch(Exception e) {
			System.out.println("*** ERROR EmployeeService : getEmployee : Exception :" + e.getMessage());
		}
		
		return employees;
	}
	
	// Function to get the customer details against Employee ID:
	public static Employee getEmployee(int emp_id){
		String query = "";
		ResultSet rsRows = null;
		Employee employee = null;
		
		try {			
			query = "select * from tbl_employee where pk_employeeId = " + emp_id;
			rsRows = DbConnection.executeQuery(query);
			if(rsRows != null) {
				if(rsRows.next()) {
					employee = new Employee();
					employee.setEmployeeId(rsRows.getInt("pk_employeeId"));
					employee.setName(rsRows.getString("name"));
					employee.setBranchId(rsRows.getInt("fk_branchId"));
					employee.setAddress(rsRows.getString("address"));
					employee.setMobileNo(rsRows.getString("mobileNo"));
					employee.setEmailId(rsRows.getString("emailId"));
					employee.setQualification(rsRows.getString("qualification"));
					employee.setType(rsRows.getInt("type"));
					employee.setStatus(rsRows.getByte("status"));
					employee.setApproved(rsRows.getByte("approved"));
					
				}
			}
			
		}catch(Exception e) {
			System.out.println("*** ERROR EmployeeService : getEmployee : Exception :" + e.getMessage());
		}
		
		return employee;
	} 
	
	public static int updateEmployee(Employee employee) {
		int result = 0;
		String query = "";
		try {
			query = "update tbl_employee ";
			query = query + "set name = "+"'"+employee.getName()+"',";
			query = query + "fk_branchId = "+employee.getBranchId()+",";
			query = query + "address = "+"'"+employee.getAddress()+"',";
			query = query + "mobileNo = "+"'"+employee.getMobileNo()+"'," ;
			query = query + "emailId = "+"'"+employee.getEmailId()+"',";
			query = query + "qualification = "+"'"+employee.getQualification()+"',";
			query = query + "type = "+employee.getType()+",";
			query = query + "status = "+"'"+employee.getStatus()+"',";
			query = query + "updatedBy = "+employee.getUpdatedBy() + "where pk_employeeId = " + employee.getEmployeeId();
			
			result = DbConnection.executeNonQuery(query);
			
		}catch(Exception e) {
			System.out.println("*** ERROR EmployeeService : updateEmployee : Exception :" + e.getMessage());
		}
		return result;
	}
	
	public static int changeEmployeeStatus(int emp_id, byte status) {
		int result = 0;
		String query = "";
		try {
			query = "update tbl_employee ";
			query = query + "set status = " + status + " where pk_employeeId = "+ emp_id;
			System.out.println(query);
			result = DbConnection.executeNonQuery(query);
			
		}catch(Exception e) {
			System.out.println("*** ERROR EmployeeService : changeEmployeeStatus : Exception :" + e.getMessage());
		}
		return result;
	}
}
