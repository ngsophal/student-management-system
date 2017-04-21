<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2 id="form-title">Course Form</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
					</ul>
				</div>
				<div class="body">
					<form id="course-form" method="POST">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<select class="form-control grade-id" id="grade-id" name="gradeId">
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="form-line">
										<select class="form-control session-id " id="session-id" name="sessionId">
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control datepicker start-date" placeholder="Start Date" name="startDate" id="start-date" required>
									</div>
								</div>
								<div class="form-group">
									<div class="form-line">
										<input type="text" class="form-control datepicker end-date" placeholder="End Date" name="endDate" id="end-date">
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
					<h2>COURSE LIST</h2>
				</div>
				<div class="body">
					<table class="table" id="course-list"
                       data-toggle="table"
                       data-toolbar="#get"
                       data-url="/api/course/v1/all"
                       data-page-list="[10,20]"
                       data-pagination="true"
                    >
                    <thead>
	                    <tr>
	                        <th data-field="id" data-visible="true">ID</th>
							<th data-field="grade.name" data-visible="true">Grade</th>
	                        <th data-field="session.name" data-visible="true">Session</th>
							<th data-field="startDate" data-visible="true">Start Date</th>
							<th data-field="endDate" data-visible="true">End Date</th>
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
var apiHelper = new ApiHelper('#course-form', 'course', 'v1');
$(document).ready(function() {

	var currentId = '';
    $('#course-form').validate({
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
		apiHelper.resource = 'course';
		apiHelper.version  = 'v1';

		if($('#course-form').valid()){
			if(isInsertMode()){
	    		apiHelper.insert().done(function(r){
					console.log(r)
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		resetForm();
	    				$('#course-list').bootstrapTable('refresh');
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	                
	    		});
	    	}else{
	    		apiHelper.update(currentId).done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
	    				$('#course-list').bootstrapTable('refresh');
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	    		});
	    	}
		}
    });
	
	$('#course-list').on('click', '.edit', function(e){
		e.preventDefault();
		apiHelper.resource = 'course';
		apiHelper.version  = 'v1';

		currentId = $(this).attr('data-id');
		
		apiHelper.getDetail(currentId).done(function(r){
			$('#grade-id').val(r.grade.id);
			$('#session-id').val(r.session.id);
			$('#start-date').val(r.startDate);
			$('#end-date').val(r.endDate);
			switchToUpdateForm(currentId);
		})
		
	})
	
	$('#new').on('click', function(e){
		e.preventDefault();
		switchToNewForm();
	});

	getGrade();
	getSession();
	
	$('#course-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	});
	
	function isInsertMode(){
		return currentId == '';
	}
	
	function switchToUpdateForm(id){
		$('#submit').text('Update');
		$('#form-title').text('Course Form | Course ID: ' + currentId);
		refreshSelectControl();
	}
	
	function switchToNewForm(){
		currentId = '';
		$('#submit').text('Add');
		$('#form-title').text('Course Form');
		$('#start-date').val('');
		$('#end-date').val('');
		$('#session-id').val('');
		$('#grade-id').val('');
		refreshSelectControl();

	}
	
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this Course?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
			apiHelper.resource = 'course';
			apiHelper.version  = 'v1';
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#course-list').bootstrapTable('refresh');
	 	        	currentId = '';
	        	}else{
	        		swal(r.message, "", "error");
	 	        	currentId = '';
	        	}

	        });
	    });
	}

	function resetForm(){
		$('#start-date').val('');
		$('#end-date').val('');
		$('#grade-id').val('');
		$('#session-id').val('');
		refreshSelectControl();
	}

	function getGrade(){
		apiHelper.resource = 'grade';
		apiHelper.version  = 'v1';
		apiHelper.getAll().done(function(r){
			var length 	= r.length;
			var str		= '';
				str+= '<option value="">Please Choose</option>';
			for(var i = 0; i < length; i++){
				str+= '<option value='+r[i].id+'>'+r[i].name+'</option>'
			}
			$('#grade-id').html(str);
			$('#grade-id').selectpicker('refresh');
		})
	}

	function getSession(){
		apiHelper.resource = 'session';
		apiHelper.version  = 'v1';
		apiHelper.getAll().done(function(r){
			var length 	= r.length;
			var str		= '';
			str+= '<option value="">Please Choose</option>';
			for(var i = 0; i < length; i++){
				str+= '<option value='+r[i].id+'>'+r[i].name+'</option>';
			}
			$('#session-id').html(str);
			$('#session-id').selectpicker('refresh');
		})
	}

	function refreshSelectControl(){
		$('#grade-id').selectpicker('refresh');
		$('#session-id').selectpicker('refresh');
	}


});

</script>
