<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <title>EAVO - Electronic Assistant of Vehicle Owner</title>
</head>
<body>
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
        <h1>Home page</h1>
        <p>This is Home page. It's available for all users.<br/>
            <a href="${pageContext.request.contextPath}/sec/moderation.html">Moderation page</a><br/>
            <a href="${pageContext.request.contextPath}/admin/first.html">First Admin page</a><br/>
            <a href="${pageContext.request.contextPath}/admin/second.html">Second Admin page</a><br/>
        </p>

    </tiles:putAttribute>
</tiles:insertDefinition>

</body>
</html>