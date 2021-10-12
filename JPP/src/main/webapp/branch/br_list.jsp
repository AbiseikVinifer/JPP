<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "cs.jpp.dto.branch.Branch" %>
<%@ page import = "cs.jpp.bl.branch.BranchBL" %>
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

<div class="container-xl">
<jsp:include page="../include/menu/menu.jsp" />
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-6">
						<h2>Manage <b>Branch</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="br_add.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Add New Branch</span></a>
						<!-- <a href="br_delete.jsp" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a> -->						
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						
						<th>Name</th>
						<th>Location</th>
						<th>Address</th>
						<th>License No</th>
						<th>Manager Id</th>
						<th>Phone No</th>
						<th>Email Id</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%!
				ArrayList<Branch> branches = null;
				%>
				<%
				try{
					branches = BranchBL.getBranches();
					if(branches != null){
						for(Branch branch: branches){%>
						<tr>
						
						<td>
						<%= branch.getBranchId() %>
						</td>
						
						<td>
						<%= branch.getName() %>
						</td>
						
						<td>
						<%= branch.getLocation() %>
						</td>
						
						<td>
						<%= branch.getAddress() %>
						</td>
						
						<td>
						<%= branch.getLicenseNo() %>
						</td>
						
						<td>
						<%= branch.getManagerId() %>
						</td>
						
						<td>
						<%= branch.getPhoneNo() %>
						</td>
						
						<td>
						<%= branch.getEmailId() %>
						</td>
						
						<td>
							<a href="br_view.jsp?emp_id=<%=branch.getBranchId()%>" class="view" ><i class="material-icons" data-toggle="tooltip" title="View">&#xe002;</i></a>
							<a href="br_edit.jsp?emp_id=<%=branch.getBranchId()%>" class="edit" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteBranchModal" class="delete feed-id" data-toggle="modal" data-id = '<%=branch.getBranchId()%>'><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
						</td>
					</tr>						
						<%}
					}
				}catch(Exception e){
					System.out.println("Error: emp_list.jsp: " + e.getMessage());
				}
				%>
				</tbody>
			</table>
			<div class="clearfix">
				<div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
				<ul class="pagination">
					<li class="page-item disabled"><a href="#">Previous</a></li>
					<li class="page-item"><a href="#" class="page-link">1</a></li>
					<li class="page-item"><a href="#" class="page-link">2</a></li>
					<li class="page-item active"><a href="#" class="page-link">3</a></li>
					<li class="page-item"><a href="#" class="page-link">4</a></li>
					<li class="page-item"><a href="#" class="page-link">5</a></li>
					<li class="page-item"><a href="#" class="page-link">Next</a></li>
				</ul>
			</div>
		</div>
	</div>        
</div>
<div id="deleteBranchModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form>
				<div class="modal-header">						
					<h4 class="modal-title">Delete Branch</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<p>Are you sure you want to delete these Records?</p>
					<p class="text-warning"><small>This action cannot be undone.</small></p>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-danger" value="Delete">
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>