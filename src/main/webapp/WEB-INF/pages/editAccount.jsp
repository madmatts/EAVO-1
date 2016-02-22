<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<tiles:insertDefinition name="dashboard">
    <tiles:putAttribute name="body">
        <div class="col-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">Account edition</div>
                <div class="panel-body">
                    <div class="col-sm-6 col-sm-offset-3 text-center">
                        <form role="form">
                            <div class="form-group">
                                <label for="login">Login</label>
                                <input class="form-control " id="login" value="Matts" disabled="disabled" type="text">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input class="form-control" id="email" placeholder="Change email" type="email">
                            </div>
                            <button type="submit" class="btn btn-primary">Edit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
