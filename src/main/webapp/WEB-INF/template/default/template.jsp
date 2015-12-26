<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@ page contentType="text/html; charset=UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Elektroniczny asystent</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet" media="screen" />
<link href="<c:url value="/resources/css/bootstrap-theme.css" />"
	rel="stylesheet" />
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Cambay&subset=latin,latin-ext'
	rel='stylesheet' type='text/css'>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>

<style>
</style>
<body>
	<%-- <tiles:insertAttribute name="header" /> --%>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Elektroniczny asystent</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Logowanie</a></li>
					<li><a href="#">Rejestracja</a></li>
					<li><a href="#">Main</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
				<form class="navbar-form navbar-right">
					<input type="text" class="form-control" placeholder="Search...">
				</form>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row row-offcanvas row-offcanvas-left">
			<tiles:insertAttribute name="menu" />
			<div class="col-sm-9 col-md-10 main">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
	</div>
	<!--/.container-->
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>
</body>
</html>
