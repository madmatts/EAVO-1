<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <title>EAVO - Welcome</title>
</head>
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
            <title>Welcome page</title>
        </head>
        <body>
        <h1>Welcome page</h1>
        <p>${login}, you have successfully logged in.<br/>
            <a href="${pageContext.request.contextPath}/index">Home page</a><br/></p>
        </body>
        </html>
    </tiles:putAttribute>
</tiles:insertDefinition>