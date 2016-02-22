<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-road" aria-hidden="true"></span> EAVO</a>
        </div>
        <div class="collapse navbar-collapse ">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home</a></li>
                <c:if test="${logged != true}">
                    <li><a href="/login">Login</a></li>
                    <li><a href="/register">Register</a></li>
                </c:if>
                <li><a href="#Consumption">Consumption</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right pull-right">
                <c:if test="${logged == true}">
                    <li class=""><a href="/account/profile"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span> My Page</a></li>
                    <li class=""><a href="/account/logout">Logout</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</div>
