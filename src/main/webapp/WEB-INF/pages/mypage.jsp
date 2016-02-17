<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
        <div class="well well-sm text-center"><h5>${username} Dashboard</h5></div>
        <div class="row">
            <div class="col-md-3">
                <div class="panel panel-default">
                    <div class="panel-heading"><h5>Account settings</h5></div>
                    <div class="panel-body">
                        <h6>Your personal control panel.</h6>
                        <ul class="list-group">
                            <li class="list-group-item"><span class="glyphicon glyphicon-eye-open"></span> <a href="/account/profile">View profile</a></li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-edit"></span><a href="/account/edit"> Edit information</a></li>
                            <li class="list-group-item"><span class="glyphicon glyphicon-remove-circle"></span> <a href="/account/remove">Remove account</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6">

            </div>
            <div class="col-md-3">

            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
