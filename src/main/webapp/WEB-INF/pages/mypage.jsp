<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <title>EAVO - Welcome</title>
</head>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Vehicles
                </div>
                <div class="panel-body text-center">
                    <a href="/vehicle/vehicles"><i class="fa fa-car huge"></i></a></div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Refill
                </div>
                <div class="panel-body text-center">
                    <a href="/vehicle/vehicles"><i class="fa fa-tachometer huge"></i></a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Statistics
                </div>
                <div class="panel-body text-center">
                    <a href="/vehicle/vehicles"><i class="fa fa-line-chart huge"></i></a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Profile
                </div>
                <div class="panel-body text-center">
                    <a href="/vehicle/vehicles"><i class="fa fa-user huge"></i></a>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>