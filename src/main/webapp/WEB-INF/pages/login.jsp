<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>
    <title>EAVO - Login Page</title>
</head>
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
        <div id="loginarea" class="panel text-center">
            <h2>Login area</h2>
        </div>

        <div class="row">
            <c:if test="${error == true}">
                <div class="alert alert-danger" role="alert">Invalid login or password.</div>
            </c:if>
            <c:if test="${message.length() > 0}">
                <div class="alert alert-success" role="alert">${message}</div>
            </c:if>
            <div class="col-sm-6 col-sm-offset-3 text-center">

                <form class="form-horizontal" role="form" method="post"
                      action="<c:url value="j_spring_security_check"/>">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="j_username">Login</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="j_username" id="j_username" placeholder="Enter login"
                                   type="login" autofocus>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="j_password">Password</label>
                        <div class="col-sm-10">
                            <input class="form-control" name="j_password" id="j_password" placeholder="Enter password"
                                   type="password">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                <p></p>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>