<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2 id="form-title">User Form</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
					</ul>
				</div>
				<div class="body">
					<form id="user-form" method="POST">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control full-name" placeholder="Full Name" name="fullName" id="full-name" required>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control username" placeholder="Username" name="username" id="username" required>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="password" class="form-control password" placeholder="Password" name="password" id="password" required>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="password" class="form-control confirm-password" placeholder="Confirm Password" name="confirmPassword" id="confirm-password" required>
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
					<h2>USER LIST</h2>
				</div>
				<div class="body">
					<table class="table" id="user-list"
                       data-toggle="table"
                       data-toolbar="#get"
                       data-url="/api/users/v1/all"
                       data-page-list="[10,20]"
                       data-pagination="true"
                       data-search="true"
                       data-side-pagination="server">
                    <thead>
	                    <tr>
	                        <th data-field="id" data-visible="true">ID</th>
	                        <th data-field="fullName" data-visible="true">Name</th>
	                        <th data-field="username" data-visible="true">Username</th>
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
var apiHelper = new ApiHelper('#user-form', 'user', 'v1');
var state = 'insert';

$(document).ready(function() {
    var currentId = '';
    $('#user-form').validate({
    	highlight: function (input) {
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
		},
		 rules: {
		        password: 'required',
		        confirmPassword: {
		            equalTo: '#password'
		        }
		    }
    });
    
	$('#submit').on('click', function(e){
		e.preventDefault();
		if($('#user-form').valid()){
			if(state == 'insert'){
	    		apiHelper.insert().done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		resetForm();
	    				$('#user-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	                
	    		});
	    	}else if(state == 'update'){
	    		apiHelper.update(currentId).done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
	    				$('#user-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	    		});
	    	}else{
	    		var data = $('#user-form').serialize();
	    		$.ajax({
	    			url:'api/user/v1/change-password/' + currentId,
	    			type: 'POST',
	    			dataType: 'JSON',
	    			data: data
	    		}).done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
	    				$('#user-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}

	    		});
	    	}
		}
    });
	
	$('#user-list').on('click', '.edit', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		apiHelper.getDetail(currentId).done(function(r){
			switchToUpdateForm(currentId);
			$('#username').val(r.username);
			$('#full-name').val(r.fullName);
		})
		
	});
	
	$('#user-list').on('click', '.change-password', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		apiHelper.getDetail(currentId).done(function(r){
			switchToChangePasswordForm(currentId);
		})
		
	});
	
	$('#new').on('click', function(e){
		e.preventDefault();
		switchToNewForm();
	});
	
	$('#user-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
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
	
	function switchToChangePasswordForm(id){
		state = 'change_password';
		$('#submit').text('Change Password');
		$('#form-title').text('Change Password | Edit ID: ' + currentId);
		$('#username').parent().parent().parent().hide();
		$('#full-name').parent().parent().parent().hide();
		$('#password').parent().parent().parent().show();
		$('#confirm-password').parent().parent().parent().show();
		$('#password').val('');
		$('#confirm-password').val('');

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
	        text: "Are you sure to delete this user?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#user-list').bootstrapTable('refresh');
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
	
	
});


</script>
