<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2 id="form-title">Student Form</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
					</ul>
				</div>
				<div class="body">
					<form id="student_form" method="POST">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<!-- <div class="form-line">
										<input type="text" class="form-control name" placeholder="Grade Name" name="name" id="name" required >
									</div> -->									
									
									<div class="row clearfix">
										<div class="col-md-6">
											<div class="form-group">
												<div class="form-line">
													<input class="form-control" placeholder="First Name" type="text" name="firstname" id="firstname" required>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<div class="form-line">
													<input class="form-control" placeholder="Last Name" type="text" name="lastname" id="lastname" required>
												</div>
											</div>
										</div>
									</div>
									 <div class="row clearfix">	
										<div class="col-md-6">											
											
											<div class="form-group">
			                                    <div class="form-line">
			                                        <input type="text" class="form-control datepicker dob" placeholder="DOB" name="dob" id="dob" required>
			                                    </div>
			                                    <div class="help-info">YYYY-MM-DD format</div>
			                                </div>
											
										</div>									
										<div class="col-md-6">
											<div class="form-group">
												
				                                    <input type="radio" name="sex" id="male" class="with-gap " value="1">
				                                    <label for="male">Male</label>
				
				                                    <input type="radio" name="sex" id="female" class="with-gap " value="2">
				                                    <label for="female" class="m-l-20">Female</label>
				                               
												
											</div>
										</div>										
									</div>
									<div class="row clearfix">
										<div class="col-md-6">
											<div class="form-group">
												<div class="form-line">
													<input class="form-control" placeholder="Contact Person" type="text" name="contact_person_name" id="contact_person_name" required>
												</div>
											</div>
										</div>
										<div class="col-md-6">
											 <div class="form-group">
												<div>
																										
													<select class="form-control" name="contact_person_relationship" id="contact_person_relationship" required>
				                                        <option value="">-- Select Contact Relation--</option>
				                                        <option value="1">Parents</option>
				                                        <option value="2">Other</option>
			                                        </select>													
													
												</div>
											</div> 
										</div>
									</div>
									<div class="row clearfix">
										<div class="col-md-12">
											<div class="form-group">
												<div class="form-line">
													<input type="text" class="form-control contact_person_phone" placeholder="Contact Phone" name="contact_person_phone" id="contact_person_phone" required >
												</div> 
											</div>
										</div>	
									</div>
									<div class="form-group">
										<div class="form-line">
											<input type="text" class="form-control address" placeholder="Address" name="address" id="address" required >
										</div>
									</div>
									
								</div>
							</div>
						</div>
						<button class="btn btn-success waves-effect" id="new">New</button>
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
					<h2>STUDENT LIST</h2>
				</div>
				<div class="body">
					<table class="table" id="student-list"
                       data-toggle="table"
                       data-toolbar="#get"
                       data-url="/api/students/v1/all"
                       data-page-list="[10,20]"
                       data-pagination="true"
                    >
                    <thead>
	                    <tr>
	                        <th data-field="id" data-visible="true">ID</th>
	                        <th data-field="firstname" data-visible="true">First Name</th>
	                        <th data-field="lastname" data-visible="true">Last Name</th>
	                        <th data-field="sexLabel" data-visible="true">Sex</th>
	                        <th data-field="dob" data-visible="true">DOB</th>
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
$(function () {

    $('#student_form').validate({
        rules: {
            'sex': {
                required: true
            }
        },
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
var apiHelper = new ApiHelper('#student_form', 'student', 'v1');
$(document).ready(function() {
    var currentId = '';
    
	$('#submit').on('click', function(e){
		e.preventDefault();
		if($('#student_form').valid()){
			if(isInsertMode()){
	    		apiHelper.insert().done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		resetForm();
	    				$('#student-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	                
	    		});
	    	}else{
	    		apiHelper.update(currentId).done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
	    				$('#student-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	    		});
	    	}
		}
    });
	
	$('#student-list').on('click', '.edit', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		
		apiHelper.getDetail(currentId).done(function(r){
			//console.log(r);
			switchToUpdateForm(currentId);
			$('#firstname').val(r.firstname);
			$('#lastname').val(r.lastname);
			
			$('#contact_person_relationship').selectpicker("val",r.contact_person_relationship); //val(r.contact_person_relationship);
			
			if(r.sex ==1){	
				$("#male").prop("checked", true);				
			}else if(r.sex ==2){	
				$("#female").prop("checked", true);				
			}
			
			$('#dob').val(r.dob);
			
			$('#contact_person_name').val(r.contact_person_name);
			
			
			$('#contact_person_phone').val(r.contact_person_phone);
			$('#address').val(r.address);
		})
		
	})
	
	$('#new').on('click', function(e){
		e.preventDefault();
		switchToNewForm();
	});
	
	$('#student-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	});
	
	  

	  
	function isInsertMode(){
		return currentId == '';
	}
	
	function switchToUpdateForm(id){
		$('#submit').text('Update');
		$('#form-title').text('Student Form | Edit ID: ' + currentId);
	}
	
	function switchToNewForm(){
		currentId = '';
		$('#submit').text('Add');
		$('#form-title').text('Student Form');
		
		$('#firstname').val('');
		$('#lastname').val('');
		
		$('#contact_person_relationship').selectpicker("val",''); //val(r.contact_person_relationship);		
		
		$("#male").prop("checked", false);
		$("#female").prop("checked", false);
		
		$('#dob').val('');
		
		$('#contact_person_name').val('');
		
		
		$('#contact_person_phone').val('');
		$('#address').val('');

	}
	
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this student?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#student-list').bootstrapTable('refresh');
	 	        	currentId = '';
	        	}else{
	        		swal(r.message, "", "error");
	 	        	currentId = '';
	        	}
               
	        });
	    });
	}
	
	function resetForm(){
		$('#name').val('');
	}
	
	
	
});


</script>
