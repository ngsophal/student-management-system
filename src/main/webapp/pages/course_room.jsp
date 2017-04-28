<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2 id="form-title">Course Room Form</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
					</ul>
				</div>
				<div class="body">
					<form id="course-room-form" method="POST">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<div class="form-line">
										<select class="form-control course-id" id="course-id" name="courseId" required>
										</select>
									</div>
								</div>
								<div class="form-group">
									<div class="form-line">
										<select class="form-control room-id " id="room-id" name="roomId" required>
										</select>
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
					<h2>COURSE ROOM LIST</h2>
				</div>
				<div class="body">
					<table class="table" id="course-room-list"
                       data-toggle="table"
                       data-toolbar="#get"
                       data-url="/api/courses_rooms/v1/all"
                       data-page-list="[10,20]"
                       data-pagination="true"
                    >
                    <thead>
	                    <tr>
	                        <th data-field="id" data-visible="true">ID</th>
							<th data-visible="true"  data-formatter="getCourseName">Course</th>
	                        <th data-field="room.name" data-visible="true">Room</th>
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
var apiHelper = new ApiHelper('#course-room-form', 'courses_rooms', 'v1');
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
		apiHelper.resource = 'courses_rooms';
		apiHelper.version  = 'v1';

		if($('#course-room-form').valid()){

			var courseId = $('#course-id').val();
			var roomId	 = $('#room-id').val();
			var data = {
				courseId	: courseId,
				roomId		: roomId
			}
			apiHelper.getExistData(data).done(function(r){
				if(r == 0) {
					if (isInsertMode()) {
						apiHelper.insert().done(function (r) {
							console.log(r)
							if (r.status == 'SUCCESS') {
								swal(r.message, "", "success");
								resetForm();
								$('#course-room-list').bootstrapTable('refresh');
							} else {
								swal(r.message, "", "error");
							}

						});
					} else {
						apiHelper.update(currentId).done(function (r) {
							console.log(r)
							if (r.status == 'SUCCESS') {
								swal(r.message, "", "success");
								$('#course-room-list').bootstrapTable('refresh');
							} else {
								swal(r.message, "", "error");
							}
						});
					}
				}else{
					swal("This Entry Already Existed! ", "", "error");
				}
			})
		}
    });
	
	$('#course-room-list').on('click', '.edit', function(e){
		e.preventDefault();
		apiHelper.resource = 'courses_rooms';
		apiHelper.version  = 'v1';

		currentId = $(this).attr('data-id');
		
		apiHelper.getDetail(currentId).done(function(r){
			$('#course-id').val(r.course.id);
			$('#room-id').val(r.room.id);
			switchToUpdateForm(currentId);
		})
		
	})
	
	$('#new').on('click', function(e){
		e.preventDefault();
		switchToNewForm();
	});

	getCourses();
	getRoom();
	
	$('#course-room-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	});
	
	function isInsertMode(){
		return currentId == '';
	}
	
	function switchToUpdateForm(id){
		$('#submit').text('Update');
		$('#form-title').text('Course Room Form | Course Room ID: ' + currentId);
		refreshSelectControl();
	}
	
	function switchToNewForm(){
		currentId = '';
		$('#submit').text('Add');
		$('#form-title').text('Course Room Form');
		$('#course-id').val('');
		$('#room-id').val('');
		refreshSelectControl();

	}
	
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this Course Room?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
			apiHelper.resource = 'courses_rooms';
			apiHelper.version  = 'v1';
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#course-room-list').bootstrapTable('refresh');
	 	        	currentId = '';
	        	}else{
	        		swal(r.message, "", "error");
	 	        	currentId = '';
	        	}

	        });
	    });
	}

	function resetForm(){
		$('#course-id').val('');
		$('#room-id').val('');
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

	function getRoom(){
		apiHelper.resource = 'room';
		apiHelper.version  = 'v1';
		apiHelper.getAll().done(function(r){
			var length 	= r.length;
			var str		= '';
			str+= '<option value="">Please Choose</option>';
			for(var i = 0; i < length; i++){
				str+= '<option value='+r[i].id+'>'+r[i].name+'</option>';
			}
			$('#room-id').html(str);
			$('#room-id').selectpicker('refresh');
		})
	}

	function refreshSelectControl(){
		$('#course-id').selectpicker('refresh');
		$('#room-id').selectpicker('refresh');
	}


});
function getCourseName(value, row, index){
	return row.course.grade.name + ' and ' + row.course.session.name;
}

</script>
