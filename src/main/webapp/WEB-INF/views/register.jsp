<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<body>
			<h2>Registration Form</h2>
			<div style="margin: auto; margin-bottom: 40px; max-width: 350px"
				align="center">
				<div class="form-group">
					<h3>Zarejestruj</h3>
					<form:form method="post" modelAttribute="userForm">
						<div class="control-group">
							<!-- Username -->
							<label class="control-label">Nazwa użytkownika</label>
							<div class="controls">
								<form:input class="form-control" path="username" id="username" />
								<p>
									<form:errors path="username" cssClass="text-danger" />
								</p>
							</div>
						</div>

						<div class="control-group">
							<!-- E-mail -->
							<label class="control-label">Hasło</label>
							<div class="controls">
								<form:password class="form-control" path="password" id="password" />
								<p>
									<form:errors path="password" cssClass="text-danger" />
								</p>
							</div>
						</div>

						<div class="control-group">
							<!-- Password-->
							<label class="control-label">Adres email</label>
							<div class="controls">
								<form:input class="form-control" path="email" id="email" />
							</div>
							<p>
								<form:errors path="email" cssClass="text-danger" />
							</p>
						</div>

						<div class="control-group">
							<!-- Password-->
							<label class="control-label">Samochód</label>
							<div class="controls">
								<form:input class="form-control" path="car" id="car" />
							</div>
							<p>
								<form:errors path="car" cssClass="text-danger" />
							</p>
						</div>

						<div class="control-group">
							<!-- Button -->
							<div class="controls">
								<button class="btn btn-success">Rejestruj</button>
							</div>
						</div>
					</form:form>
					<p class="text-danger">${notification}</p>
				</div>
			</div>
		</body>
	</tiles:putAttribute>
</tiles:insertDefinition>
