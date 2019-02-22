<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>DevSysIT | ${title}</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="${css}/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="${css}/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="${css}/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="${css}/AdminLTE.min.css">
<!-- Material Design -->
<link rel="stylesheet" href="${css}/bootstrap-material-design.min.css">
<link rel="stylesheet" href="${css}/ripples.min.css">
<link rel="stylesheet" href="${css}/MaterialAdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="${css}/all-md-skins.min.css">


<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue layout-top-nav">
	<div class="wrapper">
		<header class="main-header">
			<nav class="navbar navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<a href="${contextRoot}/home" class="navbar-brand">DEV<b>SYS</b>IT
						</a>

					</div>
				</div>
			</nav>
		</header>

		<div class="content-wrapper">
			<div class="container">

				<!-- Main content -->
				<section class="content">
					<div class="error-page">
						<h2 class="headline text-yellow">404</h2>
						<div class="error-content">
							<h3>
								<i class="fa fa-warning text-yellow"></i> ${errorTitle}
							</h3>
							<blockquote style="word-wrap:break-word">
							<p>
								${errorDescription}
							</p>
							</blockquote>		
						</div>
						<!-- /.error-content -->
					</div>
					<!-- /.error-page -->
	           </section>
			</div>

		</div>
		<%@include file="./shared/footer.jsp" %>
	</div>

	<!-- jQuery 3 -->
	<script src="${js}/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="${js}/bootstrap.min.js"></script>
	<!-- Material Design -->
	<script src="${js}/material.min.js"></script>
	<script src="${js}/ripples.min.js"></script>
	<script>
		$.material.init();
	</script>
	<!-- SlimScroll -->
	<script src="${js}/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script src="${js}/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="${js}/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${js}/demo.js"></script>
</body>
</html>