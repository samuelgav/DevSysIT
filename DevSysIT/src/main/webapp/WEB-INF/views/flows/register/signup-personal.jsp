<%@include file="../shared/flows-header.jsp" %>
			
			<div class="container">

				<!-- Main content -->
				<section class="content">
						<div class="register-box">
						  <div class="register-logo">
						    <a href="${flowExecutionUrl}&_eventId_home">DEV<b>SYS</b>IT</a>
						  </div>
						
						  <div class="register-box-body">
						    <p class="login-box-msg">Registrar nuevo miembro</p>
						
						    <form action="../../index.html" method="post">
						      <div class="form-group has-feedback">
						        <input type="text" class="form-control" placeholder="Full name">
						        <span class="glyphicon glyphicon-user form-control-feedback"></span>
						      </div>
						      <div class="form-group has-feedback">
						        <input type="email" class="form-control" placeholder="Email">
						        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
						      </div>
						      <div class="form-group has-feedback">
						        <input type="password" class="form-control" placeholder="Password">
						        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
						      </div>
						      <div class="form-group has-feedback">
						        <input type="password" class="form-control" placeholder="Retype password">
						        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
						      </div>
						      <div class="row">
						        <div class="col-xs-7">
						          <div class="checkbox">
						            <label>
						              <input type="checkbox"> I agree to the <a href="#">terms</a>
						            </label>
						          </div>
						        </div>
						        <!-- /.col -->
						        <div class="col-xs-5">
						          <button type="submit" class="btn btn-primary btn-raised btn-block btn-flat">Register</button>
						        </div>
						        <!-- /.col -->
						      </div>
						    </form>
						  </div>
						  <!-- /.form-box -->
						</div>
						<!-- /.register-box -->
					
				</section>
			</div>
<%@include file="../shared/flows-footer.jsp" %>