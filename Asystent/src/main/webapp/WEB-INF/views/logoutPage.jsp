<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<title>Logout Page</title>


<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div
			style="margin-left: 80px; margin-bottom: 40px; margin-right: 80px;">
			<h2>Wylogowano pomyślnie.</h2>
			<a href="${pageContext.request.contextPath}/loginPage">Zaloguj
				się ponownie</a>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>