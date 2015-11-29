<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">

		<div
			style="margin-left: 80px; margin-bottom: 40px; margin-right: 80px;" align="center">


			<hr style="background-color: black; height: 1px; border: 0;" />
			<div style="width: 40%; float: left; padding-right: 50px;">
				<h3>Dodaj nowe zasoby:</h3>
				<form:form action="addCar" method="post" commandName="carForm"
					cssClass="form-horizontal">
					<div class="control-group">
						<!-- Username -->
						<label class="control-label">Nazwa</label>
						<div class="controls">
							<form:input path="manufacturer" cssClass="form-control" />
							<p>
								<form:errors path="manufacturer" cssClass="text-danger" />
							</p>
						</div>
					</div>

					<div class="control-group">
						<!-- E-mail -->
						<label class="control-label">Browar</label>
						<div class="controls">
							<form:input path="model" cssClass="form-control" />
							<p>
								<form:errors path="model" cssClass="text-danger" />
							</p>
						</div>
					</div>

					<div class="control-group">
						<!-- Password-->
						<label class="control-label">Ilość</label>
						<div class="controls">
							<form:input path="year" cssClass="form-control" />
						</div>
						<p>
							<form:errors path="year" cssClass="text-danger" />
						</p>
					</div>

					<div class="control-group">
						<div class="controls">
							<button class="btn btn-success">Dodaj</button>
						</div>
					</div>
				</form:form>
			</div>
			<div style="float: left;">
				<h3>Skład magazynu:</h3>
				<c:if test="${!empty listCars}">
					<table class="tg">
						<tr>
							<th width="100">Nazwa</th>
							<th width="100">Browar</th>
							<th width="100">Ilość</th>
							<th width="60">Usuń</th>
						</tr>
						<c:forEach items="${listCars}" var="car">
							<tr>
								<td>${car.manufacturer}</td>
								<td>${car.model}</td>
								<td>${car.year}</td>
								<td><a href="<c:url value='/userRemoveCar/${car.id}' />">OK</a></td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
			</div>
		</div>

	</tiles:putAttribute>
</tiles:insertDefinition>