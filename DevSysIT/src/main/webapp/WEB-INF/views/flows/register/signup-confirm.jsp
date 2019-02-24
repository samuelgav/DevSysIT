<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@include file="../shared/flows-header.jsp"%>

<div class="container">

	<!-- Main content -->
	<section class="content">
			
	<div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Detalles de persona</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            
            <form class="form-horizontal">
              <div class="box-body">
                <div class="form-group">
                  <label class="col-sm-4 control-label">Nombre Completo</label>
                  <div class="col-sm-8">
                    <h4>${registerModel.user.firstName} ${registerModel.user.lastName}</h4>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Email</label>
                  <div class="col-sm-8">
                    <h4>${registerModel.user.email}</h4>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Numero de contacto</label>
                  <div class="col-sm-8">
                    <h4>${registerModel.user.contactNumber}</h4>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Rol</label>
                  <div class="col-sm-8">
                    <h4>${registerModel.user.role}</h4>
                  </div>
                </div>
                
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <a href="${flowExecutionUrl}&_eventId_personal" class="btn btn btn-info pull-right">Edit</a>
              </div>
              <!-- /.box-footer -->
            </form>
        
          </div>
         </div>

		 <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Direccion de envio</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            
            <form class="form-horizontal">
              <div class="box-body">
                <div class="form-group">
                  <label class="col-sm-4 control-label">Direccion Uno</label>
                  <div class="col-sm-8">
                    <h4>${registerModel.billing.addressLineOne}</h4>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Direccion Dos</label>
                  <div class="col-sm-8">
                    <h4>${registerModel.billing.addressLineTwo}</h4>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Ciudad y Codigo Postal</label>
                  <div class="col-sm-8">
                    <h4>${registerModel.billing.city} - ${registerModel.billing.postalCode}</h4>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-4 control-label">Estado y Pais</label>
                  <div class="col-sm-8">
                    <h4>${registerModel.billing.state} - ${registerModel.billing.country}</h4>
                  </div>
                </div>
                
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <a href="${flowExecutionUrl}&_eventId_billing" class="btn btn btn-info pull-right">Edit</a>
              </div>
              <!-- /.box-footer -->
            </form>
            
           </div>
         </div>
         
        </div>
        
        <div class="row">		
			<div class="col-sm-4 col-sm-offset-4">			
				<div class="text-center">				
					<a href="${flowExecutionUrl}&_eventId_submit" class="btn btn-lg bg-olive">Confirm</a>				
				</div>			
			</div>		
		</div>
        
        		
	</section>

</div>

<%@include file="../shared/flows-footer.jsp"%>