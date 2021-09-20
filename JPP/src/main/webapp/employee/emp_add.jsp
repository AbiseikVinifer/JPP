<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
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

<div class="container-xl">
<jsp:include page="../include/menu/menu.jsp" />
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Create <b>Employee</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="emp_list.jsp" class="btn btn-success"> <span>Manage Employee</span></a>
										
					</div>
				</div>
			</div>
		<div class="row">
		    <div class="col-sm-2" ></div>
		    <div class="col-sm-4" >
		    
		    	<form>
		    		   <!-- Name input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForName">Name</label>
					    <input type="text" class="form-control" id="cus_name" name="cus_name" required />
					    <small id="emp_name_error" class="text-danger">
				        </small>					    
					  </div>
					  
					  <!-- BranchId input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForBranchId">Branch Id</label>
					    <select class="form-control form-select-sm" id="branchId" name="branchId" required>
							  <option selected value="">Select Branch</option>
							  <option value="1">One</option>
							  <option value="2">Two</option>
							  <option value="3">Three</option>
						</select>
					    <small id="branchId_error" class="text-danger">				          
				        </small>					    
					  </div>
					  
					  <!-- Address input -->
					  <div class="form-outline mb-4">
					    <label for="address" class="form-label">Address</label>
					    <textarea class="form-control" id="address" name="address" rows="5" required></textarea>
					    <small id="address_error" class="text-danger">
				        </small>	
					  </div>
					  
					  		    
		    </div>		 
		    <div class="col-sm-4" >
		    
					
					  <!-- MobileNo input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForMobileNo">Mobile No</label>
					    <input type="text" class="form-control" id="mobileNo" name="mobileNo" required />				
					    <small id="mobileNo_error" class="text-danger">
				        </small>					    
					  </div>
					  
					  <!-- Email input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForEmail">Email</label>
					    <input type="email" class="form-control" id="emailId" name="emailId" required />
					    <small id="email_error" class="text-danger">
				        </small>					    
					  </div>
					  
					  <!-- Qualification input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForEmail">Qualification</label>
					    <input type="text" class="form-control" id="qualification" name="qualification" required />
					    <small id="qualification_error" class="text-danger">
				        </small>					    
					  </div>
					
					<!-- Type input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="labelForEmail">Type</label>
					    <input type="text" class="form-control" id="type" name="type" required />
					    <small id="type_error" class="text-danger">
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