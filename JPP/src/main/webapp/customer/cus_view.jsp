<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "cs.jpp.helper.Utility" %>
<%@ page import = "cs.jpp.dto.customer.Customer" %>
<%@ page import = "cs.jpp.bl.customer.CustomerBL" %>
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
String cus_name, branchId, branchName, mobileNo, emailId, address, display_status, display_approved;
int cus_id;
byte status, approved;
%>

<%
// initializing the variables
cus_name = "";
branchId = ""; 
branchName = "";
mobileNo = ""; 
emailId = ""; 
address = "";
display_status = "";
display_approved = "";

		Customer customer = null;
		Branch branch = null;

		try{
			cus_id = Integer.parseInt(request.getParameter("cus_id"));
			customer = CustomerBL.getCustomer(cus_id);
			
			if(customer != null){
				cus_name = customer.getName();
				branchId = customer.getBranchId() + "";
				mobileNo = customer.getMobileNo();
				emailId = customer.getEmailId();
				address = customer.getAddress();
				status = customer.getStatus();
				approved = customer.getApproved();
				
				branch = BranchBL.getBranch(customer.getBranchId());
				branchName = branch.getName();
				
				display_status = (status == 1) ? "Active" : "Inactive";
				display_approved = (approved == 1) ? "Approved" : "Not Approved";
			}
		} catch(Exception e){
			System.out.println("Error: cus_edit.jsp: " + e.getMessage());
		}
	    // It was likely a GET request.
%>

<div class="container-xl">
<jsp:include page="../include/menu/menu.jsp" />
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>View <b>Customer</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="cus_list.jsp" class="btn btn-success"> <span>Manage Customer</span></a>
										
					</div>
				</div>
			</div>
			
		<div class="row">
		<form method = post>
		    <div class="col-sm-2" ></div>
		    <div class="col-sm-4" >
		    		  
		    		  <!-- CustomerId input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForId">Customer Id</label>
					    <input type="text" id="cus_id" name="cus_id" class="form-control" readonly 
					    value='<%= cus_id %>'/>				    
					  </div>
					  
					   <!-- Name input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForName">Name</label>
					    <input type="text" id="cus_name" name="cus_name" class="form-control" readonly 
					    value='<%= cus_name %>'/>					    
					  </div>
					  
					  <!-- BranchId input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForBranchId">Branch Id</label>
					  	<input type="text" id="branch_id" name="branch_id" class="form-control" readonly 
					    value='<%= branchId %>'/>						    
					  </div>
					  
					  <!-- Branch_Name input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForBranchName">Branch Name</label>
					    <input type="text" id="branchName" class="form-control" name="branchName" readonly
					    value='<%= branchName %>'/>					    
					  </div>
					  
					  <!-- Email input -->
					 <div class="form-outline mb-4">
						  	<label class="form-label" for="labelForEmail">Email</label>
						    <input type="email" id="emailId" class="form-control" name="emailId" readonly
						    value='<%= emailId %>'/>					    
					    </div>
					  		  		    
		    </div>		 
		    <div class="col-sm-4" >
					
					  <!-- MobileNo input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForMobileNo">Mobile No</label>
					    <input type="text" id="mobileNo" class="form-control" name="mobileNo" readonly
					    value='<%= mobileNo %>'/>									    
					  </div>
					  
					   <!-- Status input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForStatus">Status</label>
					    <input type="text" id="status" class="form-control" name="status" readonly
					    value='<%= display_status %>'/>					    
					  </div>
					  
					  <!-- Approved input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForApproved">Approved</label>
					    <input type="text" id="approved" class="form-control" name="approved" readonly
					    value='<%= display_approved %>'/>					    
					  </div>
					  
					  <div class="form-outline mb-4">
					    <label for="address" class="form-label">Address</label>
					    <textarea class="form-control" id="address" name="address" rows="5" readonly
					    ><%= address %></textarea>
				      </div>
				      
			</div>
		</form>    
		</div>					
		</div>
	</div>        
</div>
 
</body>
</html>