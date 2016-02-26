<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Vehicle viewer
                </div>
                <div class="panel-body">
                    <div class="col-md-4">
                        <img src="http://gfol1.automarket-eu.com/159_ws1034242623.jpg" class="img-thumbnail">
                    </div>
                    <div class="col-md-4">
                        <dl class="list list-group">
                            <dt>Vehicle type</dt>
                            <dd class="list-group-item">Car</dd>
                            <dt>Model</dt>
                            <dd class="list-group-item">Alfa Romeo 159</dd>
                            <dt>Year</dt>
                            <dd class="list-group-item">2008</dd>
                            <dt>VIN</dt>
                            <dd class="list-group-item">AR1324564132</dd>
                        </dl>
                    </div>
                    <div class="col-md-4">
                        <dl class="list list-group">
                            <dt>Current mileage</dt>
                            <div class="input-group">
                                <dd class="list-group-item text-right">30 000</dd>
                                <span class="input-group-addon" id="sizing-addon3">km</span>
                            </div>
                            <dt>Average consumption</dt>
                            <div class="input-group">
                                <dd class="list-group-item text-right">18.65</dd>
                                <span class="input-group-addon" id="sizing-addon3">L/100km</span>
                            </div>
                            <dt>Main fuel station</dt>
                            <dd class="list-group-item">Statoil</dd>
                        </dl>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
