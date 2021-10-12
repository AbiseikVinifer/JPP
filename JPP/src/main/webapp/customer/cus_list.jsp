<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import = "cs.jpp.dto.customer.Customer" %>
<%@ page import = "java.util.ArrayList" %>
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

<div class="container-xl">
<jsp:include page="../include/menu/menu.jsp" />
	<div class="table-responsive">
		<div class="table-wrapper">
			<div class="table-title">
				<div class="row">
					<div class="col-sm-4">
						<h2>Manage <b>Customer</b></h2>
					</div>
					
						<%!
						ArrayList<Customer> customers = null;
						int currentPageCustomerCount = 0;
						int limit = 1;
						%>
						<%
							if ("POST".equalsIgnoreCase(request.getMethod()) && (request.getParameter("search") != null) && (! request.getParameter("search").equals(""))) {
								System.out.println("form submit");
								String searchKey = request.getParameter("search");
								customers = CustomerBL.getCustomerByKey(searchKey);
							}else{
								limit = 1;
								try{
									limit = Integer.parseInt(request.getParameter("limit"));
								}catch(Exception e){
									
								}
								System.out.println(limit);
								customers = CustomerBL.getCustomers(limit);
								System.out.println("form not submitted");
							}
						%>
					<div class="col-sm-4">
					    <form method = "post">
					      <input type="text" placeholder="Search.." name="search">
					      <button type="submit"><i class="fa fa-search"></i></button>
					    </form>
					  </div>
					<div class="col-sm-4">
						<a href="cus_add.jsp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Add New Customer</span></a>
						<!-- <a href="cus_delete.jsp" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a> -->						
					</div>
				</div>
				
			</div>
			
			<table class="table table-striped table-hover" border="0">
				<thead>
					<tr>
						
						<th>ID</th>
						<th>Name</th> 
						<th>Email</th>
						<th>Address</th>
						<th>Phone</th>
						<th></th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
				
				<%
				try{
					
					if(customers != null){
						currentPageCustomerCount = 0;
						for(Customer customer: customers){ 
							currentPageCustomerCount ++;
						%>
					<tr>
						<td>
						<%= customer.getCustomerId() %>
						</td>
						<td>
						<%= customer.getName() %>
						</td>
						<td>
						<%= customer.getEmailId() %>
						</td>
						<td>
						<%= customer.getAddress() %>
						</td>
						<td>
						<%= customer.getMobileNo() %>
						</td>
						<td align = "right">
							<a href="cus_view.jsp?cus_id=<%= customer.getCustomerId() %>" class="view"><i class="material-icons" data-toggle="tooltip" title="View">&#xe002;</i></a>
						</td>
						<td>
							<a href="cus_edit.jsp?cus_id=<%= customer.getCustomerId() %>" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
							<a href="#deleteCustomerModal" class="delete delete-id" data-toggle="modal" data-id = '<%= customer.getCustomerId() %>' ><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>																					
						</td>
						
					</tr>
					<%												
						}
					}
					
				}catch(Exception e){
					System.out.println("Error: cus_list.jsp: " + e.getMessage());
				}
				%>
					
					 
				</tbody>				
			</table>
			
			<%!
				int totalCustomers = 0; 
				int totalPages = 0;
			%>
			
			<%
				try{
					totalCustomers = CustomerBL.getActiveCustomerCount();
					totalPages = totalCustomers/5;
					if(totalCustomers % 5 != 0){
						totalPages ++;
					}
					System.out.println("totalPages" + totalPages);
				}catch(Exception e){
					System.out.println("Error: cus_list.jsp: TotalCustomer: " + e.getMessage());
				}
			%>
			<div class="clearfix">
				<div class="hint-text">Showing <b><%= currentPageCustomerCount %></b> out of <b><%= totalCustomers %></b> entries</div>
				<% if(totalPages > 1){ %>
					<ul class="pagination">
						<!--   <li class="page-item disabled"><a href="#">Previous</a></li> -->
						
						<% 
						System.out.println("totalPages" + totalPages);
							for(int i=1; i <= totalPages; i++){
								if(i == limit){
						%>
									<li class="page-item active"><a href="cus_list.jsp?limit=<%=i%>" class="page-link"><%= i %></a></li>
						<% 		}else{ %>
									<li class="page-item"><a href="cus_list.jsp?limit=<%=i%>" class="page-link"><%= i %></a></li>	
								<%}
							} %>
						<!-- <li class="page-item"><a href="cus_list.jsp?limit=6" class="page-link">Next</a></li> -->
					</ul>
				<% } %>
			</div>
		</div>
	</div>        
</div>
<div id="deleteCustomerModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
		<%
			if ("POST".equalsIgnoreCase(request.getMethod()) && (request.getParameter("cid") != null) && (! request.getParameter("cid").equals(""))){
				
				int result = 0;
				byte status = 0;
				int cus_id = 0;
				
				try{
					cus_id = Integer.parseInt(request.getParameter("cid"));
					result = CustomerBL.changeCustomerStatus(cus_id, status);
					if(result > 0){
						response.sendRedirect("cus_list.jsp");
					}else{
						System.out.println("Query not Sucessfully updated");
					}
				}catch(Exception e){
					System.out.println("Error: cus_list.jsp: Delete: " + e.getMessage());
				}
			}
		%>
			<form method = post>
				<div class="modal-header">						
					<h4 class="modal-title">Disable Customer</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">	
				<input id="feed_id" name="cid" type="hidden" value="" />				
					<p>Are you sure to disable the Customer?</p>
					<p class="text-warning"><small>Customer can't be login.</small></p>
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
	$('body').on('click', '.delete-id',function(){
	document.getElementById("feed_id").value = $(this).attr('data-id');
	console.log($(this).attr('data-id'));
	});
	});
</script>
</html>