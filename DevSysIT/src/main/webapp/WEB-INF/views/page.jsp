<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css"/>
<spring:url var="js" value="/resources/js"/>
<spring:url var="img" value="/resources/img"/>

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>DevSysIT | ${title}</title>
  <script>
	  window.menu = '${title}';	
	  window.contextRoot = '${contextRoot}';	  
  </script>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${css}/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${css}/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${css}/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="${css}/dataTables.bootstrap.min.css">  
  
  <!-- Select2 -->
  <link rel="stylesheet" href="${css}/select2.min.css">
  
  
  <!-- Theme style -->
  <link rel="stylesheet" href="${css}/AdminLTE.min.css">
  <!-- Material Design -->
  <link rel="stylesheet" href="${css}/bootstrap-material-design.min.css">
  <link rel="stylesheet" href="${css}/ripples.min.css">
  <link rel="stylesheet" href="${css}/MaterialAdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${css}/all-md-skins.min.css">  
  
  <link rel="stylesheet" href="${css}/myapp.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
	
	<%@include file="../shared/header.jsp" %>
  	
  	<!-- Left side column. contains the logo and sidebar -->
  	<%@include file="../shared/sidebar.jsp" %>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    		
    		<c:if test="${userClickHome == true}">
	        	<%@include file="home.jsp" %>
	        </c:if>
	        
	        <!-- Load only when user clicks about -->
			<c:if test="${userClickAbout == true }">
				<%@include file="about.jsp"%>
			</c:if>

			<!-- Load only when user clicks contact -->
			<c:if test="${userClickContact == true }">
				<%@include file="contact.jsp"%>
			</c:if>
	        
	        <c:if test="${userClickAllProducts == true or userClickCategoryProducts == true }">
				<%@include file="listProducts.jsp"%>
			</c:if>
			
			<!-- Load only when user clicks show product -->
			<c:if test="${userClickShowProduct == true}">
				<%@include file="singleProduct.jsp"%>
			</c:if>
			
			<!-- Load only when user clicks manage product -->
			<c:if test="${userClickManageProduct == true}">
				<%@include file="manageProduct.jsp"%>
			</c:if>
			
			
			
  </div>
  <!-- /.content-wrapper -->
  
  <%@include file="../shared/footer.jsp" %>

  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->

<!-- jQuery 3 -->
<script src="${js}/jquery.min.js"></script>

<script src="${js}/jquery.validate.js"></script>

<!-- jQuery UI 1.11.4 -->
<script src="${js}/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="${js}/bootstrap.min.js"></script>
<!-- Material Design -->
<script src="${js}/material.min.js"></script>
<script src="${js}/ripples.min.js"></script>
<script>
    $.material.init();
</script>
<!-- Select2 -->
<script src="${js}/select2.full.min.js"></script>
<!-- DataTables -->
<script src="${js}/jquery.dataTables.min.js"></script>
<script src="${js}/dataTables.bootstrap.min.js"></script>
<!-- DataTable Bootstrap Script -->
<script src="${js}/bootbox.min.js"></script>
<!-- FastClick -->
<script src="${js}/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${js}/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${js}/demo.js"></script>
<script src="${js}/myapp.js"></script>
</body>
</html>
