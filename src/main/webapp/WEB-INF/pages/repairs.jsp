<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>
                    Car parts exploitation
                </h3>
            </div>
        </div>
        <div class="clearfix"></div>

        <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title">
                <h2>Profile
                    <small>Edit your profile</small>
                </h2>
                <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                           aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">

                        </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="x_content">
                    <%--<c:forEach items="${carParts}" var="cp">--%>
                <div class="animated flipInY col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div class="tile-stats">
                        <div class="icon"><i class="fa fa-caret-square-o-right"></i></div>
                        <div class="count">75%</div>

                        <h3>Klocki hamulcowe</h3>
                        <p></p>
                        <div class="col-md-10">
                            <%--<div class="progress">--%>
                                <%--<div class="progress-bar progress-bar-danger" data-transitiongoal="75"--%>
                                     <%--style="width: 75%;"--%>
                                     <%--aria-valuenow="75"></div>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                </div>
                    <%--</c:forEach>--%>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
