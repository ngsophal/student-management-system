<%
String enrollmentId = request.getParameter("enrollmentId");
String state = "";
if(enrollmentId != "" && enrollmentId != null) state = "edit";

%>
<div class="container-fluid">
	<div class="block-header">
		<h2>
			Payment <% if(state == "edit") out.print(" | Enrollment ID:" + enrollmentId); %>
		</h2>
	</div>
	
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
                   <div class="header bg-red">
                       <h2>
                          Enrollment Information
                       </h2>                      
                   </div>
                   <div class="body">
                   		<div class="row">
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>First name:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-first-name"></div>
                   		
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Last name:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-last-name"></div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Sex:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-sex"></div>
                   		
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Date of Birth:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-dob"></div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Address:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-address"></div>
                   		
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Contact Person Name:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-contact-person"></div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Contact Person Relationship:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-contact-person-relationship"></div>
                   		
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Contact Person Phone Number:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-contact-person-phone-number"></div>
                   		</div>
                   		
                   		<div class="row">
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Course:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-course"></div>
                   		
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Room:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-room"></div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"><label>Enrollment Date:</label></div>
                   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" id="st-enrollment-date"></div>
                   		
                   		</div>
                   </div>
			</div>
		</div>
	</div>
	
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
								<label for="feetype-id">Payment Type</label>
								<div class="form-group">
									<select class="form-control show-tick" name="feeTypeId" id="feetype-id" required>
																				
									</select>
								</div>
							</div>

							<div class="col-sm-6">
								<label for="feetype-id">Payment Amount</label>
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control payment-amount" name="paymentAmount" id="payment-amount" required readonly>
										<input type="hidden" id="payment-amount-hidden">
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<!-- <div class="col-sm-6">
								<label for="enrollment-id">EnrollmentID</label>
								<div class="form-group">
									<div class="form-line">
										
									</div>
								</div>
							</div> -->
							<input type="hidden" class="form-control enrollment-id" name="enrollmentId" id="enrollment-id" value="<%= request.getParameter("enrollmentId") %>" required>

							<div class="col-sm-6">
								<label for="payment-date">Payment Date</label>
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control payment-date datepicker" name="paymentDate" id="payment-date" required>
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label for="discount">Discount</label>
								<div class="form-group  ">
									<div class="form-line">
										<input type="text" class="form-control discount" name="discount" id="discount" value="0">
									</div>
								</div>
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
	<!-- <div class="row clearfix">
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
	</div> -->
	<!-- #END# Basic Examples -->
</div>

<script type="text/javascript">
var enrollmentId = '<%= enrollmentId %>';

$(function () {
    $('#payment-form').validate({
        
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
var feeTypeApiHelper = new ApiHelper('', 'fee-type', 'v1');
var enrollmentApiHelper = new ApiHelper('', 'enrollment', 'v1');

//var currentId = '';
$(document).ready(function() {

	loadEnrollmet();
	
	var currentId = '';
	loadFeeTypes();
	$('#submit').on('click', function(e){
		e.preventDefault();
		if($('#payment-form').valid()){
			if(isInsertMode()){
	    		apiHelper.insert().done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		switchToNewForm();
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
	
	$('#feetype-id').on('change', function (e) {
	    var varCourse = this.value;
	    var varEenrol = $('#enrollment-id').val();
	    var varUrl = 'api/payments/v1/' + varEenrol + '/' + varCourse;
	    
	    $("#discount").val(0);
	    $('#payment-amount').val(0);	
		$('#payment-amount-hidden').val(0);
		
	    if(varCourse > 0 && varEenrol > 0){
	    	$.ajax({
		    	  url: varUrl,
		    	  type: "get", //send it through get method
		    	  data: {
		    	  },
		    	  success: function(response) {
		    		  console.log(response);
		    		  $('#payment-amount').val(response);	
		    		  $('#payment-amount-hidden').val(response);
		    	      //Do Something
		    	  },
		    	  error: function(xhr) {
		    		  console.log(xhr);	    	  
		    	    //Do Something to handle error
		    	  }
			});
	    }	    
	});
	
	
	$('#discount').on('input',function(e){
		calAmount();
	});
	function calAmount(){
		var vaPayAmou = $("#payment-amount-hidden").val();
	    var vaDiscount = $("#discount").val();
	    var total = 0;
	    if(vaPayAmou > 0 && vaDiscount > 0){
	    	total = vaPayAmou - (vaPayAmou * vaDiscount) / 100;
	    	if(total > 0) $("#payment-amount").val(total);
	    }
		
	}
	
	$("input[id*='discount']").keydown(function (event) {

        if (event.shiftKey == true) {
            event.preventDefault();
        }

        if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode >= 96 && event.keyCode <= 105) || event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46 || event.keyCode == 190) {
        	

        } else {
            event.preventDefault();
        }
        
        if($(this).val().indexOf('.') !== -1 && event.keyCode == 190){
            event.preventDefault();
        }
        	
    });
	
	$('#payment-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	}); 
	
	function loadFeeTypes(){		
		feeTypeApiHelper.getAll(false).done(function(r){
			var options = '<option value="">Please Choose Type of Payment</option>';
			for(var i in r){
				options += "<option value='" + r[i].id + "'>" + r[i].name + "</option>";
			}
			//console.log(options);
			$('#feetype-id').html(options);
			$('#feetype-id').selectpicker('refresh');
		})
	}
	
	function switchToNewForm(){
		currentId = '';
		$('#submit').text('Add');
		$('#form-title').text('Payment Form');		
		$('#enrollment-id').val('');
		$('#payment-date').val('');		
		$('#feetype-id').selectpicker("val",'');		
		$('#payment-amount').val('');		
		$('#discount').val('');
	}
	
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


function loadEnrollmet(){		
	enrollmentApiHelper.getDetail(enrollmentId, false).done(function(r){
		
		$('#st-first-name').html(r.student.firstname);
		$('#st-last-name').html(r.student.lastname);
		$('#st-sex').html(r.student.sexLabel);
		$('#st-dob').html(r.student.dob);
		$('#st-address').html(r.student.address);
		$('#st-contact-person').html(r.student.contact_person_name);
		$('#st-contact-person-relationship').html(r.student.contact_person_relationship_label);
		$('#st-contact-person-phone-number').html(r.student.contact_person_phone);
		
		$('#st-enrollment-date').html(r.enrollmentDate);
		$('#st-room').html(r.room.name);
		$('#st-course').html(r.course.name);
	})
}
	
</script>
