<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Section Begin -->
<header class="header-section">
	<div class="container-fluid">
		<div class="inner-header">
			<div class="logo">
				<a href="index.do"><img src="${pageContext.request.contextPath }/bootstrap/img/mainlogo.png" alt=""></a>
			</div>
			<div class="header-right">
				<img src="${pageContext.request.contextPath }/bootstrap/img/icons/man.png" alt=""> <a href="#"> 
				<img src="${pageContext.request.contextPath }/bootstrap/img/icons/bag.png" alt=""> <span>2</span>
				</a>
			</div>
			<c:choose>
				<c:when test="${empty id }">
					<div class="user-access">
						<a href="memberJoinForm.do">Register</a> <a href="memberLoginForm.do" class="in">Sign in</a>
					</div>			
				</c:when>
				<c:otherwise>
					<div class="user-access">
						<a href="">${id }</a> <a href="memberLoginOut.do" class="in">Logout</a>
					</div>			
				</c:otherwise>
			</c:choose>
			<nav class="main-menu mobile-menu">
				<ul>
					<li><a class="active" href="lookbook.do">NEW SEASON</a></li>
					<li><a href="#!">Shop</a>
						<ul class="sub-menu">
							<li><a href="productList.do">Shop All</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a href="productOuterList.do">Outer</a></li>
							<li><a href="productTopList.do">Top</a></li>
							<li><a href="productBottomList.do">Bottom</a></li>
							<li><a href="productAccList.do">Acc</a></li>
						</ul></li>
					<li><a href="./product-page.html">Notice</a></li>
					<li><a href="./check-out.html">Q&#38;A</a></li>
				</ul>
			</nav>
		</div>
	</div>
</header>