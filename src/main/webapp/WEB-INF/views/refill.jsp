<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="defaultTemplate">
	<tiles:putAttribute name="body">
		<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>User Registration Form</title>

<style>
.error {
	color: #ff0000;
}

input, select, textarea, button{
    outline: none;
    display: block;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

input:focus, select:focus, textarea:focus{
    outline: none;
    display: block;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border-color: #6495ED;
    border-radius: 4px;
    -webkit-box-shadow:  0 0 5px #6495ED;
    box-shadow:  0 0 5px #6495ED;
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
</style>

</head>

<body>
	<h2>Registration Form</h2>
	<div style="margin: auto; margin-bottom: 40px; max-width: 250px"
		align="center">
		<div class="form-group">
			<h3>Zarejestruj</h3>
			<form:form method="post" modelAttribute="refuel">
				<div class="control-group">
					<!-- amount -->
					<label class="control-label">Litry</label>
					<div class="controls">
						<form:input path="amount" id="amount" placeholder="000.00"/>
						<p>
							<form:errors path="amount" cssClass="error" />
						</p>
					</div>
				</div>

				<div class="control-group">
					<!-- E-mail -->
					<label class="control-label">Kwota</label>
					<div class="controls">
						<form:input path="cost" id="cost" placeholder="0000.00"/>
						<p>
							<form:errors path="cost" cssClass="error" />
						</p>
					</div>
				</div>

				<div class="control-group">
					<!-- Password-->
					<label class="control-label">Data</label>
					<div class="controls">
						<form:input path="date" id="date" placeholder="dd/MM/rrrr"/>
					</div>
					<p>
						<form:errors path="date" cssClass="error" />
					</p>
				</div>

				<div class="control-group">
					<!-- Password-->
					<label class="control-label">Stacja paliw</label>
					<div class="controls">
						<form:input path="fuelstation" id="fuelstation" />
					</div>
					<p>
						<form:errors path="fuelstation" cssClass="error" />
					</p>
				</div>

				<div class="control-group">
					<!-- Button -->
					<div class="controls">
						<button class="btn btn-success">Dodaj tankowanie</button>
					</div>
				</div>
			</form:form>
			<!-- <p class="text-danger">${notification}</p> -->
		</div>
	</div>
</body>
		</html>
	</tiles:putAttribute>
</tiles:insertDefinition>
