<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>User Registration Form</title>

</head>

<body>
	<h2>Registration Form</h2>
	<div style="margin: auto; margin-bottom: 40px; max-width: 250px"
		align="center">
		<div class="form-group">
			<h3>Zarejestruj</h3>
			<form:form method="post" modelAttribute="user">
				<div class="control-group">
					<!-- Username -->
					<label class="control-label">Nazwa użytkownika</label>
					<div class="controls">
						<form:input path="username" id="username" />
						<p>
							<form:errors path="username" cssClass="error" />
						</p>
					</div>
				</div>

				<div class="control-group">
					<!-- E-mail -->
					<label class="control-label">Hasło</label>
					<div class="controls">
						<form:password path="password" id="password" />
						<p>
							<form:errors path="password" cssClass="error" />
						</p>
					</div>
				</div>

				<div class="control-group">
					<!-- Password-->
					<label class="control-label">Adres email</label>
					<div class="controls">
						<form:input path="email" id="email" />
					</div>
					<p>
						<form:errors path="email" cssClass="error" />
					</p>
				</div>

				<div class="control-group">
					<!-- Password-->
					<label class="control-label">Samochód</label>
					<div class="controls">
						<form:input path="car" id="car" />
					</div>
					<p>
						<form:errors path="car" cssClass="error" />
					</p>
				</div>

				<div class="control-group">
					<!-- Button -->
					<div class="controls">
						<button class="btn btn-success">Rejestruj</button>
					</div>
				</div>
			</form:form>
			<!-- <p class="text-danger">${notification}</p> -->
		</div>
	</div>
</body>
		</html>
	</tiles:putAttribute>
</tiles:insertDefinition>
