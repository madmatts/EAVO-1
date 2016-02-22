<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Profile Viewer
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-3">
                            <img class="img-thumbnail img-responsive"
                                 src="${pageContext.request.contextPath}/resources/images/header-bg.jpg" alt="...">
                        </div>
                        <div class="col-md-9">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="col-xs-6 col-lg-9">
                                        <div class="col-xs-6 col-lg-3">
                                            <p class="text-info text-right">Login</p>
                                            <p class="text-info text-right">E-mail</p>
                                            <p class="text-info text-right">Role</p>
                                        </div>
                                        <div class="col-xs-6 col-lg-9">
                                            <p class="text-info text-left">${user.getLogin()}</p>
                                            <p class="text-info text-left">${user.getEmail()}</p>
                                            <p class="text-info text-left">${user.getRole().getRole()}</p>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 col-lg-3">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
