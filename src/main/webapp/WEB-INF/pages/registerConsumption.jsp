<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">Consumption registration</div>
                <div class="panel-body">
                    <div class="col-sm-12">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="date" class="col-lg-3 text-center">Date</label>
                                <label for="volume" class="col-lg-2 text-center">Volume</label>
                                <label for="cost" class="col-lg-2 text-center">Cost</label>
                                <label for="cost" class="col-lg-3 text-center">Fuel station</label>
                                <label for="cost" class="col-lg-2 text-center">Fuel type</label>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-3">
                                    <input class="form-control" id="date" placeholder="DD/MM/YYYY" type="date">
                                </div>
                                <div class="col-lg-2">
                                    <input class="form-control" id="volume" placeholder="Volume" type="text">
                                </div>
                                <div class="col-lg-2">
                                    <input class="form-control" id="cost" placeholder="Cost" type="text">
                                </div>
                                <div class="col-lg-3">
                                    <input class="form-control" id="cost" placeholder="Fuel station" type="text">
                                </div>
                                <div class="col-lg-2">
                                    <select class="form-control selectpicker">
                                        <option>Gasoline</option>
                                        <option>Oil</option>
                                        <option>Gas</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-4 text-center">
                                    <button type="submit" class="btn btn-success">Register consumption</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
