<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Section Begin -->
<header class="header-section">
	<div class="container-fluid">
		<div class="inner-header">
			<div class="logo">
				<a href="./index.html"><img src="${pageContext.request.contextPath }/bootstrap/img/mainlogo.png" alt=""></a>
			</div>
			<div class="header-right">
				<img src="${pageContext.request.contextPath }/bootstrap/img/icons/man.png" alt=""> <a href="#"> 
				<img src="${pageContext.request.contextPath }/bootstrap/img/icons/bag.png" alt=""> <span>2</span>
				</a>
			</div>
			<div class="user-access">
				<a href="#">Register</a> <a href="#" class="in">Sign in</a>
			</div>
			<nav class="main-menu mobile-menu">
				<ul>
					<li><a class="active" href="./index.html">NEW SEASON</a></li>
					<li><a href="#!">Shop</a>
						<ul class="sub-menu">
							<li><a href="product-page.html">Shop All</a></li>
							<li><a href="shopping-cart.html">Outer</a></li>
							<li><a href="check-out.html">Top</a></li>
							<li><a href="check-out.html">Bottom</a></li>
							<li><a href="check-out.html">Acc</a></li>
						</ul></li>
					<li><a href="./product-page.html">Notice</a></li>
					<li><a href="./check-out.html">Q&#38;A</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>