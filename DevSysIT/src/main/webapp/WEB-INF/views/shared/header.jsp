<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<header class="main-header">
    <!-- Logo -->
    <a href="${contextRoot}/home" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini">D<b>E</b>V</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg">DEV<b>SYS</b>IT</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
	           
	        <li id="about">
	          <a href="${contextRoot}/about">
	            <i class="fa fa-user-plus"></i> <span>Acerca de Nosotros</span>            
	          </a>
	        </li>
	        
	        <li id="contact">
	          <a href="${contextRoot}/contact">
	            <i class="fa fa-phone"></i> <span>Contacto</span>            
	          </a>
	        </li>
	        
	        <security:authorize access="isAnonymous()">
	            <li id="signup">
		            <a href="${contextRoot}/register">Registrarse</a>
		        </li>
				<li id="login">
		             <a href="${contextRoot}/login">Login</a>
		        </li>
	        </security:authorize>
	        
	        
          	<security:authorize access="isAuthenticated()">
	          <li class="dropdown user user-menu">
	            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
	              <img src="${img}/user-160x160.jpg" class="user-image" alt="User Image">
	              <span class="hidden-xs">${userModel.fullName}</span>
	            </a>
	            <ul class="dropdown-menu">
	              <!-- User image -->
	              <li class="user-header">
	               <img src="${img}/user-160x160.jpg" class="img-circle" alt="User Image">               
	                <p>
	                  ${userModel.fullName} - ${userModel.role} 
	                  <small>${userModel.email}</small>
	                </p>
	              </li>
	              
	              <security:authorize access="hasAuthority('USER')">
		              <li class="user-body">
		                <div class="row">
		                  <div class="col-xs-12 text-center">
		                    <a href="${contextRoot}/cart/show">
			                  	<span class="glyphicon glyphicon-shopping-cart"></span>
			               		<span class="badge">${userModel.cart.cartLines}</span>
			               		- $ ${userModel.cart.grandTotal}
		                   </a>
		                  </div>                                    
		                </div>
		                <!-- /.row -->
		              </li>
	              </security:authorize>
	                            
	              <!-- Menu Footer-->
	              <li class="user-footer">
	                <div class="pull-left">
	                  <a href="#" class="btn btn-default btn-flat">Profile</a>
	                </div>
	                <div class="pull-right">
	                  <a href="${contextRoot}/perform-logout" class="btn btn-default btn-flat">Sign out</a>
	                </div>
	              </li>
	            </ul>
	          </li>
          </security:authorize>
        </ul>
      </div>
    </nav>
  </header>
  
  <script>
  	window.userRole='${userModel.role}';
  </script>
