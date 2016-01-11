<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar"
	role="navigation">

	<ul class="nav nav-sidebar">
		<li><spring:url value="/" var="homeUrl" htmlEscape="true" /> <a
			href="${homeUrl}">Strona główna</a></li>
		<li><spring:url value="/account/register" var="registerForm"
				htmlEscape="true" /> <a href="${registerForm}">Rejestracja</a></li>
		<li><spring:url value="/account/login" var="registerForm"
				htmlEscape="true" /> <a href="${registerForm}">Logowanie</a></li>
	</ul>
	<ul class="nav nav-sidebar">
		<li><spring:url value="/refuel/refill" var="refillForm"
				htmlEscape="true" /> <a href="${refillForm}">#Dodaj Auto</a></li>
		<li><spring:url value="/refuel/refill" var="refillForm"
				htmlEscape="true" /> <a href="${refillForm}">Tankowanie</a></li>
	</ul>
</div>
