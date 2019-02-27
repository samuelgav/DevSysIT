<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${img}/user-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${userModel.fullName}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MAIN NAVIGATION</li>
        
        <li id="home">
          <a href="${contextRoot}/home">
            <i class="fa fa-home"></i> <span>Inicio</span>            
          </a>
        </li>
        
       <li id="productos" class="treeview">
          <a href="">
            <i class="fa fa-table"></i> <span>Productos</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li id="listProducts"><a href="${contextRoot}/show/all/products"><i class="fa fa-circle-o"></i>Todos</a></li>
            <c:forEach items="${categories}" var="category">
            <li id="a_${category.id}">
            	<a href="${contextRoot}/show/category/${category.id}/products" id="a_${category.name}"><i class="fa fa-circle-o"></i>${category.name}</a>
            </li>
            </c:forEach>
          </ul>
        </li>
        
        <security:authorize access="hasAuthority('ADMIN')">
	        <li id="manageProduct">
	          <a href="${contextRoot}/manage/product">
	            <i class="fa fa-desktop"></i> <span>Admin Product</span>            
	          </a>
	        </li>
        </security:authorize>
        
        </ul>
    </section>
    <!-- /.sidebar -->
  </aside>