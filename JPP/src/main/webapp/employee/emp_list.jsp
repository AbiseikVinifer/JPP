<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "cs.jpp.dto.employee.Employee"  %>
<%@ page import = "cs.jpp.bl.employee.EmployeeBL" %>
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
						<h2>Manage <b>Employee</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="emp_add.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
						<!-- <a href="emp_delete.jsp" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a> -->						
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>Employee ID</th>
						<th>Name</th>
						<th>Branch Id</th>
						<th>Address</th>
						<th>Mobile No</th>
						<th>Email</th>
						<th>Qualification</th>
						<th>Type</th>
						<th>Actions</th>
					</tr>
				</thead>			
				<tbody>
				<%!
				ArrayList<Employee> employees = null;
				%>
				<%
				try{
					employees = EmployeeBL.getEmployees();
					if(employees != null){
						for(Employee employee: employees){%>
						<tr>
						
						<td>
						<%= employee.getEmployeeId() %>
						</td>
						
						<td>
						<%= employee.getName() %>
						</td>
						
						<td>
						<%= employee.getBranchId() %>
						</td>
						
						<td>
						<%= employee.getAddress() %>
						</td>
						
						<td>
						<%= employee.getMobileNo() %>
						</td>
						
						<td>
						<%= employee.getEmailId() %>
						</td>
						
						<td>
						<%= employee.getQualification() %>
						</td>
						
						<td>
						<%= employee.getType() +"" %>
						</td>
						
						<td>
							<a href="emp_view.jsp?emp_id=<%=employee.getEmployeeId()%>" class="view" ><i class="material-icons" data-toggle="tooltip" title="View">&#xe002;</i></a>
							<a href="emp_edit.jsp?emp_id=<%=employee.getEmployeeId()%>" class="edit" ><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteEmployeeModal" class="delete feed-id" data-toggle="modal" data-id = '<%=employee.getEmployeeId()%>'><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
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
<div id="deleteEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<%
			if("POST".equalsIgnoreCase(request.getMethod())){
				int result = 0;
				byte status = 0;
				int emp_id = 0;
				
				try{
					emp_id = Integer.parseInt(request.getParameter("cid"));
					result = EmployeeBL.changeEmployeeStatus(emp_id, status);
					if(result > 0){
						response.sendRedirect("emp_list.jsp");
					}else{
						System.out.println("Query not Sucessfully updated");
					}
				}catch(Exception e){
					System.out.println("Error: emp_list.jsp : Delete " + e.getMessage());
				}
			}
				%>
				<form method = post>
				<div class="modal-header">						
					<h4 class="modal-title">Disable Employee</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
				<input id="feed_id" name="cid" type="hidden" value="" />					
					<p>Are you sure to disable the Employee?</p>
					<p class="text-warning"><small>Employee can't be login.</small></p>
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
<script>
$(document).ready(function () {
	$('body').on('click', '.feed-id',function(){
	document.getElementById("feed_id").value = $(this).attr('data-id');
	console.log($(this).attr('data-id'));
	});
	});
</script>
</html>