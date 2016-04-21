<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <title>EAVO - Register Page</title>
</head>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div id="Register" class="col-md-9">
            <h2>Vehicle</h2>
            <div class="col-md-8 col-md-offset-2">
                <form:form role="form" action="/vehicle/add" method="post" commandName="vehicleForm">
                    <div class="form-group">
                        <label for="type">Type</label>
                        <form:select id="type" class="form-control" path="type">
                            <form:option value="Samochód">Car</form:option>
                            <form:option value="Motocykl">Motorcycle</form:option>
                            <form:option value="Dostwczy">Truck</form:option>
                        </form:select>
                    </div>
                    <div class="form-group">
                        <label for="model">Model</label>
                        <form:input class="form-control" id="model" placeholder="Enter model" type="text" path="model"/>
                    </div>
                    <div class="form-group">
                        <label for="engine">Engine</label>
                        <form:input class="form-control" id="engine" placeholder="Enter engine" type="text" path="engine"/>
                    </div>
                    <div class="form-group">
                        <label for="year">Year</label>
                        <form:input class="form-control" id="year" placeholder="Enter year" type="text" path="year"/>
                    </div>
                    <div class="form-group">
                        <label for="vin">VIN</label>
                        <form:input class="form-control" id="vin" placeholder="Enter vin" type="text" path="vin"/>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form:form>
                <p></p>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>