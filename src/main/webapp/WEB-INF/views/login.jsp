<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<h2>Login Form</h2>
		<c:set var="loginUrl">
			<c:url value="/j_spring_security_check" />
		</c:set>
		<div style="margin: auto; margin-bottom: 40px; max-width: 350px"
			align="center">
			<div class="form-group">
				<h3>Zaloguj</h3>
				<form action="<c:url value='/j_spring_security_check' />" method='POST'>
					<div class="control-group">
						<!-- Username -->
						<label class="control-label">Nazwa użytkownika</label>
						<div class="controls">
							<input class="form-control" type="text" name="username" /> 
							<p>
							</p>
						</div>
					</div>

					<div class="control-group">
						<!-- Password -->
						<label class="control-label">Hasło</label>
						<div class="controls">
							<input class="form-control" type="password" name="password" /> 
							<p>
							</p>
						</div>
					</div>

					<div class="control-group">
						<!-- Button -->
						<div class="controls">
							<button class="btn btn-success">Loguj</button>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
				<p class="text-danger">${errorMsg}</p>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>