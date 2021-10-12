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
String emp_name_error, branchId_error, address_error, mobileNo_error, emailId_error, qualification_error, type_error;
String emp_name, branchId, address, mobileNo, emailId, qualification, type;
int emp_id;
boolean error = false;
%>
<%
emp_name_error = "";
branchId_error = "";
address_error = "";
mobileNo_error = "";
emailId_error = "";
qualification_error = "";
type_error = "";

emp_name = "";
branchId = "";
address = "";
mobileNo = "";
emailId = "";
qualification = "";
type = "";

	if ("POST".equalsIgnoreCase(request.getMethod())) {
		emp_id = Integer.parseInt(request.getParameter("emp_id"));
		emp_name = request.getParameter("emp_name");
		branchId = request.getParameter("branchId");
		address = request.getParameter("address");
		mobileNo = request.getParameter("mobileNo");
		emailId = request.getParameter("emailId");
		qualification = request.getParameter("qualification");
		type = request.getParameter("type");
		
		if(emp_name.length() == 0){
			emp_name_error = "name should not be empty";
			error = true;
		}
		
		if(branchId.length() == 0){
			branchId_error = "Select a Branch";
			error = true;
		}
			
		if(address.length() == 0){
			address_error = "Address should not be empty";
			error = true;
		}
		
		if(mobileNo.length() == 0){
			mobileNo_error = "Mobile No should not be empty";
			error = true;
		}else if(!Utility.isValidMobileNo(mobileNo)){
			mobileNo_error = "Mobile No should be 10 numeric digits";
			error = true;
		}
		
		if(emailId.length() == 0){
			emailId_error = "Email ID should not be empty";
			error = true;	
		}else if(!Utility.isValidEmail(emailId)){
			emailId_error = "Invalid Email ID";
			error = true;
		}
		
		if(error == false){
			Employee employee = null;
			int result = 0;
			int emp_id = 1;
			int user_id = 1;
			
			try{
				employee = new Employee();
				employee.setEmployeeId(emp_id);
				employee.setName(emp_name);
				employee.setBranchId(Integer.parseInt(branchId));
				employee.setAddress(address);
				employee.setMobileNo(mobileNo);
				employee.setEmailId(emailId);
				employee.setQualification(qualification);
				employee.setType(Integer.parseInt(type));
				employee.setUpdatedBy(user_id);
				
				result = EmployeeBL.updateEmployee(employee);
				if(result > 0){
					response.sendRedirect("emp_list.jsp");
				}else{
					System.out.println("Employee update error");
				}
				
			}catch(Exception e){
				System.out.println("Error: emp_edit.jsp: " + e.getMessage());
			}
			
		}
		
	}else {
		System.out.println("form not submitted");
	    Employee employee = null;
	    
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
	    	}
	    	
	    }catch(Exception e){
	    	System.out.println("Error emp_edit.jsp : " + e.getMessage());
	    }
	}
%>

<div class="container-xl">
<jsp:include page="../include/menu/menu.jsp" />
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Edit <b>Employee</b></h2>
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
					    <input type="text" class="form-control" id="emp_name" name="emp_name" required
					    value='<%= emp_name %>'/>
					    <input type="hidden" class="form-control" id="emp_id" name="emp_id" required
					    value='<%= emp_id %>'/>
					    <small id="emp_name_error" class="text-danger">
					    <%= emp_name_error %>
				        </small>					    
					  </div>
					  
					  <!-- BranchId input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForBranchId">Branch Id</label>
					    <select class="form-control form-select-sm" id="branchId" name="branchId">
					     <option value="">Select Branch</option>
							  <%
							  	ArrayList<Branch> branches = null;
					  			try{
					  				branches = BranchBL.getBranches();
					  				if(branches != null){
					  					for(Branch branch : branches){ 
					  						String branch_id = branch.getBranchId() + "";
					  						System.out.println("DB_ALL branch_id" + branch_id + "a");
					  						System.out.println("Edit_branchId" + branchId + "a");
					  						if(branchId.equals(branch_id)){ 
					  							System.out.println("matched"); %>
					  							 <option selected value='<%= branch_id %>'><%= branch.getName() %></option>
					  						<% }else{ %>
					  							<option value='<%= branch_id %>'><%= branch.getName() %></option>
					  						<% }					  					
					  					}
					  				}
					  			}catch(Exception e){
									System.out.println("Error: emp_edit.jsp : BarnchId dropdown : " + e.getMessage());
								}
							  %>
						</select>
					    <small id="branchId_error" class="text-danger">	
					    <%= branchId_error %>		          
				        </small>					    
					  </div>
					  
					  <!-- Address input -->
					  <div class="form-outline mb-4">
					    <label for="address" class="form-label">Address</label>
					    <textarea class="form-control" id="address" name="address" rows="5" required
					    ><%= address %></textarea>
					    <small id="address_error" class="text-danger">
					    <%= address_error %>
				        </small>	
					  </div>
					  
					  		    
		    </div>		 
		    <div class="col-sm-4" >
		    
					
					  <!-- MobileNo input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForMobileNo">Mobile No</label>
					    <input type="text" class="form-control" id="mobileNo" name="mobileNo" required
					    value='<%= mobileNo %>'/>				
					    <small id="mobileNo_error" class="text-danger">
					    <%= mobileNo_error %>
				        </small>					    
					  </div>
					  
					  <!-- Email input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForEmail">Email</label>
					    <input type="email" class="form-control" id="emailId" name="emailId" required
					    value='<%= emailId %>'/>
					    <small id="email_error" class="text-danger">
					    <%= emailId_error %>
				        </small>					    
					  </div>
					  
					  <!-- Qualification input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForEmail">Qualification</label>
					    <input type="text" class="form-control" id="qualification" name="qualification" required 
					    value='<%= qualification %>'/>
					    <small id="qualification_error" class="text-danger">
					    <%= qualification_error %>
				        </small>					    
					  </div>
					
					<!-- Type input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForType">Type</label>
					    <select class="form-control form-select-sm" id="type" name="type">
							  <option  value="">Select Type</option>
							  <% if(type.equals("1")){ %>
								  <option selected value="1">Super Admin</option>
							  <% }else{ %>
								  <option value="1">Super Admin</option>
							 <% } %>
							 <% if(type.equals("2")){ %>
								  <option selected value="2">Branch Manager</option>
							  <% }else{ %>
								  <option value="2">Branch Manager</option>
							 <% } %>
							 <% if(type.equals("3")){ %>
								  <option selected value="3">Clerk</option>
							  <% }else{ %>
								  <option value="3">Clerk</option>
							 <% } %>
							  <% if(type.equals("4")){ %>
								  <option selected value="4">Appraisal</option>
							  <% }else{ %>
								  <option value="4">Appraisal</option>
							 <% } %>
						</select>
					    <small id="type_error" class="text-danger">	
					    <%= type_error %>		          
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