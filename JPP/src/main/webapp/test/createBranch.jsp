<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import = "cs.jpp.bl.branch.BranchBL" %>
    <%@page import = "cs.jpp.dto.branch.Branch" %>
    
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
Branch branch = new Branch();

branch.setName("Karungal");
branch.setLocation("Kanniyakumari");
branch.setAddress("TamilNadu");
branch.setLicenseNo("TN75686552278");
branch.setManagerId(1122);
branch.setPhoneNo("9566621214");
branch.setEmailId("kgl@gmail.com");
branch.setStatus(status);
branch.setApproved(approved);
branch.setCreatedBy(1122);

int result = BranchBL.createBranch(branch);

if(result > 0){
	out.print("sucess");
}else{
	out.print("failed");
}
%>
</body>
</html>