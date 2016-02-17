<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
        <div class="well well-sm">${username} Dashboard</div>
        <div class="row">
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">Profile menu</div>
                    <div class="panel-body">
                        <p class="lead">Your personal control panel.</p>
                        <ul class="list-group">
                            <li class="list-group-item"><a href="/account/profile">View profile</a></li>
                            <li class="list-group-item"><a href="/account/edit">Edit information</a></li>
                            <li class="list-group-item"><a href="/account/remove">Remove account</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <p class="lead">Your personal control panel.</p>
                <ul class="list-group">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/sec/moderation.html">Moderation
                        page</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/first.html">First
                        Admin page</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/second.html">Second
                        Admin page</a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <p class="lead">Your personal control panel.</p>
                <ul class="list-group">
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/sec/moderation.html">Moderation
                        page</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/first.html">First
                        Admin page</a></li>
                    <li class="list-group-item"><a href="${pageContext.request.contextPath}/admin/second.html">Second
                        Admin page</a></li>
                </ul>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
