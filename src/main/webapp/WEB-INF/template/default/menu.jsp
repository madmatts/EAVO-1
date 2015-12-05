<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<style type="text/css">
a, a:hover, a:visited{
	color: #ff9900;
    margin-left: 1px;
    margin-right: 3px;
    text-decoration: none;
}

.menu {
	padding: 0px 10px 0px 10px;
	width: 200px;
	float: left;
	color: #dddddd;
	background-color: #142029;
	border: solid 1px #ff9900;
	border-radius: 0.5em;
	margin-right: 25px;
}
</style>

<div class="menu">
	<h2>Menu</h2>
	<ul>
		<li><spring:url value="/" var="homeUrl" htmlEscape="true" />
			<a href="${homeUrl}">Strona główna</a></li>
		<li><spring:url value="/user/register" var="registerForm"
				htmlEscape="true" /> <a href="${registerForm}">Rejestracja</a></li>
		<li><spring:url value="/refuel/refill" var="refillForm"
				htmlEscape="true" /> <a href="${refillForm}">Tankowanie</a></li>
	</ul>
</div>