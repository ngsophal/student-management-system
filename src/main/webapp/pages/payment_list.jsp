
<div class="container-fluid">
	<div class="block-header">
		<h2>
			Payment List
		</h2>
	</div>
	
	<div class="row clearfix">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="card">
				<div class="header">
					<h2>Payment List</h2>
				</div>
				<div class="body">
					<table class="table" id="payment-list"
	                       data-toggle="table"
	                       data-toolbar="#get"
	                       data-url="/api/payments/v1/all"
	                       data-page-list="[10,20]"
	                       data-pagination="true"
	                       data-search="true"
	                       data-side-pagination="server">
	                    <thead>
		                    <tr>
		                    	<th data-field="action" data-visible="true"><div style="width:150px">Action</div></th>
		                        <th data-field="id" data-visible="true">ID</th>
		                        <th data-field="enrollment.student.fullname" data-visible="true">Student Name</th>
		                        <th data-field="enrollment.student.sexLabel" data-visible="true">Sex</th>
		                        <th data-field="enrollment.student.dob" data-visible="true">DOB</th>
		                        <th data-field="enrollment.course.name" data-visible="true">Course</th>
		                        <th data-field="enrollment.room.name" data-visible="true">Room</th>
		                        <th data-field="enrollment.enrollmentDate" data-visible="true">Enrollment Date</th>
		                        <th data-field="feeType.name" data-visible="true">Payment Type</th>
		                        <th data-field="paymentAmount" data-visible="true">Payment Amount</th>
		                        <th data-field="discount" data-visible="true">Discount Amount</th>
		                       	<th data-field="paymentDate" data-visible="true">Payment Date</th>
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
var apiHelper = new ApiHelper('', 'payment', 'v1');

var currentId = '';
$(document).ready(function() {
	$('#payment-list').on('click', '.delete', function(e){
		e.preventDefault();
		currentId = $(this).attr('data-id');
		showAjaxLoaderMessage();
	}); 
});	
		
	function showAjaxLoaderMessage() {
	    swal({
	        title: "Delete Confirmation",
	        text: "Are you sure to delete this payment?",
	        type: "info",
	        showCancelButton: true,
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	    }, function () {
	        apiHelper.remove(currentId).done(function(r){
	        	if(r.status == 'SUCCESS'){
	        		swal(r.message, "", "success");
	        		$('#payment-list').bootstrapTable('refresh');
	 	        	currentId = '';
	        	}else{
	        		swal(r.message, "", "error");
	 	        	currentId = '';
	        	}
               
	        });
	    });
	}
	
	

</script>