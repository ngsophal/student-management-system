
<div class="container-fluid">
	<div class="block-header">
		<h2>
			Enrollment List
		</h2>
	</div>
	
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>Enrollment List</h2>
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
		                        <th data-field="course.name" data-visible="true">Course</th>
		                        <th data-field="room.name" data-visible="true">Room</th>
		                        <th data-field="enrollmentDate" data-visible="true">Enrollment Date</th>
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

var currentId = '';
$(document).ready(function() {
	$('#enrollment-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	}); 
});	
		
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
	
	

</script>