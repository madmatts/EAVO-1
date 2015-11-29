<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<%@ page contentType="text/html; charset=UTF-8"%>
<title>Licznik Tankowania</title>
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css" />" rel="stylesheet" media="screen" />
	<link href="<c:url value="/resources/css/bootstrap-theme.css" />" rel="stylesheet" />
	<link href="<c:url value="/resources/css/style.css" />"
	rel="stylesheet" />
	<link href='http://fonts.googleapis.com/css?family=Cambay&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
</head>

<style>
</style>
<body>
<div class="page container">
	<tiles:insertAttribute name ="header" />
	<tiles:insertAttribute name="menu" />
	<div class="content">
		<tiles:insertAttribute name="body" />
	</div>
	<tiles:insertAttribute name="footer" />
</div>
</body>
</html>