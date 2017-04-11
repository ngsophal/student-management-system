<div class="container-fluid">
	<div class="block-header">
		<h2>
			Enrollment
		</h2>
	</div>
	<!-- Basic Validation -->
	
	<div class="row clearfix">
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<div class="card">
				<div class="header">
					<h2>Enrollment</h2>
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
							</ul>
						</li>
					</ul>
				</div>
				<div class="body">
					<form id="form_validation" method="POST">
						<label for="student-id">Student</label>
						<div class="form-group ">
							<div class="form-line">
								<select class="form-control" id="student">
								</select>								
							</div>
						</div>
						<label for="course">Course</label>
						<div class="form-group">
							<div class="form-line">
								<select class="form-control show-tick" data-live-search="true">
                                    <option value="1">Grade A - Evening</option>
								</select>
							</div>
						</div>
						<label for="room">Room</label>
						<div class="form-group form-float">
							<div class="form-line">
								<select class="form-control show-tick" data-live-search="true" id="room">
                                        <option>A</option>
								</select>
							</div>
						</div>
						<label for="enrollment-date">Enrollment Date</label>
						<div class="form-group">
							<div class="form-line">
								 <input type="text" class="datepicker form-control" name="enrollment_date" id="enrollment-date" >								
							</div>
						</div>
						
						<button class="btn btn-primary waves-effect" type="submit">SUBMIT</button>
						
						<button class="btn btn-primary waves-effect" type="submit">SUBMIT & PAY</button>
						
					</form>
				</div>
			</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
			<div class="card">
                   <div class="header bg-red">
                       <h2>
                          Student Information
                       </h2>
                       <ul class="header-dropdown m-r--5">
                           <li class="dropdown">
                               <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                   <i class="material-icons">more_vert</i>
                               </a>
                               <ul class="dropdown-menu pull-right">
                                   <li><a href="javascript:void(0);">Action</a></li>
                                   <li><a href="javascript:void(0);">Another action</a></li>
                                   <li><a href="javascript:void(0);">Something else here</a></li>
                               </ul>
                           </li>
                       </ul>
                   </div>
                   <div class="body">
                   		<div class="row">
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><label>First name:</label></div>
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Sopheak</div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><label>Last name:</label></div>
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Hang</div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><label>Sex:</label></div>
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                   				Male
                   			</div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><label>Date of Birth:</label></div>
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">07-July-2012</div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><label>Address:</label></div>
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">#434C, St 22BT, Boeng Tumpon, Mean Chey, Phnom Penh</div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><label>Contact Person Name:</label></div>
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Heng Nary</div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><label>Contact Person Relationship:</label></div>
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">Mother</div>
                   		</div>
                   		<div class="row">
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6"><label>Contact Person Phone Number:</label></div>
                   			<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">012121212</div>
                   		</div>
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
					<h2>Enrollment List</h2>
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
					<table class="table" id="enrollment-list"
	                       data-toggle="table"
	                       data-toolbar="#get"
	                       data-url="/api/enrollments/v1/all"
	                       data-page-list="[10,20]"
	                       data-pagination="true"
	                       data-search="true"
	                       data-side-pagination="server">
	                    <thead>
		                    <tr>
		                        <th data-field="id" data-visible="true">ID</th>
		                        <th data-field="student.fullname" data-visible="true">Student Name</th>
		                        <th data-field="student.sexLabel" data-visible="true">Sex</th>
		                        <th data-field="student.dob" data-visible="true">DOB</th>
		                        <th data-field="course.grade" data-visible="true">C</th>
		                        <th data-field="action" data-visible="true">Action</th>
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
var apiHelper = new ApiHelper('#enrollment-form', 'enrollment', 'v1');
var state = 'insert';

$(document).ready(function() {
    var currentId = '';
    $('#enrollment-form').validate({
    	highlight: function (input) {
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
		}
    });
    
	$('#submit').on('click', function(e){
		e.preventDefault();
		if($('#enrollment-form').valid()){
			if(state == 'insert'){
	    		apiHelper.insert().done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		resetForm();
	    				$('#enrollment-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	                
	    		});
	    	}else if(state == 'update'){
	    		apiHelper.update(currentId).done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
	    				$('#enrollment-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	    		});
	    	}
		}
    });
	
	$('#enrollment-list').on('click', '.edit', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		apiHelper.getDetail(currentId).done(function(r){
			switchToUpdateForm(currentId);
			$('#username').val(r.username);
			$('#full-name').val(r.fullName);
		})
		
	});
	
	$('#new').on('click', function(e){
		e.preventDefault();
		switchToNewForm();
	});
	
	$('#enrollment-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	});
});	
	function switchToUpdateForm(id){
		state = 'update';
		$('#submit').text('Update');
		$('#form-title').text('User Form | Edit ID: ' + currentId);
		$('#username').parent().parent().parent().hide();
		$('#password').parent().parent().parent().hide();
		$('#confirm-password').parent().parent().parent().hide();
		$('#full-name').parent().parent().parent().show();
	}
	
	function switchToNewForm(){
		state = 'insert';
		currentId = '';
		$('#submit').text('Add');
		$('#form-title').text('User Form');
		
		$('#full-name').parent().parent().parent().show();
		$('#username').parent().parent().parent().show();
		$('#password').parent().parent().parent().show();
		$('#confirm-password').parent().parent().parent().show();
		$('#username').parent().parent().parent().show();
		
		$('#full-name').val('');
		$('#username').val('');
		$('#password').val('');
		$('#confirm-password').val('');

	}
	
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this enrollment?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#enrollment-list').bootstrapTable('refresh');
	 	        	currentId = '';
	        	}else{
	        		swal(r.message, "", "error");
	 	        	currentId = '';
	        	}
               
	        });
	    });
	}
	
	function resetForm(){
		switchToNewForm();
	}
		


</script>