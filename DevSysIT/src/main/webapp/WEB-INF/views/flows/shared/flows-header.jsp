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
			<%@include file="flows-navbar.jsp" %>
		</header>

		<div class="content-wrapper">