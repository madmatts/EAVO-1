<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<head>
    <title>EAVO - Register Page</title>
</head>
<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">
        <div id="Register" class="panel text-center">
            <h2>Register area</h2>
        </div>
        <div class="row">
            <div class="col-sm-4 col-sm-offset-4 text-center">
                <form:form role="form" action="/register" method="post" commandName="userForm">
                    <div class="form-group">
                        <label for="login">Login</label>
                        <form:input class="form-control" id="login" placeholder="Enter login" type="login" path="login"/>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <form:input class="form-control" id="password" placeholder="Enter password" type="password" path="password"/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <form:input class="form-control" id="email" placeholder="Enter email" type="email" path="email"/>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form:form>
                <p></p>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>