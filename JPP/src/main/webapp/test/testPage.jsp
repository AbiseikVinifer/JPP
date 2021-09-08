<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "cs.jpp.bl.AuthenticationBl" %>
    <%@page import = "cs.jpp.bl.customer.CustomerBL" %>
    <%@page import = "cs.jpp.dto.customer.Customer" %>
    
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
Customer customer = new Customer();

customer.setName("Abiseik");
customer.setAddress("Kanniyakumari");
customer.setApproved(approved);
customer.setBranchId(101);
customer.setCreatedBy(111);
customer.setEmailId("abigmail.com");
customer.setMobileNo("7010123645");
customer.setStatus(status);

int result = CustomerBL.createCustomer(customer);

if(result > 0){
	out.print("sucess");
}else{
	out.print("failed");
}

%>
</body>
</html>