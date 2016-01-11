<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<h1>HTTP Status 403 - Access is denied</h1>

		<c:choose>
			<c:when test="${empty username}">
				<h2>You do not have permission to access this page!</h2>
			</c:when>
			<c:otherwise>
				<h2>
					Username : ${username} <br />You do not have permission to access
					this page!
				</h2>
			</c:otherwise>
		</c:choose>
	</tiles:putAttribute>
</tiles:insertDefinition>
</html>