<%@page import = "cs.jpp.dto.customer.Customer" %>
<%@page import = "cs.jpp.bl.customer.CustomerBL" %>

<%
	if ("POST".equalsIgnoreCase(request.getMethod())) {
	    
	    
	    Customer customer = new Customer();
	    customer.setName(request.getParameter("cus_name"));
	    System.out.println(customer.getName());
	} else {
		System.out.println("form not submitted");
	    // It was likely a GET request.
	}
%>
<div id="addCustomerModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form method = post >
				<div class="modal-header">						
					<h4 class="modal-title">Add Customer</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">					
					<div class="form-group">
						<label>Name</label>
						<input type="text" name="cus_name" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Email</label>
						<input type="email" name="email" class="form-control" required>
					</div>
					<div class="form-group">
						<label>Address</label>
						<textarea class="form-control" required name="address"></textarea>
					</div>
					<div class="form-group">
						<label>Mobile No</label>
						<input type="text" name="mobileNo" class="form-control" required>
					</div>					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" name="submit" class="btn btn-success" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>
