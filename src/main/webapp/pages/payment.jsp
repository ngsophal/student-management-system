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
					<form id="payment-form" method="POST">
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control payment-id" name="payment_date" id="payment-id" value="<%= request.getParameter("enrollmentId") %>" >
										<label class="form-label">Payment ID</label>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control payment-date datepicker" name="payment_date" id="payment-date" >
										<label class="form-label">Payment Date</label>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<select class="form-control show-tick" required>
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
										<input type="text" class="form-control payment-amount" name="payment_amount" id="payment-amount" >
										<label class="form-label">Payment Amount</label>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<div class="form-group form-float">
									<div class="form-line">
										<input type="text" class="form-control discount" name="discount" id="discount" value="0">
										<label class="form-label">Discount</label>
									</div>
								</div>
							</div>

							<div class="col-sm-6">
								
							</div>
						</div>
						<button class="btn btn-primary waves-effect" id="submit">Add</button>
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
					<h2>Payment List</h2>
				</div>
				<div class="body">
					<table class="table" id="payment-list"
	                       data-toggle="table"
	                       data-toolbar="#get"
	                       data-url="/api/payments/v1/all"
	                       data-page-list="[10,20]"
	                       data-pagination="true"
	                       data-search="true"
	                       data-side-pagination="server">
	                    <thead>
		                    <tr>
		                        <th data-field="id" data-visible="true">ID</th>
		                        
		                        
		                    </tr>
	                    </thead>
	                </table>
				</div>
			</div>
		</div>
	</div>
	<!-- #END# Basic Examples -->
</div>

<script type="text/javascript">
$(function () {
    $('#payment_form').validate({
        
        highlight: function (input) {
            $(input).closest('.form-group').addClass('error');
        },
        unhighlight: function (input) {
            $(input).closest('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).closest('.form-group').append(error);
        }
    });
});
var apiHelper = new ApiHelper('#payment-form', 'payment', 'v1');

//var currentId = '';
$(document).ready(function() {
	var currentId = '';
	$('#submit').on('click', function(e){
		e.preventDefault();
		if($('#payment-form').valid()){
			if(isInsertMode()){
	    		apiHelper.insert().done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		resetForm();
	    				$('#payment-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	                
	    		});
	    	}else{
	    		apiHelper.update(currentId).done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
	    				$('#payment-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	    		});
	    	}
		}
    });
	
	$('#payment-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	}); 
	
	function isInsertMode(){
		return currentId == '';
	}
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this payment?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#payment-list').bootstrapTable('refresh');
	 	        	currentId = '';
	        	}else{
	        		swal(r.message, "", "error");
	 	        	currentId = '';
	        	}
               
	        });
	    });
	}
	
});	
	

	
</script>
