<div class="container-fluid">
	<!-- Basic Validation -->
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2 id="form-title">Student Enrollment Report</h2>
					<ul class="header-dropdown m-r--5">
						<li class="dropdown"><a href="javascript:void(0);"
							class="dropdown-toggle" data-toggle="dropdown" role="button"
							aria-haspopup="true" aria-expanded="false"> <i
								class="material-icons">more_vert</i>
						</a>
					</ul>
				</div>
				<div class="body">
					<form id="form-report-student-enrollment">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									 <div class="row clearfix">
										<div class="col-md-6">

											<div class="form-group">
												<div class="form-line">
													<input type="text" class="form-control datepicker from-date" placeholder="From Date" name="from_date" id="from-date" required>
												</div>
												<div class="help-info">YYYY-MM-DD format</div>
											</div>

										</div>
										<div class="col-md-6">
											<div class="form-group">
												<div class="form-line">
													<input type="text" class="form-control datepicker to-date" placeholder="To Date" name="to_date" id="to-date" required>
												</div>
												<div class="help-info">YYYY-MM-DD format</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<button class="btn btn-success waves-effect generate" id="generate">Generate Report</button>
					</form>
				</div>
			</div>

			<!-- Exportable Table -->
			<div class="row clearfix report" style="display: none;">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="card">
						<div class="header">
							<h2>
								STUDENTS' ENROLLMENT
							</h2>
						</div>
						<div class="body">
							<table class="table table-bordered table-striped table-hover dataTable js-exportable">
								<thead>
								<tr>
									<th>No</th>
									<th>Fullname</th>
									<th>Sex</th>
									<th>DOB</th>
									<th>Address</th>
									<th>Contact Person's Name</th>
									<th>Contact Relationship</th>
									<th>Contact Number</th>
									<th>Course Name</th>
									<th>Room Name</th>
									<th>Enrollment Date</th>
								</tr>
								</thead>
								<tbody id="tb-lists">

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- #END# Exportable Table -->

		</div>
	</div>
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
var version = 'v1';
var arrSex = [];
	arrSex[1] = 'Male';
	arrSex[2] = 'Femlae';

var arrRelatioship = [];
	arrRelatioship[1] = 'Parents';
	arrRelatioship[2] = 'Other';

$(document).ready(function() {

	$('#generate').on('click', function(e){
		e.preventDefault();

		if($('#form-report-student-enrollment').valid()){
			var fromDate = $('#from-date').val();
			var toDate	 = $('#to-date').val();

			$.ajax({
				url: 'api/enrollment_report/' + version +'/' + fromDate + '/' + toDate,
				type: 'GET',
				dataType: 'JSON',
				success : function(r){
					var str = '';
					for(var i =0; i < r.length; i++){
						str += '<tr>';
							str += '<td>'+ (i+1) +'</td>';
							str += '<td>'+ (r[i].firstName + ' ' + r[i].lastName) +'</td>';
							str += '<td>'+  arrSex[r[i].sex] +'</td>';
							str += '<td>'+  r[i].dob +'</td>';
							str += '<td>'+  r[i].address +'</td>';
							str += '<td>'+  r[i].contactPersonName +'</td>';
							str += '<td>'+  arrRelatioship[r[i].contactPersonRelationship] +'</td>';
							str += '<td>'+  r[i].contactPersonPhone +'</td>';
							str += '<td>'+  r[i].courseName +'</td>';
							str += '<td>'+  r[i].roomName +'</td>';
							str += '<td>'+  r[i].entrollmentDate +'</td>';
						str += '</tr>';
					}

					$('#tb-lists').html(str);
					$('.report').css('display', 'block');
				}
			})

		}
	})
	
});


</script>