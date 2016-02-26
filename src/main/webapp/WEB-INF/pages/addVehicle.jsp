<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
    <title>EAVO - Register Page</title>
</head>
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
        <div id="Register" class="panel text-center">
            <h2>Vehicle </h2>
        </div>
        <div class="row">
            <div class="col-sm-4 col-sm-offset-4 text-center">
                <form:form role="form" action="/vehicle/add" method="post" commandName="vehicleForm">
                    <div class="form-group">
                        <label for="type">Type</label>
                        <form:input class="form-control" id="type" placeholder="Enter type" type="text" path="type"/>
                    </div>
                    <div class="form-group">
                        <label for="model">Model</label>
                        <form:input class="form-control" id="model" placeholder="Enter model" type="text" path="model"/>
                    </div>
                    <div class="form-group">
                        <label for="engine">Engine</label>
                        <input class="form-control" id="engine" placeholder="Enter engine" type="text"/>
                    </div>
                    <div class="form-group">
                        <label for="year">Year</label>
                        <form:input class="form-control" id="year" placeholder="Enter year" type="text" path="year"/>
                    </div>
                    <div class="form-group">
                        <label for="vin">VIN</label>
                        <form:input class="form-control" id="vin" placeholder="Enter vin" type="text" path="vin"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form:form>
                <p></p>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>