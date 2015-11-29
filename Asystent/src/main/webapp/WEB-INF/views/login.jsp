<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<html>
<head>
<title>Login Page</title>
</head>
<body onload='document.loginForm.username.focus();'>
	<div id="content">
		<h3>Login with Username and Password</h3>

		<form method="post" action="/licznik/user/login">
			<table>
				<tr>
					<td>User:</td>
					<td><input type="text" id="username" name="username" placeholder="Username"/></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" id="password" name="password" placeholder="Password"/></td>
				</tr>
				<tr>
					<td colspan="2"><button id="loginButton" value="Login" /></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />

		</form>
	</div>

</body>
		</html>
	</tiles:putAttribute>
</tiles:insertDefinition>