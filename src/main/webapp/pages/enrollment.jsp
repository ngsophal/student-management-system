<%
String studentId = request.getParameter("studentId");
String enrollmentId = request.getParameter("enrollmentId");
String state = "";
if(enrollmentId != "" && enrollmentId != null) state = "edit";
else if(studentId != "") state = "insert";

%>
<div class="container-fluid">
	<div class="block-header">
		<h2>
			Enrollment <% if(state == "edit") out.print(" | Edit ID:" + enrollmentId); %>
		</h2>
	</div>
	<!-- Basic Validation -->
	
	<div class="row clearfix">

		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
                   <div class="header bg-red">
                       <h2>
                          Student Information
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
                   </div>
			</div>
		</div>
	</div>
	
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>Enrollment</h2>
				</div>
				<div class="body">
					<form id="enrollment-form" method="POST">
						<input type="hidden" id="student-id" name="studentId" value="">
						<label for="course-id">Course</label>
						<div class="form-group">
							<div class="form-line">
								<select class="form-control show-tick" id="course-id" name="courseId" required>
								</select>
							</div>
						</div>
						<label for="room">Room</label>
						<div class="form-group form-float">
							<div class="form-line">
								<select class="form-control show-tick" id="room-id" name="roomId" required>
								</select>
							</div>
						</div>
						<label for="enrollment-date">Enrollment Date</label>
						<div class="form-group">
							<div class="form-line">
								 <input type="text" class="datepicker form-control" name="enrollmentDate" id="enrollment-date" required>								
							</div>
						</div>
						<button class="btn btn-primary waves-effect" id="submit"><% if(state == "edit") out.print("Update"); else out.print("Add"); %></button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
var apiHelper = new ApiHelper('#enrollment-form', 'enrollment', 'v1');
var studentApiHelper = new ApiHelper('', 'student', 'v1');
var courseApiHelper = new ApiHelper('', 'course', 'v1');

var state = '<%= state %>';
var enrollmentId = '<%= enrollmentId %>';
var studentId = '<%= studentId %>';


$(document).ready(function() {
	console.log(state);
    loadCourses();
    if(state == 'edit'){
    	loadEnrollment();
    }else{
    	loadRooms();	
    }
    loadStudent();

    $('#course-id').on('change', function(e){
    	loadRooms();	
    });
    
    $('#submit').on('click', function(e){
		e.preventDefault();
		if($('#enrollment-form').valid()){
			if(state == 'insert'){
	    		apiHelper.insert().done(function(r){
	    			if(r.status == 'SUCCESS'){
		        		swal(r.message, "", "success");
		        		//resetForm();
	    				$('#enrollment-list').bootstrapTable('refresh');	
	    			}else{
		        		swal(r.message, "", "error");
	    			}
	                
	    		});
	    	}else if(state == 'edit'){
	    		apiHelper.update(enrollmentId).done(function(r){
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
	
});	
		
	
	function loadStudent(){		
		studentApiHelper.getDetail(studentId, false).done(function(r){
			$('#st-first-name').html(r.firstname);
			$('#st-last-name').html(r.lastname);
			$('#st-sex').html(r.sexLabel);
			$('#st-dob').html(r.dob);
			$('#st-address').html(r.address);
			$('#st-contact-person').html(r.contact_person_name);
			$('#st-contact-person-relationship').html(r.contact_person_relationship);
			$('#st-contact-person-phone-number').html(r.contact_person_phone);
		})
	}
	
	function loadEnrollment(){
		apiHelper.getDetail(enrollmentId, false).done(function(r){
			loadRooms();
			$('#student-id').val(r.studentId);
			$('#course-id').val(r.courseId);
			$('#room-id').val(r.roomId);
			$('#enrollment-date').val(r.enrollmentDate);
			$('#course-id').selectpicker('refresh');
			$('#room-id').selectpicker('refresh');
			studentId = r.studentId;

		});
	}
	
	function loadCourses(){		
		courseApiHelper.getAll(false).done(function(r){
			var options = '';
			for(var i in r){
				options += "<option value='" + r[i].id + "'>" + r[i].name + "</option>";	

			}
			console.log(options);
			$('#course-id').html(options);
			$('#course-id').selectpicker('refresh');
		})
	}
	
	function loadRooms(){
		var courseId = $('#course-id').selectpicker('val');
		console.log(courseId);
		courseApiHelper.getSubResource(courseId, 'rooms', false).done(function(r){
			var options = '';
			for(var i in r){
				options += "<option value='" + r[i].id + "'>" + r[i].name + "</option>";	

			}
			$('#room-id').html(options);
			$('#room-id').selectpicker('refresh');
		});
	}

</script>