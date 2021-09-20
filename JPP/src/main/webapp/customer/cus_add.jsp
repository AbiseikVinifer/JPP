<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "cs.jpp.helper.Utility" %>
<%@ page import = "cs.jpp.dto.customer.Customer" %>
<%@ page import = "cs.jpp.bl.customer.CustomerBL" %>
    
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
String cus_name_error, branchId_error, mobileNo_error, emailId_error, address_error;
String cus_name, branchId, mobileNo, emailId, address;
boolean error = false;
%>

<%
// initializing the error message
cus_name_error = "";
branchId_error = ""; 
mobileNo_error = ""; 
emailId_error = ""; 
address_error = "";

cus_name = "";
branchId = ""; 
mobileNo = ""; 
emailId = ""; 
address = "";

	if ("POST".equalsIgnoreCase(request.getMethod())) {
		
		// getting values from the form to variable
		
		cus_name = request.getParameter("cus_name"); 
		branchId = request.getParameter("branchId");
		mobileNo = request.getParameter("mobileNo"); 
		emailId = request.getParameter("emailId"); 
		address = request.getParameter("address");
		
		// serverside validation - validate all form controls
		
		if(cus_name.length() == 0){
			cus_name_error = "name should not be empty";
			error = true;			
		}
		
		if(branchId.length() == 0){
			branchId_error = "Select a Branch";
			error = true;
		}
		
		if(emailId.length() == 0){
			emailId_error = "Email ID should not be empty";
			error = true;	
		}else if(!Utility.isValidEmail(emailId)){
			emailId_error = "Invalid Email ID";
			error = true;
		}
		
		if(mobileNo.length() == 0){
			mobileNo_error = "Mobile No should not be empty";
			error = true;
		}else if(!Utility.isValidMobileNo(mobileNo)){
			mobileNo_error = "Mobile No should be 10 numeric digits";
			error = true;
		}
		
		if(address.length() == 0){
			address_error = "Address should not be empty";
			error = true;
		}
		
		// if there is no errors
		if(error == false){
			// code to pass the customer details to business logic 
			Customer customer = null;
			int result = 0; 
			byte status = 1; 
			try{
				
				customer = new Customer();
			    customer.setName(cus_name);
			    customer.setBranchId(Integer.parseInt(branchId));
			    customer.setEmailId(emailId);
			    customer.setMobileNo(mobileNo);
			    customer.setAddress(address);
			    customer.setStatus(status);
			    
			   	result = CustomerBL.createCustomer(customer);
			   	if(result>0){
			   		response.sendRedirect("cus_list.jsp");
			   	}else{
			   		System.out.println("Customer creation error");
			   	}
			} catch(Exception e){
				System.out.println("Error: cus_add.jsp: " + e.getMessage());
			}
		    
		}
	    
	   
	} else {
		System.out.println("form not submitted");
	    // It was likely a GET request.
	}
%>

<div class="container-xl">
<jsp:include page="../include/menu/menu.jsp" />
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Create <b>Customer</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="cus_list.jsp" class="btn btn-success"> <span>Manage Customer</span></a>
										
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
					    <input type="text" id="cus_name" name="cus_name" class="form-control" required 
					    value='<%= cus_name %>'/>
					    <small id="cus_name_error" class="text-danger">
				         <%= cus_name_error %>
				        </small>					    
					  </div>
					  
					  <!-- BranchId input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForBranchId">Branch Id</label>
					    <select class="form-control form-select-sm" id="branchId" name="branchId">
							  <option selected value="">Select Branch</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
						</select>
					    <small id="branchId_error" class="text-danger">
				          <%= branchId_error %>
				        </small>					    
					  </div>
					  <!-- Email input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForEmail">Email</label>
					    <input type="email" id="emailId" class="form-control" name="emailId" required
					    value='<%= emailId %>'/>
					    <small id="email_error" class="text-danger">
				          <%= emailId_error %>
				        </small>					    
					  </div>
					  
					  		    
		    </div>		 
		    <div class="col-sm-4" >
		    
					
					  <!-- MobileNo input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForMobileNo">Mobile No</label>
					    <input type="text" id="mobileNo" class="form-control" name="mobileNo" required
					    value='<%= mobileNo %>'/>				
					    <small id="mobileNo_error" class="text-danger">
				        <%= mobileNo_error %>
				        </small>					    
					  </div>
					  
					  <div class="form-outline mb-4">
					    <label for="address" class="form-label">Address</label>
					    <textarea class="form-control" id="address" name="address" rows="5" required
					    /><%= address %></textarea>
					    <small id="address_error" class="text-danger">
				        <%= address_error %>
				        </small>	
					  </div>
					
					  
		    </div>
		    
		    <div class="col-sm-2" ></div>
		</div>
		
			<div class="row">
			    <div class="col-sm-2" ></div>
			    <div class="col-sm-8" >
			   			 <!-- Submit button -->
					 	 <input type="submit" class="btn btn-primary btn-block" id="submit" name="submit" value="Submit"/>
						 </form>
			    </div>
			    <div class="col-sm-2" ></div>
			</div>
					
		</div>
	</div>        
</div>
 
</body>
</html>