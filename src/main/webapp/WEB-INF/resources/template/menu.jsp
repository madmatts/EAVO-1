<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="/account/mypage" class="site_title"><i class="fa fa-road" aria-hidden="true"></i> <span>EAVO</span></a>
        </div>

        <div class="clearfix"></div>
        <br/>

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                    <li><a href="${pageContext.request.contextPath}/account/mypage"><i class="fa fa fa-tachometer huge"
                                                                                       aria-hidden="true"></i>Dashboard</a>
                    </li>
                    <li><a><i class="fa fa-user" aria-hidden="true"></i> Account <span
                            class="fa fa-chevron-down"></span></a>
                        <ul class="nav child_menu">
                            <li><a href="${pageContext.request.contextPath}/account/profile"><i class="fa fa-user"
                                                                                                aria-hidden="true"></i>Profile</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/account/edit"><i class="fa fa-edit"
                                                                                             aria-hidden="true"></i>Edit</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/account/remove"><i class="fa fa-remove"
                                                                                               aria-hidden="true"></i>Remove</a>
                            </li>
                            <li><a href="${pageContext.request.contextPath}/account/logout"><i class="fa fa-sign-out"
                                                                                               aria-hidden="true"></i>Logout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="menu_section">
                <h3>Vehicles</h3>
                <ul class="nav side-menu">
                    <c:forEach items="${vehicleList}" var="v">
                        <li><a><i class="fa fa-car" aria-hidden="true"></i> ${v.brand} ${v.model} <span
                                class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="${pageContext.request.contextPath}/vehicle/dashboard/${v.id}"><i class="fa fa-user"
                                                                                                              aria-hidden="true"></i>Vehicle</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/vehicle/edit/${v.id}"><i class="fa fa-edit"
                                                                                                         aria-hidden="true"></i>Edit
                                    vehicle</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/vehicle/refuel/${v.id}"><i
                                        class="fa fa-battery-half" aria-hidden="true"></i>Refuels</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/vehicle/repair/${v.id}"><i class="fa fa-wrench"
                                                                                                           aria-hidden="true"></i>Repairs</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/vehicle/cost/${v.id}"><i class="fa fa-money"
                                                                                                         aria-hidden="true"></i>Costs</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/vehicle/settings/${v.id}"><i class="fa fa-gears"
                                                                                                             aria-hidden="true"></i>Settings</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/vehicle/remove/${v.id}"><i class="fa fa-remove"
                                                                                                           aria-hidden="true"></i>Remove</a>
                                </li>
                            </ul>
                        </li>
                    </c:forEach>
                    <li><a href="${pageContext.request.contextPath}/vehicle/add"><i class="fa fa fa-plus"
                                                                                       aria-hidden="true"></i>Add vehicle</a>
                    </li>
                </ul>
            </div>

        </div>
        <!-- /sidebar menu -->

        <!-- /menu footer buttons -->
        <%--<div class="sidebar-footer hidden-small">--%>
        <%--<a data-toggle="tooltip" data-placement="top" title="Settings">--%>
        <%--<span class="glyphicon glyphicon-cog" aria-hidden="true"></span>--%>
        <%--</a>--%>
        <%--<a data-toggle="tooltip" data-placement="top" title="FullScreen">--%>
        <%--<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>--%>
        <%--</a>--%>
        <%--<a data-toggle="tooltip" data-placement="top" title="Lock">--%>
        <%--<span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>--%>
        <%--</a>--%>
        <%--<a data-toggle="tooltip" data-placement="top" title="Logout">--%>
        <%--<span class="glyphicon glyphicon-off" aria-hidden="true"></span>--%>
        <%--</a>--%>
        <%--</div>--%>
        <!-- /menu footer buttons -->
    </div>
</div>
