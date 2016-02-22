<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div class="col-md-3">
    <div class="panel panel-default">
        <div class="panel-heading">Account settings</div>
        <div class="panel-body">
            <h6>Your personal control panel.</h6>
            <ul class="list-group">
                <li class="list-group-item"><span class="glyphicon glyphicon-eye-open"></span> <a
                        href="/account/profile">View profile</a></li>
                <li class="list-group-item"><span class="glyphicon glyphicon-edit"></span><a
                        href="/account/edit"> Edit information</a></li>
                <li class="list-group-item"><span class="glyphicon glyphicon-remove-circle"></span>
                    <a
                            href="/account/remove">Remove account</a></li>
            </ul>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            Vehicle managment
        </div>
        <div class="panel-body">
            <h6>Vehicles control panel</h6>
            <ul class="list-group">
                <li class="list-group-item"><a href="#"> Show
                    vehicles</a>
                </li>
                <li class="list-group-item"><a href="/consumption/register"> Register
                    consumption</a>
                </li>
                <li class="list-group-item"><a href="#">
                    Consumption statistics</a></li>
                <li class="list-group-item"><a href="#"> Service
                    diary</a>
                </li>
                <li class="list-group-item"><i class="glyphicon glyphicon-bell"></i><a href="#">
                    Reminder settings</a></li>
            </ul>
        </div>
    </div>
</div>
