<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
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

<%--  <div class="header" style="margin-bottom: 10px;">
	<ul class="nav navbar-nav pull-right">
		<li class="active"><a href="${homeUrl}">Główna</a></li>
		<spring:url value="/userprofil" var="userprofilUrl" htmlEscape="true" />
		<li><a href="${userprofilUrl}">Profil</a></li>
		<security:authorize access="!isAuthenticated()">
			<spring:url value="/loginPage" var="loginUrl" htmlEscape="true" />
			<li><a class="btn" href="${loginUrl}">ZALOGUJ SIĘ</a></li>
			<spring:url value="/register" var="registerUrl" htmlEscape="true" />
			<li><a class="btn" href="${registerUrl}">ZAREJESTRUJ SIĘ</a></li>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<li><a href='<s:url value="/logout"></s:url>'>WYLOGUJ SIĘ (<security:authentication
						property="principal.username" />)
			</a></li>
		</security:authorize>
	</ul>
</div>  --%>