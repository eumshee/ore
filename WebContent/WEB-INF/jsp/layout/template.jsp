<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="description" content="Yoga Studio Template">
    <meta name="keywords" content="Yoga, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>
		<tiles:getAsString name="title"></tiles:getAsString>
	</title>
    <title>Violet | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Amatic+SC:400,700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900&display=swap"
        rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/bootstrap/css/style.css" type="text/css">
  
</head>
<body>
	<tiles:insertAttribute name="menu">
	</tiles:insertAttribute>
	
	<hr>
	<tiles:insertAttribute name="body">
	</tiles:insertAttribute>

	<hr>
	<tiles:insertAttribute name="foot">
	</tiles:insertAttribute>
 <!-- Js Plugins -->
<script src="${pageContext.request.contextPath }/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/jquery.slicknav.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/mixitup.min.js"></script>
<script src="${pageContext.request.contextPath }/bootstrap/js/main.js"></script>
</body>
</html>