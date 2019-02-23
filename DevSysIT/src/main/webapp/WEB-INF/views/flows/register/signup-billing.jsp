<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../shared/flows-header.jsp"%>

<div class="container">

	<!-- Main content -->
	<section class="content">
			<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Registro de Direccion</h3>
					</div>					
						<sf:form id="registerForm" method="post" modelAttribute="billing" >
							<div class="box-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="addressLineOne">Direccion Uno</label> 
											<sf:input type="text" path="addressLineOne" class="form-control"
											placeholder="Ingrese Direccion Uno" />
											<sf:errors path="addressLineOne" cssClass="help-block" element="em"/>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="addressLineTwo">Direccion Dos</label> 
											<sf:input type="text" path="addressLineTwo" class="form-control"
											placeholder="Ingrese Direccion Dos" />
											<sf:errors path="addressLineTwo" cssClass="help-block" element="em"/>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="city">Ciudad</label> 
											<sf:input type="text" path="city" class="form-control"
											placeholder="Ingrese Ciudad" />
											<sf:errors path="city" cssClass="help-block" element="em"/>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="postalCode">Codigo Postal</label> 
											<sf:input type="text" path="postalCode" class="form-control"
											placeholder="XXXXXX" />
											<sf:errors path="postalCode" cssClass="help-block" element="em"/>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="state">Estado</label>
											<sf:input type="text" path="state" class="form-control"
											placeholder="Ingrese Nombre de Estado" />
											<sf:errors path="state" cssClass="help-block" element="em"/>											 
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="country">Pais</label>
											<sf:input type="text" path="country" class="form-control"
											placeholder="Ingrese Nombre de pais" />
											<sf:errors path="country" cssClass="help-block" element="em"/>											 
										</div>
									</div>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="submit" name="_eventId_personal" class="btn btn-primary">
										<span class="glyphicon glyphicon-chevron-left"></span> Back - Personal
								</button>								
								<button type="submit" name="_eventId_confirm" class="btn btn-primary">
										Next - Confirm<span class="glyphicon glyphicon-chevron-right"></span>
								</button>
							</div>
						</sf:form>					
				</div>
			
	</section>

</div>

<%@include file="../shared/flows-footer.jsp"%>