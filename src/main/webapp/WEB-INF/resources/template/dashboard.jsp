<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
    <title>EAVO - ${username} - Dashboard</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendors/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/Gente/css/custom.css">
    <link rel="shortcut icon" type="image/png" href="/resources/images/favicon.ico"/>
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="/resources/js/bootstrap.js"></script>
    <script type="text/javascript" src="/resources/vendors/jquery.nicescroll-3.7.3/jquery.nicescroll-3.7.3/jquery.nicescroll.js"></script>
    <%--<script type="text/javascript" src="/WEB-INF/resources/js/bootstrap.min.js"></script>--%>
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <%--<section class="container">--%>
        <tiles:insertAttribute name="menu"/>
        <tiles:insertAttribute name="header"/>
        <div class="right_col" role="main">
            <tiles:insertAttribute name="body"/>
        </div>
    </div>
</div>
</div>


<tiles:insertAttribute name="footer"/>
</body>
<!-- jQuery -->
<script src="/resources/vendors/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="/resources/vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="/resources/vendors/nprogress/nprogress.js"></script>

<!-- Custom Theme Scripts -->
<script src="/resources/js/custom.js"></script>

<%--<script>--%>
    <%--$('body').niceScroll();--%>
<%--</script>--%>
<%--</section>--%>
