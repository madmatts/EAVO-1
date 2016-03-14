<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-9">
            <div class="panel panel-primary">
                <div class="panel-heading">All users</div>
                <div class="panel-body">
                    <h4>Vehicles</h4>
                    <table class="table table-hover table-striped panel panel-default">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Type</th>
                            <th>Model</th>
                            <th>Engine</th>
                            <th>Year</th>
                            <th>Vin</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${vehiclesList}" var="v">
                            <tr>
                                <td><c:out value="${v.id}"></c:out></td>
                                <td><c:out value="${v.type}"></c:out></td>
                                <td><c:out value="${v.model}"></c:out></td>
                                <td><c:out value="${v.engine}"></c:out></td>
                                <td><c:out value="${v.year}"></c:out></td>
                                <td><c:out value="${v.vin}"></c:out></td>
                                <td>
                                    <a href="/vehicle/${v.id}">
                                        <button class="btn btn-xs btn-primary"><i class="fa fa-car"></i> View</button>
                                    </a>
                                    <a href="/consumption/add/${v.id}">
                                        <button class="btn btn-xs btn-primary"><i class="fa fa-tint"></i> Refill</button>
                                    </a>
                                    <a href="/vehicle/remove/${v.id}">
                                        <button class="btn btn-xs btn-danger"><i class="fa fa-times"></i> Remove</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="/vehicle/add">
                                <button class=" btn btn-xs btn-info">Add vehicle</button>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
