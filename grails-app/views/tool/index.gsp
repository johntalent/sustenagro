<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>SustenAgro - Tool</title>
		<asset:stylesheet href="bootstrap-table.min.css"/>
		<asset:javascript src="bootstrap-table.min.js"/>
        <!--
        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
        <script type="text/javascript" src="http://mbostock.github.com/d3/d3.js"></script>
        -->
	</head>
	<body>
		<div class="row main">
			<div id="content" class="col-sm-10 col-sm-offset-1 content">
				<div class="section">
					<h5 class="text-primary">${name}</h5>
					<div class="aling-ol">
						${raw(description)}
					</div>
				</div>

				<div class="section">
					<h5 class="text-primary">Selecionar unidade produtiva</h5>
					<form id="select_production_units" action="/tool/selectProductionUnit" method="post" class="form-horizontal" >
						<div class="form-group">
							<label for="production_unit_id" class="col-sm-4 control-label">Unidade produtiva</label>
							<div class="col-sm-8">
								<select id="production_unit_id" name="production_unit_id" class="form-control">
									<option selected disabled hidden value=''></option>
									<g:each in="${production_units}">
										<option value="${it.id}">${it.label}</option>
									</g:each>
								</select>
							</div>
						</div>
                        <div id="evaluations_list" class="form-group">

                        </div>
                        <div class="form-group col-sm-12 text-center">
                            <input id="evaluation_query" type="submit" class="btn btn-primary" value="Seleccionar" disabled/>
                        </div>
                    </form>
				</div>
                <g:render template="create_production_unit" />
			</div>
		</div>
		<script type="text/javascript">
			$('#production_unit_id').change( function(){
				$.post(
						'/tool/selectEvaluations',
						{'production_unit_id':  this.value},
						function( data ) {
                            $('#evaluations_list').html(data);
                            $('#evaluations_list table').bootstrapTable()
                            $('#evaluation_query').prop('disabled', false);
                        }
				);
			});
		</script>
	</body>
</html>