<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../shared/flows-header.jsp"%>

<div class="container">

	<!-- Main content -->
	<section class="content">

			
				<div class="box box-default">
					<div class="box-header with-border">
						<h3 class="box-title">Registro de nuevo miembro</h3>
					</div>					
						<sf:form id="registerForm" method="post" modelAttribute="user" >
							<div class="box-body">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="firstName">Nombres</label> 
											<sf:input type="text" path="firstName" class="form-control" placeholder="Nombres" />
											<sf:errors path="firstName" cssClass="help-block" element="em"/> 
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="lastName">Apellidos</label> 
											<sf:input type="text" path="lastName" class="form-control" placeholder="Apellidos" />
											<sf:errors path="lastName" cssClass="help-block" element="em"/>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="email">Email</label> 
											<sf:input type="text" path="email" class="form-control" placeholder="Email" />
											<sf:errors path="email" cssClass="help-block" element="em"/> 
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="contactNumber">Numero de Contacto</label> 
											<sf:input type="text" path="contactNumber" class="form-control" placeholder="Numero de Contacto" />
											<sf:errors path="contactNumber" cssClass="help-block" element="em"/> 
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="role">Rol</label>
											<sf:select path="role" class="form-control select2" style="width: 100%;">
													<sf:option value="USER">User</sf:option>
													<sf:option value="SUPPLIER">Supplier</sf:option>
											</sf:select>											 
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="password">Password</label> 
											<sf:input type="password" path="password" class="form-control" placeholder="Password" />
											<sf:errors path="password" cssClass="help-block" element="em"/> 
										</div>
									</div>
								</div>
								
								<div class="row">
									
									<div class="col-md-6">
										<div class="form-group">
											<label for="confirmPassword">Confirmar Password</label> 
											<sf:input type="password" path="confirmPassword" class="form-control" placeholder="Confirmar Password" />
											<sf:errors path="confirmPassword" cssClass="help-block" element="em"/> 
										</div>
									</div>
								</div>
								
								
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="submit" class="btn btn btn-info pull-right" 
						          name="_eventId_billing" >
						          Siguiente - Compras <span class="glyphicon glyphicon-chevron-right"></span> 
						          </button>
							</div>
						</sf:form>					
				</div>
				
	</section>
</div>
<%@include file="../shared/flows-footer.jsp"%>