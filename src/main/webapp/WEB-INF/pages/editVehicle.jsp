<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<head>
    <title>EAVO - Register Page</title>
    <meta charset="utf-8"/>
</head>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>
                        Add vehicle
                    </h3>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Vehicle
                                <small>Add vehicle to your account</small>
                            </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <c:if test="${afterpost}">
                                <div class="alert alert-${alarmtype} alert-dismissible fade in" role="alert">
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                                            aria-hidden="true">x</span>
                                    </button>
                                    <strong>${message}</strong>
                                </div>
                            </c:if>
                            <form class="form-horizontal form-label-left" action="/vehicle/add" method="post"
                                  novalidate="" modelAttribute="vehicle">
                                <span class="section">Vehicle </span>

                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="brand">Brand <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input id="brand" class="form-control col-md-7 col-xs-12" name="brand"
                                               placeholder="Opel" required="required" type="text" path="brand"
                                               value="${vehicle.getBrand()}"/>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class=" control-label col-md-3 col-sm-3 col-xs-12" for="model">Model <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="model" name="model"
                                               placeholder="Vectra" required="required"
                                               class="form-control col-md-7 col-xs-12" path="model"
                                               value="${vehicle.getModel()}"/>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="engine">Engine <span
                                            class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="engine" name="engine"
                                               placeholder="1.8l" required="required"
                                               class="form-control col-md-7 col-xs-12" path="engine"
                                               value="${vehicle.getEngine()}"/>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="engine">Vin number
                                        <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="vin"
                                               placeholder="WOL12345678901112" required="required"
                                               class="form-control col-md-7 col-xs-12" name="vin"
                                               value="${vehicle.getVin()}"/>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-3">Produtcion date</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" data-inputmask="'mask': '99-99-9999'"
                                               placeholder="dd/MM/yyyy" name="productionDate"
                                               value="${vehicle.getProductionDate()}"/>
                                        <span class="fa fa-calendar-o form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-3">Registration Date</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" class="form-control" data-inputmask="'mask': '99-99-9999'"
                                               placeholder="dd/MM/yyyy" name="firstRegistrationDate"
                                               value="${vehicle.getFirstRegistrationDate()}"/>
                                        <span class="fa fa-calendar-o form-control-feedback right"
                                              aria-hidden="true"></span>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="registrationNumber">Registration
                                        number <span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="registrationNumber" name="registrationNumber"
                                               placeholder="EP12345" required="required"
                                               class="form-control col-md-7 col-xs-12" path="registrationNumber"
                                               value="${vehicle.getRegistrationNumber()}"/>
                                    </div>
                                </div>
                                <div class="item form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="fueltype">Fuel
                                        type<span class="required">*</span>
                                    </label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select id="fueltype" class="form-control" required name="fueltype">
                                            <c:forEach var="type" items="${fuelTypeList}">
                                                <c:choose>
                                                    <c:when test="${type.equals(vehicle.getFuelType())}">
                                                        <option value="${type.toString()}" selected="selected">${type.toString()}</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="${type.toString()}">${type.toString()}</option>
                                                    </c:otherwise>
                                                </c:choose>

                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-md-offset-3">
                                        <button type="reset" class="btn btn-primary">Cancel</button>
                                        <button id="submit" type="submit" class="btn btn-success">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>


<!-- jquery.inputmask -->
<script src="/resources/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>

<!-- jquery.inputmask -->
<script>
    $(document).ready(function () {
        $(":input").inputmask();
    });
</script>
<!-- /jquery.inputmask -->