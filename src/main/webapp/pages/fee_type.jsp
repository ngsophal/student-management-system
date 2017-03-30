<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2 id="form-title">Fee Type Form</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
					</ul>
				</div>
				<div class="body">
					<form id="fee-type-form" method="POST">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control name" placeholder="Fee Type Name" name="name" id="name" required>
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
					<h2>FEE TYPE LIST</h2>
				</div>
				<div class="body">
					<table class="table" id="fee-type-list"
                       data-toggle="table"
                       data-toolbar="#get"
                       data-url="/api/fee-types/v1/all"
                       data-page-list="[10,20]"
                       data-pagination="true"
                    >
                    <thead>
	                    <tr>
	                        <th data-field="id" data-visible="true">ID</th>
	                        <th data-field="name" data-visible="true">Name</th>
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
var apiHelper = new ApiHelper('#fee-type-form', 'fee-type', 'v1');
$(document).ready(function() {
    var currentId = '';
    $('#fee-type-form').validate({
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
		if($('#fee-type-form').valid()){
			if(isInsertMode()){
	    		apiHelper.insert().done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		resetForm();
	    				$('#fee-type-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	                
	    		});
	    	}else{
	    		apiHelper.update(currentId).done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
	    				$('#fee-type-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	    		});
	    	}
		}
		
    });
	
	$('#fee-type-list').on('click', '.edit', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		
		apiHelper.getDetail(currentId).done(function(r){
			console.log(r);
			switchToUpdateForm(currentId);
			$('#name').val(r.name);
		})
		
	})
	
	$('#new').on('click', function(e){
		e.preventDefault();
		switchToNewForm();
	});
	
	$('#fee-type-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	});
	
	function isInsertMode(){
		return currentId == '';
	}
	
	function switchToUpdateForm(id){
		$('#submit').text('Update');
		$('#form-title').text('Fee Type Form | Edit ID: ' + currentId);
	}
	
	function switchToNewForm(){
		currentId = '';
		$('#submit').text('Add');
		$('#form-title').text('Fee Type Form');
		$('#name').val('');

	}
	
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this fee type?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#fee-type-list').bootstrapTable('refresh');
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
