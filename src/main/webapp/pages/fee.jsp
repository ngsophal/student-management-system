<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2 id="form-title">Fee Form</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
					</ul>
				</div>
				<div class="body">
					<form id="fee-form" method="POST">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<select class="form-control fee-type-id" id="fee-type-id" name="feeTypeId">
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="form-line">
										<select class="form-control course-id " id="course-id" name="courseId">
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control name" placeholder="Fee" name="fee" id="fee" required>
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
					<h2>FEE LIST</h2>
				</div>
				<div class="body">
					<table class="table" id="fee-list"
                       data-toggle="table"
                       data-toolbar="#get"
                       data-url="/api/fee/v1/all"
                       data-page-list="[10,20]"
                       data-pagination="true"
                    >
                    <thead>
	                    <tr>
	                        <th data-field="id" data-visible="true">ID</th>
							<th data-field="course" data-visible="true"  data-formatter="getCourseName">Course</th>
	                        <th data-field="feeType.name" data-visible="true">Fee Tpye</th>
							<th data-field="fee" data-visible="true">Fee</th>
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
var apiHelper = new ApiHelper('#fee-form', 'fee', 'v1');
$(document).ready(function() {
    var currentId = '';
    $('#fee-form').validate({
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
		apiHelper.resource = 'fee';
		apiHelper.version  = 'v1';

		if($('#fee-form').valid()){	
			if(isInsertMode()){
				/*
				apiHelper.insert().done(function(r){		    			
					//console.log(r)
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		resetForm();
	    				$('#fee-list').bootstrapTable('refresh');
	    			}else{
		        		swal(r.message, "", "error");
	    			}		    				                
	    		});
	    		*/
	    		//Save-------------
				var varType = $('#fee-type-id').val();
				var varCourse = $('#course-id').val();
			    var varUrl = 'api/fees/v1/' + varType + '/' + varCourse;

			    if(varType > 0 && varCourse > 0){
			    	$.ajax({
				    	  url: varUrl,
				    	  type: "get", //send it through get method
				    	  data: {
				    	  },
				    	  success: function(response) {
				    		  //console.log(response);
				    		  if(response == 0){//not exist, save
				    			  apiHelper.insert().done(function(r){		    			
										//console.log(r)
						    			if(r.status == 'SUCCESS'){
							        		swal(r.message, "", "success");
							        		resetForm();
						    				$('#fee-list').bootstrapTable('refresh');
						    			}else{
							        		swal(r.message, "", "error");
						    			}		    				                
						    	  });
				    		  }else{
				    			  swal("Course for this period already exist! ", "", "error");
				    		  }
				    	      //Do Something
				    	  },
				    	  error: function(xhr) {
				    		  //console.log(xhr);
				    	    //Do Something to handle error
				    	  }
					});
			    }
	    		//end save--------------
	    	}else{
	    		apiHelper.update(currentId).done(function(r){
					console.log(r)
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
	    				$('#fee-list').bootstrapTable('refresh');
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	    		});
	    	}
		}
    });
	
	$('#fee-list').on('click', '.edit', function(e){
		e.preventDefault();
		apiHelper.resource = 'fee';
		apiHelper.version  = 'v1';

		currentId = $(this).attr('data-id');
		
		apiHelper.getDetail(currentId).done(function(r){
			console.log(r.feeType.id)
			$('#fee-type-id').val(r.feeType.id);
			$('#course-id').val(r.course.id);
			$('#fee').val(r.fee);
			switchToUpdateForm(currentId);
		})
		
	})
	
	$('#new').on('click', function(e){
		e.preventDefault();
		switchToNewForm();
	});

	getCourses();
	getFeeType();
	
	$('#fee-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	});
	
	function isInsertMode(){
		return currentId == '';
	}
	
	function switchToUpdateForm(id){
		$('#submit').text('Update');
		$('#form-title').text('Fee Form | Fee ID: ' + currentId);
		refreshSelectControl();
	}
	
	function switchToNewForm(){
		currentId = '';
		$('#submit').text('Add');
		$('#form-title').text('Fee Form');
		$('#fee').val('');
		$('#fee-type-id').val('');
		$('#course-id').val('');
		refreshSelectControl();

	}
	
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this fee?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
			apiHelper.resource = 'fee';
			apiHelper.version  = 'v1';
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#fee-list').bootstrapTable('refresh');
	 	        	currentId = '';
	        	}else{
	        		swal(r.message, "", "error");
	 	        	currentId = '';
	        	}

	        });
	    });
	}

	function resetForm(){
		$('#fee').val('');
		$('#fee-type-id').val('');
		$('#course-id').val('');
		refreshSelectControl();
	}

	function getCourses(){
		apiHelper.resource = 'course';
		apiHelper.version  = 'v1';
		apiHelper.getAll().done(function(r){
			var length 	= r.length;
			var str		= '';
				str+= '<option value="">Please Choose</option>';
			for(var i = 0; i < length; i++){
				str+= '<option value='+r[i].id+'>'+r[i].grade.name+' and ' + r[i].session.name +'</option>'
			}
			$('#course-id').html(str);
			$('#course-id').selectpicker('refresh');
		})
	}

	function getFeeType(){
		apiHelper.resource = 'fee-type';
		apiHelper.version  = 'v1';
		apiHelper.getAll().done(function(r){
			var length 	= r.length;
			var str		= '';
			str+= '<option value="">Please Choose</option>';
			for(var i = 0; i < length; i++){
				str+= '<option value='+r[i].id+'>'+r[i].name+'</option>';
			}
			$('#fee-type-id').html(str);
			$('#fee-type-id').selectpicker('refresh');
		})
	}

	function refreshSelectControl(){
		$('#course-id').selectpicker('refresh');
		$('#fee-type-id').selectpicker('refresh');
	}


});
function getCourseName(value, row, index){
	return row.course.grade.name + ' and ' + row.course.session.name;
}

</script>
