<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2 id="form-title">Grade Form</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
					</ul>
				</div>
				<div class="body">
					<form id="grade-form" method="POST">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control name" placeholder="Grade Name" name="name" id="name">
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
					<h2>GRADE LIST</h2>
				</div>
				<div class="body">
					<table class="table" id="grade-list"
                       data-toggle="table"
                       data-toolbar="#get"
                       data-url="/api/grades/v1/all"
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
var apiHelper = new ApiHelper('#grade-form', 'grade', 'v1');
$(document).ready(function() {
    var currentId = '';
	$('#submit').on('click', function(e){
		e.preventDefault();
		if(isInsertMode()){
    		apiHelper.insert().done(function(r){
    			if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		resetForm();
    				$('#grade-list').bootstrapTable('refresh');	
    			}else{
	        		swal(r.message, "", "error");
    			}
                
    		});
    	}else{
    		apiHelper.update(currentId).done(function(r){
    			if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
    				$('#grade-list').bootstrapTable('refresh');	
    			}else{
	        		swal(r.message, "", "error");
    			}
    		});
    	}
    });
	
	$('#grade-list').on('click', '.edit', function(e){
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
	
	$('#grade-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	});
	
	function isInsertMode(){
		return currentId == '';
	}
	
	function switchToUpdateForm(id){
		$('#submit').text('Update');
		$('#form-title').text('Grade Form | Edit ID: ' + currentId);
	}
	
	function switchToNewForm(){
		currentId = '';
		$('#submit').text('Add');
		$('#form-title').text('Grade Form');
		$('#name').val('');

	}
	
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this grade?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#grade-list').bootstrapTable('refresh');
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
