<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div class="col-md-3">
    <div class="panel panel-default">
        <div class="panel-heading">Account settings</div>
        <div class="panel-body">
            <ul class="list-group">
                <li class="list-group-item"><span class="glyphicon glyphicon-eye-open"></span><a href="/account/profile"> View profile</a></li>
                <li class="list-group-item"><span class="glyphicon glyphicon-edit"></span><a href="/account/edit"> Edit information</a></li>
                <li class="list-group-item"><span class="glyphicon glyphicon-remove-circle"></span><a href="/account/remove"> Remove account</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            Vehicle managment
        </div>
        <div class="panel-body">
            <ul class="list-group">
                <li class="list-group-item"><i class="fa fa-car"></i><a href="/vehicle/vehicle/${vehicleId}"> Show vehicles</a></li>
                <li class="list-group-item"><i class="fa fa-pencil-square-o"></i><a href="/consumption/register"> Register refill</a></li>
                <li class="list-group-item"><i class="fa fa-bar-chart"></i><a href="#"> Consumption statistics</a></li>
                <li class="list-group-item"><i class="fa fa-file-text-o"></i><a href="#"> Service diary</a></li>
                <li class="list-group-item"><i class="glyphicon glyphicon-bell"></i><a href="#"> Reminder settings</a></li>
            </ul>
        </div>
    </div>
</div>
