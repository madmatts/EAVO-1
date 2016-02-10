<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <link rel="shortcut icon" type="image/png" href="/resources/img/favicon.ico"/>

    <%--<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css"/>--%>
</head>
<body>

<tiles:insertAttribute name="header"/>
<div class="container">
    <tiles:insertAttribute name="body"/>

    <tiles:insertAttribute name="footer"/>
</div>
</body>
</html>