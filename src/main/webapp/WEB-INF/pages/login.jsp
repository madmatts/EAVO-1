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
            <div class="col-sm-4 col-sm-offset-4 text-center">
                <p>
                    <c:if test="${error == true}">
                        <b class="">Invalid login or password.</b>
                    </c:if>
                </p>
                <form role="form" method="post" action="<c:url value="j_spring_security_check"/>">
                    <div class="form-group">
                        <label for="j_username">Login</label>
                        <input class="form-control" name="j_username" id="j_username" placeholder="Enter login"
                               type="login">
                    </div>
                    <div class="form-group">
                        <label for="j_password">Password</label>
                        <input class="form-control" name="j_password" id="j_password" placeholder="Enter password"
                               type="password">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
                <p></p>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>