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
                        Refuel
                    </h3>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Refuel
                                <small>Refuel your vehicle</small>
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
                            <form class="form-horizontal form-label-left" action="${actionPath}"
                                  method="post" novalidate="" modelAttribute="refuel">
                                <div class="col-md-2 col-sm-12 col-xs-12">
                                    <div class="item form-group">
                                        <label class="control-label">Date</label>
                                        <input type="text" class="form-control" data-inputmask="'mask': '99/99/9999'"
                                               placeholder="dd/MM/yyyy" name="date"
                                               value="<fmt:formatDate pattern="dd/MM/yyyy" value="${refuel.getDate()}" />"/>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-12 col-xs-12">
                                    <div class="item form-group">
                                        <label class="control-label">Mileage</label>
                                        <input type="text" class="form-control" placeholder="256123" name="mileage"
                                               value="${refuel.getMileage()}"/>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-12 col-xs-12">
                                    <div class="item form-group">
                                        <label class="control-label">Litre</label>
                                        <input type="text"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode==46'
                                               class="form-control" placeholder="23.45"
                                               name="volume" value="${refuel.getVolume()}"/>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-12 col-xs-12">
                                    <div class="item form-group">
                                        <label class="control-label">Price</label>
                                        <input type="text"
                                               onkeypress='return (event.charCode >= 48 && event.charCode <= 57) || event.charCode==46'
                                               class="form-control" placeholder="23.45"
                                               name="price" value="${refuel.getPrice()}"/>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-12 col-xs-12">
                                    <div class="item form-group">
                                        <label class="control-label">Fuel station</label>
                                        <input type="text" class="form-control" placeholder="Orlen" name="fuelStation"
                                               value="${refuel.getFuelStation()}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                        <button type="reset" class="btn btn-primary">Cancel</button>
                                        <button id="submit" type="submit" class="btn btn-success">

                                            <c:choose>
                                                <c:when test="${actionPath.contains(\"add\")}">
                                                    Add refuel
                                                </c:when>
                                                <c:otherwise>
                                                    Edit refuel
                                                </c:otherwise>
                                            </c:choose>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- REFUELS TABLE -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Refuels
                                <small>All refuels of your vehicles</small>
                            </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Settings 1</a>
                                        </li>
                                        <li><a href="#">Settings 2</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <table id="datatable-buttons" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Date (dd/mm/yyyy)</th>
                                    <th>Mileage</th>
                                    <th>Litres</th>
                                    <th>Price</th>
                                    <th>PLN/l</th>
                                    <th>Distance</th>
                                    <th>l/100km</th>
                                    <th>Fuel station</th>
                                    <th>Action</th>
                                </tr>

                                </thead>
                                <tbody>
                                <tr class="info">
                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${first.getDate()}"/></td>
                                    <td>${first.getMileage()}</td>
                                    <td>${first.getVolume()}</td>
                                    <td>${first.getPrice()}</td>
                                    <td><fmt:formatNumber type="currency" maxFractionDigits="2"
                                                          value="${(first.getPrice()/first.getVolume())}"/></td>
                                    <td></td>
                                    <td></td>
                                    <td>${first.getFuelStation()}</td>
                                    <td><a href="/vehicle/refuel/edit/${first.getId()}"><span
                                            class="label label-primary">Edit</span></a>
                                        <a href="/vehicle/refuel/remove/${first.getId()}"><span
                                                class="label label-danger">Remove</span></a>
                                    </td>
                                </tr>
                                <c:forEach var="refuel" items="${refuelList}">
                                    <tr>
                                        <td><fmt:formatDate pattern="dd/MM/yyyy" value="${refuel.getDate()}"/></td>
                                        <td>${refuel.getMileage()}</td>
                                        <td>${refuel.getVolume()}</td>
                                        <td>${refuel.getPrice()}</td>
                                        <fmt:setLocale value="en_US"/>
                                        <td><fmt:formatNumber type="currency"
                                                              maxFractionDigits="2"
                                                              value="${(refuel.getPrice()/refuel.getVolume())}"/></td>
                                        <td>${refuel.getMileage()-refuel.getLatestMileage()}</td>
                                        <td><fmt:formatNumber type="number"
                                                              maxFractionDigits="2"
                                                              value="${refuel.getConsumption()}"/></td>
                                        <td>${refuel.getFuelStation()}</td>
                                        <td>
                                            <a href="/vehicle/refuel/edit/${refuel.getId()}"><span
                                                    class="label label-primary">Edit</span></a>
                                            <a href="/vehicle/refuel/remove/${refuel.getId()}"><span
                                                    class="label label-danger">Remove</span></a></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <!-- REFUELSTABLE END -->
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Line Graph
                                <small>Sessions</small>
                            </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Settings 1</a>
                                        </li>
                                        <li><a href="#">Settings 2</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <canvas id="lineChart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Donut Chart Graph
                                <small>Sessions</small>
                            </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Settings 1</a>
                                        </li>
                                        <li><a href="#">Settings 2</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <canvas id="canvasDoughnut"></canvas>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Bar Graph
                                <small>Sessions</small>
                            </h2>
                            <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                       aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#">Settings 1</a>
                                        </li>
                                        <li><a href="#">Settings 2</a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <canvas id="mybarChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </tiles:putAttribute>
</tiles:insertDefinition>


<!-- jquery.inputmask -->
<script src="/resources/vendors/jquery.inputmask/dist/min/jquery.inputmask.bundle.min.js"></script>
<!-- Datatables -->
<script src="/resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="/resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="/resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="/resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="/resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="/resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="/resources/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="/resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="/resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="/resources/vendors/datatables.net-scroller/js/datatables.scroller.min.js"></script>
<script src="/resources/vendors/jszip/dist/jszip.min.js"></script>
<script src="/resources/vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="/resources/vendors/pdfmake/build/vfs_fonts.js"></script>
<!-- Chart.js -->
<script src="/resources/vendors/Chart.js/dist/Chart.min.js"></script>

<!-- jquery.inputmask -->
<script>
    $(document).ready(function () {
        $(":input").inputmask();
    });
</script>
<!-- /jquery.inputmask -->

<!-- Datatables -->
<script>
    $(document).ready(function () {
        var handleDataTableButtons = function () {
            if ($("#datatable-buttons").length) {
                $("#datatable-buttons").DataTable({
                    dom: "Bfrtip",
                    buttons: [
                        {
                            extend: "copy",
                            className: "btn-sm"
                        },
                        {
                            extend: "csv",
                            className: "btn-sm"
                        },
                        {
                            extend: "excel",
                            className: "btn-sm"
                        },
                        {
                            extend: "pdfHtml5",
                            className: "btn-sm"
                        },
                        {
                            extend: "print",
                            className: "btn-sm"
                        },
                    ],
                    responsive: true,
                    order: [[1, 'desc']]
                });
            }
        };

        TableManageButtons = function () {
            "use strict";
            return {
                init: function () {
                    handleDataTableButtons();
                }
            };
        }();

        $('#datatable').dataTable();
        $('#datatable-keytable').DataTable({
            keys: true
        });

        $('#datatable-responsive').DataTable();

        $('#datatable-scroller').DataTable({
            ajax: "js/datatables/json/scroller-demo.json",
            deferRender: true,
            scrollY: 380,
            scrollCollapse: true,
            scroller: true
        });

        var table = $('#datatable-fixed-header').DataTable({
            fixedHeader: true
        });

        TableManageButtons.init();
    });
</script>
<!-- /Datatables -->
<!-- Chart.js -->
<script>
    Chart.defaults.global.legend = {
        enabled: false
    };

    // Line chart
    var ctx = document.getElementById("lineChart");
    var lineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: [
                "January", "February", "March", "April"],
            datasets: [{
                label: "Litre: ",
                backgroundColor: "rgba(38, 185, 154, 0.31)",
                borderColor: "rgba(38, 185, 154, 0.7)",
                pointBorderColor: "rgba(38, 185, 154, 0.7)",
                pointBackgroundColor: "rgba(38, 185, 154, 0.7)",
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderColor: "rgba(220,220,220,1)",
                pointBorderWidth: 1,
                data: [${averageConsumption}]
            }]
        },
    });

    // Bar chart
    var ctx = document.getElementById("mybarChart");
    var mybarChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [{
                label: '# of Votes',
                backgroundColor: "#26B99A",
                data: [51, 30, 40, 28, 92, 50, 45]
            }, {
                label: '# of Votes',
                backgroundColor: "#03586A",
                data: [41, 56, 25, 48, 72, 34, 12]
            }]
        },

        options: {
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    // Doughnut chart
    var ctx = document.getElementById("canvasDoughnut");
    var data = {
        labels: [
            ${fuelStations},
        ],
        datasets: [{
            data: [${fuelStationCounts}],
            backgroundColor: [
                "#455C73",
                "#9B59B6",
                "#BDC3C7",
                "#26B99A",
                "#3498DB"
            ],
            hoverBackgroundColor: [
                "#34495E",
                "#B370CF",
                "#CFD4D8",
                "#36CAAB",
                "#49A9EA"
            ]
        }]
    };

    var canvasDoughnut = new Chart(ctx, {
        type: 'doughnut',
        tooltipFillColor: "rgba(51, 51, 51, 0.55)",
        data: data,
    });

    // Radar chart
    var ctx = document.getElementById("canvasRadar");
    var data = {
        labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
        datasets: [{
            label: "My First dataset",
            backgroundColor: "rgba(3, 88, 106, 0.2)",
            borderColor: "rgba(3, 88, 106, 0.80)",
            pointBorderColor: "rgba(3, 88, 106, 0.80)",
            pointBackgroundColor: "rgba(3, 88, 106, 0.80)",
            pointHoverBackgroundColor: "#fff",
            pointHoverBorderColor: "rgba(220,220,220,1)",
            data: [65, 59, 90, 81, 56, 55, 40]
        }, {
            label: "My Second dataset",
            backgroundColor: "rgba(38, 185, 154, 0.2)",
            borderColor: "rgba(38, 185, 154, 0.85)",
            pointColor: "rgba(38, 185, 154, 0.85)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 96, 27, 100]
        }]
    };

    var canvasRadar = new Chart(ctx, {
        type: 'radar',
        data: data,

    });

    // Pie chart
    var ctx = document.getElementById("pieChart");
    var data = {
        datasets: [{
            data: [120, 50, 140, 180, 100],
            backgroundColor: [
                "#455C73",
                "#9B59B6",
                "#BDC3C7",
                "#26B99A",
                "#3498DB"
            ],
            label: 'My dataset' // for legend
        }],
        labels: [
            "Dark Gray",
            "Purple",
            "Gray",
            "Green",
            "Blue"
        ]
    };

    var pieChart = new Chart(ctx, {
        data: data,
        type: 'pie',
        otpions: {
            legend: false
        }
    });

    // PolarArea chart
    var ctx = document.getElementById("polarArea");
    var data = {
        datasets: [{
            data: [120, 50, 140, 180, 100],
            backgroundColor: [
                "#455C73",
                "#9B59B6",
                "#BDC3C7",
                "#26B99A",
                "#3498DB"
            ],
            label: 'My dataset' // for legend
        }],
        labels: [
            "Dark Gray",
            "Purple",
            "Gray",
            "Green",
            "Blue"
        ]
    };

    var polarArea = new Chart(ctx, {
        data: data,
        type: 'polarArea',
        options: {
            scale: {
                ticks: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
<!-- /Chart.js -->

