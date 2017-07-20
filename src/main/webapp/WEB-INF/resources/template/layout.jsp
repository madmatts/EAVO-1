<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
    <title>EAVO - Electronic Assistans for Vehicle Owner</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href="/resources/bower_components/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    <link rel="shortcut icon" type="image/png" href="/resources/bower_components/gentelella/images/favicon.ico"/>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/bower_components/gentelella/js/bootstrap.js"></script>
    <script type="text/javascript" src="/resources/vendors/jquery.nicescroll-3.7.3/jquery.nicescroll-3.7.3/jquery.nicescroll.js"></script>
</head>
<body class="footer_fixed">
<tiles:insertAttribute name="header"/>
<div class="container">
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer"/>
</div>

<script src="/resources/bower_components/gentelella/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/resources/bower_components/gentelella/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/resources/bower_components/gentelella/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/resources/bower_components/gentelella/vendors/nprogress/nprogress.js"></script>
<!-- bootstrap-daterangepicker -->
<script src="/resources/bower_components/gentelella/bower_components//vendors/moment/min/moment.min.js"></script>
<script src="/resources/bower_components/gentelella/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- Ion.RangeSlider -->
<script src="/resources/bower_components/gentelella/vendors/ion.rangeSlider/js/ion.rangeSlider.min.js"></script>
<!-- Bootstrap Colorpicker -->
<script src="/resources/bower_components/gentelella/vendors/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<!-- jquery.inputmask -->
<script src="/resources/bower_components/gentelella/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<!-- jQuery Knob -->
<script src="/resources/bower_components/gentelella/vendors/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- Cropper -->
<script src="/resources/bower_components/gentelella/vendors/cropper/dist/cropper.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="/resources/bower_components/gentelella/js/custom.js"></script>
<script>
    $('body').niceScroll();
</script>
</body>
</html>