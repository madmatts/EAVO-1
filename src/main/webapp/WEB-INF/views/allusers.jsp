<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>All Users</title>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<h2>Uzytkownicy</h2>
	<table>
		<tr>
			<td>NAME</td>
			<td>Joining Date</td>
			<td>Salary</td>
		</tr>
		<c:forEach items="${users}" var="employee">
			<tr>
				<td>${users.username}</td>
				<td>${users.email}</td>
				<td>${users.car}</td>
			</tr>
		</c:forEach>
	</table>
</body>
		</html>
	</tiles:putAttribute>
</tiles:insertDefinition>