<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="admin">
    <tiles:putAttribute name="body">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">All users</div>
                <div class="panel-body">
                    <h4>User List</h4>
                    <table class="table table-hover table-striped panel panel-default">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Email</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userList}" var="user">
                            <tr<c:if test="${user.role.getRole() == \"admin\"}"> class="table-success"</c:if>>
                                <td><c:out value="${user.id}"></c:out></td>
                                <td><c:out value="${user.login}"></c:out></td>
                                <td><c:out value="${user.role.getRole()}"></c:out></td>
                                <td><c:out value="${user.email}"></c:out></td>
                                <td>
                                    <a href="/admin/viewuser/${user.login}"><button class="btn btn-xs btn-primary"><i class="fa fa-user"></i> Profile</button></a>
                                    <a href="/admin/remove/${user.login}"><button class="btn btn-xs btn-danger"><i class="fa fa-times"></i> Remove</button></a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
