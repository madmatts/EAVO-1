<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%@ page contentType="text/html; charset=UTF-8"%>
<title>Lista użytkowników</title>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<h1>Edycja użytkownika:</h1>
		<c:if test="${!empty user.username}">

			<form:form action="adminUpdateUser" commandName="user">
				<table>
					<c:if test="${!empty user.username}">
						<tr>
							<td><form:label path="id">
									<spring:message text="ID" />
								</form:label></td>
							<td><form:input path="id" readonly="true" size="8"
									disabled="true" /> <form:hidden path="id" /></td>
						</tr>
					</c:if>
					<tr>
						<td><form:label path="username">
								<spring:message text="username" />
							</form:label></td>
						<td><form:input path="username" /></td>
					</tr>
					<tr>
						<td><form:label path="email">
								<spring:message text="email" />
							</form:label></td>
						<td><form:input path="email" /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit"
							value="<spring:message text="Edit User"/>" /></td>
					</tr>
				</table>
			</form:form>
		</c:if>

		<h3>Użytkownicy:</h3>
		<c:if test="${!empty listUsers}">
			<table class="tg">
				<tr>
					<th width="80">ID</th>
					<th width="120">Nazwa użytkownika</th>
					<th width="120">Adres email</th>
					<th width="60">Zmień</th>
					<th width="60">Usuń</th>
				</tr>
				<c:forEach items="${listUsers}" var="u">
					<tr>
						<td>${u.id}</td>
						<td>${u.username}</td>
						<td>${u.email}</td>
						<td><a
							href="<c:url value='/adminEditUser${u.id}page${pageNumber}' />">Zmień</a></td>
						<td><a href="<c:url value='/adminRemoveUser/${u.id}' />">OK</a></td>
					</tr>
				</c:forEach>
			</table>
			<br />
			<table style="margin: 20px;">
				<tr>
					<c:if test="${pageNumber > 1 }">
						<td style="padding-right: 10px;"><a
							href="<c:url value='/adminuserspage=${pageNumber - 1}' />">Back</a></td>
					</c:if>
					<td style="padding-right: 10px;">
						<p>${pageNumber }</p>
					</td>
					<c:if test="${hasNextPage}">
						<td><a
							href="<c:url value='/adminuserspage=${pageNumber + 1}' />">Next</a>
						</td>
					</c:if>
				</tr>
			</table>
		</c:if>
	</tiles:putAttribute>
</tiles:insertDefinition>


