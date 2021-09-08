package cs.jpp.dl.employee;

import cs.jpp.dl.db.DbConnection;

import cs.jpp.dto.employee.Employee;

public class EmployeeService {
	public static int createEmployee(Employee employee) {
		int result = 0;
		String query = "";
		
		try {
			// Generate query for Customer
			
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
			query = query + "'" + employee.getType() + "',";
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
}
