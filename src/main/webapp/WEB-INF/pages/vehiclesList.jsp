<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-9">
            <div class="panel">
                <h2>Vehicles</h2>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="/vehicle/add">
                            <button class=" btn btn-xs btn-info">Add vehicle</button>
                        </a>
                    </div>
                </div>
                <c:forEach items="${vehiclesList}" var="v">
                    <div class="panel row-default">
                        <div class="panel-body">
                            <div class="col-lg-3">
                                <img src="https://www.autolist.com/assets/listings/default_car.jpg" class="img-thumbnail"/>
                            </div>
                            <div class="col-lg-9">
                                <div clas="row">
                                    <h3><span class="text-capitalize text-primary"><c:out value="${v.model}"></c:out></span></h3>
                                </div>
                                <div class="row">
                                    <ul class="list-group">
                                        <div class="list-inline">
                                            <h4 class="list-group-item-heading">Type</h4>
                                            <li class="text-primary"><c:out value="${v.type}"></c:out></li>
                                        </div>
                                        <div class="list-inline">
                                            <h4 class="list-group-item-heading">Engine</h4>
                                            <li class="text-primary"><c:out value="${v.engine}"></c:out></li>
                                        </div>
                                        <div class="list-inline">
                                            <h4 class="list-group-item-heading">Production year</h4>
                                            <li class="text-primary"><c:out value="${v.year}"></c:out></li>
                                        </div>
                                        <div class="list-inline">
                                            <h4 class="list-group-item-heading">VIN number</h4>
                                            <li class="text-primary"><c:out value="${v.vin}"></c:out></li>
                                        </div>
                                    </ul>
                                </div>
                                <div class="row pull-right">
                                    <div class="panel-default">
                                        <a href="/vehicle/${v.id}">
                                            <button class="btn btn-xs btn-primary"><i class="fa fa-car"></i> View</button>
                                        </a>
                                        <a href="/consumption/add/${v.id}">
                                            <button class="btn btn-xs btn-success"><i class="fa fa-tint"></i> Refill</button>
                                        </a>
                                        <a href="/vehicle/remove/${v.id}">
                                            <button class="btn btn-xs btn-danger"><i class="fa fa-times"></i> Remove</button>
                                        </a>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
