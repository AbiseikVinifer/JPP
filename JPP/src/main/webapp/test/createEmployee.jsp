<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "cs.jpp.bl.employee.EmployeeBL" %>
    <%@page import = "cs.jpp.dto.employee.Employee" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
byte approved = 1;
byte status = 1;
Employee employee = new Employee();

employee.setName("Victor");
employee.setBranchId(1011);
employee.setAddress("Porur, Chennai-600116");
employee.setMobileNo("9888484421");
employee.setEmailId("victorm@gmail.com");
employee.setQualification("MBA");
employee.setType("");
employee.setStatus(status);
employee.setApproved(approved);
employee.setCreatedBy(111);

int result = EmployeeBL.createEmployee(employee);

if(result > 0){
	out.print("sucess");
}else{
	out.print("failed");
}
%>
</body>
</html>