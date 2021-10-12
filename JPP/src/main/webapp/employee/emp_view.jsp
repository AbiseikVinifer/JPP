<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "cs.jpp.bl.employee.EmployeeBL" %>
<%@ page import = "cs.jpp.dto.employee.Employee" %>
<%@ page import = "cs.jpp.helper.Utility" %>
<%@ page import = "cs.jpp.bl.branch.BranchBL" %>
<%@ page import = "cs.jpp.dto.branch.Branch" %>
<%@ page import = "java.util.ArrayList" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous"> 

 <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
  
<script src="../include/js/main.js"></script>
<link rel="stylesheet" href="../include/css/main_style.css">
</head>
<body>
<%!
String emp_name, branchId, branchName, address, mobileNo, emailId, qualification, type;
int emp_id;
%>
<%
emp_name = "";
branchId = "";
address = "";
mobileNo = "";
emailId = "";
qualification = "";
type = "";

	    Employee employee = null;
	    Branch branch = null;
	    
	    try{
	    	emp_id = Integer.parseInt(request.getParameter("emp_id"));
	    	employee = EmployeeBL.getEmployee(emp_id);
	    	
	    	if(employee != null){
	    		emp_name = employee.getName();
	    		branchId = employee.getBranchId() + "";
	    		address = employee.getAddress();
	    		mobileNo = employee.getMobileNo();
	    		emailId = employee.getEmailId();
	    		qualification = employee.getQualification();
	    		type = employee.getType() + "";
	    		
	    		branch = BranchBL.getBranch(employee.getBranchId());
				branchName = branch.getName();
	    	}
	    	
	    }catch(Exception e){
	    	System.out.println("Error emp_edit.jsp : " + e.getMessage());
	    }
%>

<div class="container-xl">
<jsp:include page="../include/menu/menu.jsp" />
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>View <b>Employee</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="emp_list.jsp" class="btn btn-success"> <span>Manage Employee</span></a>
										
					</div>
				</div>
			</div>
		<div class="row">
		    <div class="col-sm-2" ></div>
		    <div class="col-sm-4" >
		    
		    	<form method = post>
		    		   <!-- Name input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForName">Name</label>
					    <input type="text" class="form-control" id="emp_name" name="emp_name" readonly
					    value='<%= emp_name %>'/>		    
					  </div>
					  
					  <!-- BranchId input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForBranchId">Branch Id</label>
					  	<input type="text" class="form-control" id="branch_id" name="branch_id" readonly 
					    value='<%= branchId %>'/>						    
					  </div>
					  
					  <!-- BranchName input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForBranchId">Branch Name</label>
					    <input type="text" class="form-control" id="branchName" name="branchName" readonly
					    value='<%= branchName %>'/>		    
					  </div>
					  
					  <!-- Address input -->
					  <div class="form-outline mb-4">
					    <label for="address" class="form-label">Address</label>
					    <textarea class="form-control" id="address" name="address" rows="5" readonly
					    ><%= address %></textarea>	
					  </div>
					  
					  		    
		    </div>		 
		    <div class="col-sm-4" >
		    
					
					  <!-- MobileNo input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForMobileNo">Mobile No</label>
					    <input type="text" class="form-control" id="mobileNo" name="mobileNo" readonly
					    value='<%= mobileNo %>'/>				    
					  </div>
					  
					  <!-- Email input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForEmail">Email</label>
					    <input type="email" class="form-control" id="emailId" name="emailId" readonly
					    value='<%= emailId %>'/>				    
					  </div>
					  
					  <!-- Qualification input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForEmail">Qualification</label>
					    <input type="text" class="form-control" id="qualification" name="qualification" readonly 
					    value='<%= qualification %>'/>				    
					  </div>
					
					<!-- Type input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForType">Type</label>
					    <input type="text" class="form-control" id="type" name="type" readonly
					    value='<%= type  %>'/>
							    
					  </div>
					  
		    </div>
		    
		    <div class="col-sm-2" ></div>
		</div>
		</div>
	</div>        
</div>
 
</body>
</html>