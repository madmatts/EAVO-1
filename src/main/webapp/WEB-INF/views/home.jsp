<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<tiles:insertDefinition name="adminTemplate">
	<tiles:putAttribute name="body">
		<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<h2>Licznik spalania</h2>
	<div style="margin: auto; margin-bottom: 40px;">
		<p>Witaj w aplikacji do przechowywania wyników spalania.</p>
		<p>Host: ${host} </p>
		<p>Port: ${port} </p>
		<p>Database Name: ${databaseName} </p>
	</div>



</body>
		</html>
	</tiles:putAttribute>
</tiles:insertDefinition>