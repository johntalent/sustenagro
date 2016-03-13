<g:render template="/widgets/title" model="[text: title]"/>

<form id="select_production_units" action="/tool/selectEvaluationObject" method="post" class="form-horizontal" >
    <div class="form-group">
        <label for="production_unit_id" class="col-sm-4 control-label">${label}</label>
        <div class="col-sm-6">
            <select id="production_unit_id" name="production_unit_id" class="form-control">
                <option selected disabled hidden value=''></option>
                <g:each in="${evaluationObjects}">
                    <option value="${it.id}">${it.label}</option>
                </g:each>
            </select>
        </div>
        <div class="col-sm-2">
            <input id="new_assessment" type="submit" class="btn btn-primary" value="${submitLabel}" disabled/>
        </div>
    </div>
</form>

<div id="assessments_form" class="section">

</div>