<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>Payment Form</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
							<ul class="dropdown-menu pull-right">
								<li><a href="javascript:void(0);">Action</a></li>
								<li><a href="javascript:void(0);">Another action</a></li>
								<li><a href="javascript:void(0);">Something else here</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="body">
					<form id="form_validation" method="POST">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control enrollment-id" name="payment_date" id="enrollment-id">
										<label class="form-label">Enrollment ID</label>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control payment-date" name="payment_date" id="payment-date">
										<label class="form-label">Payment Date</label>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<select class="form-control show-tick">
											<option value="">Please Choose Type of Payment</option>
											<option value="1">Quarter</option>
											<option value="2">Semester</option>
											<option value="3">Year</option>
										</select>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control payment-amount" name="receive_amount" id="payment-amount">
										<label class="form-label">Payment Amount</label>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control discount" name="discount" id="discount">
										<label class="form-label">Discount</label>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control receive-amount" name="receive_amount" id="receive-amount">
										<label class="form-label">Receive Amount</label>
									</div>
								</div>
							</div>
						</div>

						<button class="btn btn-primary waves-effect" type="submit">SUBMIT</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- #END# Basic Validation -->

	<!-- Basic Examples -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>PAYMENT LISTS</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
							<ul class="dropdown-menu pull-right">
								<li><a href="javascript:void(0);">Action</a></li>
								<li><a href="javascript:void(0);">Another action</a></li>
								<li><a href="javascript:void(0);">Something else here</a></li>
							</ul></li>
					</ul>
				</div>
				<div class="body">
					<table
						class="table table-bordered table-striped table-hover js-basic-example dataTable">
						<thead>
							<tr>
								<th>Enrollment ID</th>
								<th>Payment Date</th>
								<th>Payment Amount</th>
								<th>Discount</th>
								<th>Receive Amount</th>
								<th>Action</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Enrollment ID</th>
								<th>Payment Date</th>
								<th>Payment Amount</th>
								<th>Discount</th>
								<th>Receive Amount</th>
								<th>Action</th>
							</tr>
						</tfoot>
						<tbody>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>
							<tr>
								<td>0001</td>
								<td>03-03-2017</td>
								<td>100 $</td>
								<td>10%</td>
								<td>90$</td>
								<td>
									<button type="button" class="btn btn-primary waves-effect">Update</button>
									<button type="button" class="btn btn-danger waves-effect">Delete</button>
								</td>
							</tr>

			
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- #END# Basic Examples -->
</div>
