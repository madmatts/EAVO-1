<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-9 pull-right">
            <div class="panel panel-default">
                <div class="panel-heading">Account removal</div>
                <div class="panel-body">
                    <div class="col-sm-6 col-sm-offset-3 text-center">
                        <form role="form">
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input class="form-control" id="password" placeholder="Password" type="password">
                            </div>
                            <div class="form-group">
                                <label for="confirm">Password confirmation</label>
                                <input class="form-control" id="confirm" placeholder="Password confirmation"
                                       type="password">
                            </div>
                            <button type="submit" class="btn btn-danger">Remove</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
