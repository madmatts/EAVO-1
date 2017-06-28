<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<head>

    <link href="/resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="/resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="/resources/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="/resources/vendors/animate.css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="/resources/css/custom.css" rel="stylesheet">
    <meta charset="utf-8">

    <title>EAVO - Login Page</title>
</head>
<%--<body class="login">--%>

<%--<div>--%>
    <%--<a class="hiddenanchor" id="toregister"></a>--%>
    <%--<a class="hiddenanchor" id="tologin"></a>--%>

    <%--<div id="login_wrapper">--%>

        <%--<div class="animate form login_form">--%>
            <%--<c:if test="${afterpost}">--%>
                <%--<div class="alert alert-${alarmtype} alert-dismissible fade in" role="alert">--%>
                    <%--<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span--%>
                            <%--aria-hidden="true">x</span>--%>
                    <%--</button>--%>
                    <%--<strong>${message}</strong>--%>
                <%--</div>--%>
            <%--</c:if>--%>
            <%--<section class="login_content">--%>
                <%--<form role="form" method="post"--%>
                      <%--action="<c:url value="j_spring_security_check"/>">--%>
                    <%--<h1>Login Form</h1>--%>
                    <%--<div>--%>
                        <%--<input type="text" class="form-control" name="j_username" id="j_username"--%>
                               <%--placeholder="Username"--%>
                               <%--required=""/>--%>
                    <%--</div>--%>
                    <%--<div>--%>
                        <%--<input type="password" class="form-control" name="j_password" id="j_password"--%>
                               <%--placeholder="Password" required=""/>--%>
                    <%--</div>--%>
                    <%--<div>--%>
                        <%--<button type="submit" class="btn btn-default submit">Log in</button>--%>
                        <%--<a class="reset_pass" href="#">Lost your password?</a>--%>
                    <%--</div>--%>
                    <%--<div class="clearfix"></div>--%>
                    <%--<div class="separator">--%>

                        <%--<p class="change_link">New to site?--%>
                            <%--<a href="${pageContext.request.contextPath}/register" class="to_register"> Create--%>
                                <%--Account </a>--%>
                        <%--</p>--%>
                        <%--<div class="clearfix"></div>--%>
                        <%--<br/>--%>
                        <%--<div>--%>
                            <%--<h1><i class="fa fa-paw" style="font-size: 26px;"></i> Electronic Assistant of Vehicle--%>
                                <%--User--%>
                            <%--</h1>--%>

                            <%--<p>2015 All Rights Reserved. EAVO Privacy and Terms</p>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</form>--%>
            <%--</section>--%>
        <%--</div>--%>
    <%--</div>--%>

    <%--<div id="register" class="animate form registration_form">--%>
        <%--<section class="login_content">--%>
            <%--<form>--%>
                <%--<h1>Create Account</h1>--%>
                <%--<div>--%>
                    <%--<input type="text" class="form-control" placeholder="Username" required=""/>--%>
                <%--</div>--%>
                <%--<div>--%>
                    <%--<input type="email" class="form-control" placeholder="Email" required=""/>--%>
                <%--</div>--%>
                <%--<div>--%>
                    <%--<input type="password" class="form-control" placeholder="Password" required=""/>--%>
                <%--</div>--%>
                <%--<div>--%>
                    <%--<a class="btn btn-default submit" href="index.html">Submit</a>--%>
                <%--</div>--%>
                <%--<div class="clearfix"></div>--%>
                <%--<div class="separator">--%>

                    <%--<p class="change_link">Already a member ?--%>
                        <%--<a href="#tologin" class="to_register"> Log in </a>--%>
                    <%--</p>--%>
                    <%--<div class="clearfix"></div>--%>
                    <%--<br/>--%>
                    <%--<div>--%>
                        <%--<h1><i class="fa fa-paw" style="font-size: 26px;"></i> Gentelella Alela!</h1>--%>

                        <%--<p>©2015 All Rights Reserved. Gentelella Alela! is a Bootstrap 3 template. Privacy and--%>
                            <%--Terms</p>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</form>--%>
        <%--</section>--%>
    <%--</div>--%>
<%--</div>--%>
<%--</div>--%>

<%--<!-- jQuery -->--%>
<%--<script src="/resources/vendors/jquery/dist/jquery.min.js"></script>--%>
<%--<!-- Bootstrap -->--%>
<%--<script src="/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>--%>
<%--<!-- FastClick -->--%>
<%--<script src="/resources/vendors/fastclick/lib/fastclick.js"></script>--%>
<%--<!-- NProgress -->--%>
<%--<script src="/resources/vendors/nprogress/nprogress.js"></script>--%>
<%--<!-- bootstrap-progressbar -->--%>
<%--<script src="/resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>--%>
<%--<!-- iCheck -->--%>
<%--<script src="/resources/vendors/iCheck/icheck.min.js"></script>--%>
<%--<!-- PNotify -->--%>
<%--</body>--%>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <c:if test="${afterpost}">
                <div class="alert alert-${alarmtype} alert-dismissible fade in" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                            aria-hidden="true">x</span>
                    </button>
                    <strong>${message}</strong>
                </div>
            </c:if>
            <section class="login_content">
                <form role="form" method="post"
                      action="<c:url value="j_spring_security_check"/>">
                    <h1>Login Form</h1>
                    <div>
                        <input type="text" class="form-control" name="j_username" id="j_username"
                               placeholder="Username"
                               required=""/>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="j_password" id="j_password"
                               placeholder="Password" required=""/>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-default submit">Log in</button>
                        <a class="reset_pass" href="#">Lost your password?</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">New to site?
                            <a href="#signup" class="to_register"> Create Account </a>
                        </p>

                        <div class="clearfix"></div>
                        <br/>

                        <div>
                            <h1><i class="fa fa-road"></i> EAVO</h1>
                            <p>2016 All Rights Reserved. EAVO is an assistant for vehicle users.</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>

        <div id="register" class="animate form registration_form">
            <section class="login_content">
                <form>
                    <h1>Create Account</h1>
                    <div>
                        <input type="text" class="form-control" placeholder="Username" required=""/>
                    </div>
                    <div>
                        <input type="email" class="form-control" placeholder="Email" required=""/>
                    </div>
                    <div>
                        <input type="password" class="form-control" placeholder="Password" required=""/>
                    </div>
                    <div>
                        <a class="btn btn-default submit" href="index.html">Submit</a>
                    </div>

                    <div class="clearfix"></div>

                    <div class="separator">
                        <p class="change_link">Already a member ?
                            <a href="#signin" class="to_register"> Log in </a>
                        </p>

                        <div class="clearfix"></div>
                        <br/>

                        <div>
                            <h1><i class="fa fa-road"></i> EAVO</h1>
                            <p>2016 All Rights Reserved. EAVO is an assistant for vehicle users.</p>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
</div>
</body>


