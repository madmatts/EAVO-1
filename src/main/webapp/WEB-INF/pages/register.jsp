<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <title>EAVO - Register Page</title>
</head>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <%--<div id="Register" class="panel text-center">--%>
        <%--<h2>Register area</h2>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
        <%--<div class="col-sm-4 col-sm-offset-4 text-center">--%>
        <%--<form:form role="form" action="/register" method="post" commandName="userForm">--%>
        <%--<div class="form-group">--%>
        <%--<label for="login">Login</label>--%>
        <%--<form:input class="form-control" id="login" placeholder="Enter login" type="login" path="login"/>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label for="password">Password</label>--%>
        <%--<form:input class="form-control" id="password" placeholder="Enter password" type="password" path="password"/>--%>
        <%--</div>--%>
        <%--<div class="form-group">--%>
        <%--<label for="email">Email address</label>--%>
        <%--<form:input class="form-control" id="email" placeholder="Enter email" type="email" path="email"/>--%>
        <%--</div>--%>
        <%--<button type="submit" class="btn btn-primary">Submit</button>--%>
        <%--</form:form>--%>
        <%--<p></p>--%>
        <%--</div>--%>
        <%--</div>--%>
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>
                        Form Validation
                    </h3>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Form validation
                                <small>sub title</small>
                            </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Settings 1</a>
                                        </li>
                                        <li><a href="#">Settings 2</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">

                            <form:form class="form-horizontal form-label-left" role="form" action="/register" method="post" commandName="userForm" novalidate="">

                                <p>For alternative validation library <code>parsleyJS</code> check out in the <a href="form.html">form page</a>
                                </p>
                                <span class="section">Personal Info</span>

                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">Login <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <form:input id="name" class="form-control col-md-7 col-xs-12" data-validate-length-range="16" data-validate-words="1" name="name" placeholder="put your login name"
                                                    required="required" type="text" path="login" />
                                    </div>
                                </div>

                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Email <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <form:input type="email" id="email" name="email" required="required" class="form-control col-md-7 col-xs-12" path="email"/>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="email">Confirm Email <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="email" id="email2" name="confirm_email" data-validate-linked="email" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="password" class="control-label col-md-3">Password</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <form:input id="password" type="password" name="password" data-validate-length-range="4,16" class="form-control col-md-7 col-xs-12" required="required"
                                                    path="password"/>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label for="password2" class="control-label col-md-3 col-sm-3 col-xs-12">Repeat Password</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="password2" type="password" name="password2" data-validate-linked="password" class="form-control col-md-7 col-xs-12" required="required">
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <button type="reset" class="btn btn-primary">Cancel</button>
                                        <button id="send" type="submit" class="btn btn-success">Submit</button>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- jQuery -->
        <script src="/resources/vendors/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap -->
        <script src="/resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
        <!-- FastClick -->
        <script src="/resources/vendors/fastclick/lib/fastclick.js"></script>
        <!-- NProgress -->
        <script src="/resources/vendors/nprogress/nprogress.js"></script>
        <!-- validator -->
        <script src="/resources/vendors/validator/validator.min.js"></script>

        <!-- Custom Theme Scripts -->
        <script src="js/custom.js"></script>

        <!-- validator -->
        <script>
            // initialize the validator function
            validator.message.date = 'not a real date';

            // validate a field on "blur" event, a 'select' on 'change' event & a '.reuired' classed multifield on 'keyup':
            $('form')
                    .on('blur', 'input[required], input.optional, select.required', validator.checkField)
                    .on('change', 'select.required', validator.checkField)
                    .on('keypress', 'input[required][pattern]', validator.keypress);

            $('.multi.required').on('keyup blur', 'input', function () {
                validator.checkField.apply($(this).siblings().last()[0]);
            });

            $('form').submit(function (e) {
                e.preventDefault();
                var submit = true;

                // evaluate the form using generic validaing
                if (!validator.checkAll($(this))) {
                    submit = false;
                }

                if (submit)
                    this.submit();

                return false;
            });
        </script>
    </tiles:putAttribute>
</tiles:insertDefinition>

