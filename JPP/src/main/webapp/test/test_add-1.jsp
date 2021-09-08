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
						<h2>Create <b>Customer</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="test_list.jsp" class="btn btn-success"> <span>Manage Customer</span></a>
										
					</div>
				</div>
			</div>
		<div class="row">
		    <div class="col-sm-4" ></div>
		    <div class="col-sm-4" >
		    	<form>
					  <!-- Email input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="form1Example1">Email address</label>
					    <input type="email" id="form1Example1" class="form-control" required />					    
					  </div>
					
					  <!-- Password input -->
					  <div class="form-outline mb-4">
					  	<label class="form-label" for="form1Example2">Password</label>
					    <input type="password" id="form1Example2" class="form-control" required />				
					    <small id="passwordHelp" class="text-danger">
				          Must be 8-20 characters long.
				        </small>
					    
					  </div>
					
					  <!-- 2 column grid layout for inline styling -->
					  <div class="row mb-4">
					    <div class="col d-flex justify-content-center">
					      <!-- Checkbox -->
					      <div class="form-check">
					        <input
					          class="form-check-input"
					          type="checkbox"
					          value=""
					          id="form1Example3"
					          checked
					        />
					        <label class="form-check-label" for="form1Example3"> Remember me </label>
					      </div>
					    </div>
					
					    <div class="col">
					      <!-- Simple link -->
					      <a href="#!">Forgot password?</a>
					    </div>
					  </div>
					
					  <!-- Submit button -->
					  <button type="submit" class="btn btn-primary btn-block">Sign in</button>
				</form>
		    
		    </div>		 
		    <div class="col-sm-4" ></div>
		</div>
					
		</div>
	</div>        
</div>
 
</body>
</html>