<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>KMS</title>
    <!-- Favicon-->
    <link rel="icon" href="favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    
    <link href="plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
    
     <link href="plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css" rel="stylesheet" />

    <!-- Waves Effect Css -->
    <link href="plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Morris Chart Css-->
    <link href="plugins/morrisjs/morris.css" rel="stylesheet" />

   	<link href="plugins/bootstrap-table/bootstrap-table.css" rel="stylesheet">


    <!-- Bootstrap Select Css -->
    <link href="plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
	
	<link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />
	
    <!-- Custom Css -->
    <link href="css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="css/themes/all-themes.css" rel="stylesheet" />
    
    <script src="plugins/jquery/jquery.min.js"></script>
	<script src="plugins/bootstrap/js/bootstrap.js"></script>
	<script src="plugins/bootstrap-select/js/bootstrap-select.js"></script>
	<script src="plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="plugins/node-waves/waves.js"></script>
	<script src="plugins/bootstrap-table/bootstrap-table.js"></script>
	<script src="js/admin.js"></script>
	<script src="plugins/momentjs/moment.js"></script>
	<script src="plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
	<script src="plugins/sweetalert/sweetalert.min.js"></script>
	<script src="plugins/jquery-validation/jquery.validate.js">
	</script>	<script src="js/demo.js"></script>
	<script src="js/main.js"></script>
	
	<script type="text/javascript">
		$(function(){

			$('.datepicker').bootstrapMaterialDatePicker({
		        format: 'YYYY-MM-DD',//'dddd DD MMMM YYYY',
		        clearButton: true,
		        weekStart: 1,
		        time: false
			});

            $.ajaxSetup({
                beforeSend: function (jqXHR, settings) {
                    jqXHR.setRequestHeader("X-API-KEY", 'sd3209Sdkl2DF3dfzsDGEsZ8476');
                }
            });

		});
	</script>
</head>

<body class="theme-red">