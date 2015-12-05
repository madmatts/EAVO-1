<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ page contentType="text/html; charset=UTF-8"%>
<title>Logowanie</title>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<div style="margin: auto; margin-bottom: 40px; max-width: 250px" align="center">
			<div class="form-group">
				<h3>Zaloguj</h3>
				<form:form action="${pageContext.request.contextPath}/user/login"
					method="post" commandName="userForm" cssClass="form-horizontal">
					<div class="control-group">
						<!-- Password-->
						<label class="control-label">Adres email</label>
						<div class="controls">
							<form:input path="email" cssClass="form-control" />
						</div>
						<p>
							<form:errors path="email" cssClass="text-danger" />
						</p>
					</div>

					<div class="control-group">
						<!-- E-mail -->
						<label class="control-label">Hasło</label>
						<div class="controls">
							<form:password path="password" cssClass="form-control" />
							<p>
								<form:errors path="password" cssClass="text-danger" />
							</p>
						</div>
					</div>

					<div class="control-group">
						<!-- Button -->
						<div class="controls">
							<button class="btn btn-success">Zaloguj się</button>
						</div>
					</div>
				</form:form>
				<c:if test="${'fail' eq param.auth}">
					<div class="text-danger">
						Logowanie nie powiodło się!
					</div>
				</c:if>
			</div>
		</div>
	</tiles:putAttribute>
</tiles:insertDefinition>