<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">Refuel registration</div>
                <div class="panel-body">
                    <div class="col-sm-12">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <div class="col-lg-3">
                                    <label for="date" class="text-center">Date</label>
                                    <input class="form-control input-sm" id="date" placeholder="DD/MM/YYYY" type="date">
                                </div>
                                <div class="col-lg-2">
                                    <label for="volume" class="text-center">Volume</label>
                                    <div class="input-group input-group-sm">
                                        <input class="form-control" id="volume" placeholder="Volume" type="text">
                                        <span class="input-group-addon" id="sizing-addon3">Litre</span>
                                    </div>
                                </div>
                                <div class="col-lg-2">
                                    <label for="cost" class="text-center">Cost</label>
                                    <div class="input-group input-group-sm">
                                        <input class="form-control input-sm" id="cost" placeholder="Cost" type="text">
                                        <span class="input-group-addon" id="sizing-addon3"><i class="fa fa-money"></i></span>
                                    </div>
                                </div>
                                <div class="col-lg-3">
                                    <label for="station" class="text-center">Fuel station</label>
                                    <input class="form-control input-sm" id="station" placeholder="Fuel station" type="text">
                                </div>
                                <div class="col-lg-2">
                                    <label for="fuel" class="text-center">Fuel type</label>
                                    <select class="form-control selectpicker input-sm" id="fuel">
                                        <option>Gasoline</option>
                                        <option>Oil</option>
                                        <option>Gas</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4 col-sm-offset-4 text-center">
                                <button type="submit" class="btn btn-success">Register consumption</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
