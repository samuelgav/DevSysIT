<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="img" value="/resources/img" />

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
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>

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

					<div class="login-box">
						<div class="login-logo">
							<a href="${contextRoot}/home">DEV<b>SYS</b>IT
							</a>
						</div>

						<!-- /.login-logo -->
						<div class="login-box-body">
							<p class="login-box-msg">Inicio de Sesion</p>

							<form action="../../index2.html" method="post">
								<div class="form-group has-feedback">
									<input type="text" class="form-control" placeholder="Email">
									<span class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>
								<div class="form-group has-feedback">
									<input type="password" class="form-control"
										placeholder="Password"> <span
										class="glyphicon glyphicon-lock form-control-feedback"></span>
								</div>
								<div class="row">
									<div class="col-xs-7">
										<div class="checkbox">
											<label> <input type="checkbox"> Remember Me
											</label>
										</div>
									</div>
									<!-- /.col -->
									<div class="col-xs-5">
										<button type="submit"
											class="btn btn-primary btn-raised btn-block btn-flat">Sign
											In</button>
									</div>
									<!-- /.col -->
								</div>
							</form>

							<a href="register.html" class="text-center">Registrar nuevo
								usuario</a>

						</div>
						<!-- /.login-box-body -->
					</div>
					<!-- /.login-box -->

				</section>
			</div>

		</div>
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