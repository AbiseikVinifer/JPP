Select pk_customerId, tbl_customer.name, fk_branchId, tbl_branch.name from tbl_customer
left join tbl_branch
on tbl_customer.fk_branchId = tbl_branch.pk_branchId;



<option selected value='<%= branch.getBranchId() %>'><%= branch.getName() %></option>

<option value='<%= branch.getBranchId() %>'><%= branch.getName() %></option>


<div id="viewCustomerModal" class="modal fade">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form>
				<div class="modal-header">						
					<h4 class="modal-title">Add Employee</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-sm-4" >					
							<div class="form-group">
								<label>Name</label>
								<input id="view_cus_id" name="view_cus_id" type="text" class="form-control" value="" readonly>
							</div>
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Address</label>
								<textarea class="form-control" required></textarea>
							</div>
							<div class="form-group">
								<label>Phone</label>
								<input type="text" class="form-control" required>
							</div>
						</div>
						
						<div class="col-sm-4" >					
							<div class="form-group">
								<label>Name</label>
								<input id="view_cus_id" name="view_cus_id" type="text" class="form-control" value="" readonly>
							</div>
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Address</label>
								<textarea class="form-control" required></textarea>
							</div>
							<div class="form-group">
								<label>Phone</label>
								<input type="text" class="form-control" required>
							</div>
						</div>
					</div>					
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="submit" class="btn btn-success" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>


<div class="colsm-6">
					    <form action="/action_page.php">
					      <input type="text" placeholder="Search.." name="search">
					      <button type="submit"><i class="fa fa-search"></i></button>
					    </form>
  					</div>