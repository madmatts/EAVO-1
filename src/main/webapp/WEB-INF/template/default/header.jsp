<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Elektroniczny asystent</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="hasRole('ROLE_ANNONYMOUS')">
					<li><spring:url value="/account/login" var="loginForm"
							htmlEscape="true" /><a href="${loginForm}">Logowanie</a></li>
					<li><spring:url value="/account/register" var="registerForm"
							htmlEscape="true" /><a href="${registerForm}">Rejestracja</a></li>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_USER')">
					<li><spring:url value="/account/login" var="loginForm"
							htmlEscape="true" /><a href="${loginForm}">Logowanie</a></li>
					<li><spring:url value="/account/register" var="registerForm"
							htmlEscape="true" /><a href="${registerForm}">Rejestracja</a></li>
				</security:authorize>
				<li><spring:url value="/home" var="home" htmlEscape="true" /><a
					href="${home}">Main</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
</div>
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
				<li><spring:url value="/account/login" var="loginForm"
						htmlEscape="true" /><a href="${loginForm}">Logowanie</a></li>
				<li><spring:url value="/account/register" var="registerForm"
						htmlEscape="true" /><a href="${registerForm}">Rejestracja</a></li>
				<li><spring:url value="/home" var="home" htmlEscape="true" /><a
					href="${home}">Main</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
		</div>
	</div>
</nav>
