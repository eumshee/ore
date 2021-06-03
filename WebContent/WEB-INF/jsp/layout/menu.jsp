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
				<c:choose>
					<c:when test="${!empty id }">
						<a href="memberSelect.do"><img src="${pageContext.request.contextPath }/bootstrap/img/icons/man.png" alt=""></a>
						&nbsp;&nbsp;
					 	<a href="cartList.do"> 
						<img src="${pageContext.request.contextPath }/bootstrap/img/icons/bag.png" alt="">
							<span>${cartCnt }</span>
						</a>
					</c:when>
					<c:otherwise>
					 	<a href=""> 
						<img src="${pageContext.request.contextPath }/bootstrap/img/icons/bag.png" alt=""><span>0</span>
						</a>
					</c:otherwise>
				</c:choose>
			</div>
			<c:choose>
				<c:when test="${empty id }">
					<div class="user-access">
						<a href="memberJoinForm.do">Register</a> <a href="memberLoginForm.do" class="in">Sign in</a>
					</div>			
				</c:when>
				<c:otherwise>
					<div class="user-access">
						<a href="index.do">${id }</a>
						<a href="memberLoginOut.do" class="in">Logout</a>
					</div>			
				</c:otherwise>
			</c:choose>
			<nav class="main-menu mobile-menu" id="nav">
				<ul>
					<li><a class="active" href="lookbook.do">NEW SEASON</a></li>
					<li><a href="productList.do?cate=&sort=new">Shop</a>
						<ul class="sub-menu">
							<li><a href="productList.do?cate=&sort=new">Shop All</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a href="productList.do?cate=O&sort=new">Outer</a></li>
							<li><a href="productList.do?cate=T&sort=new">Top</a></li>
							<li><a href="productList.do?cate=B&sort=new">Bottom</a></li>
							<li><a href="productList.do?cate=A&sort=new">Acc</a></li>
						</ul></li>
					<li><a href="noticeList.do">Notice</a></li>

					<li><a href="qnaList.do">Q&#38;A</a></li>
					<c:if test="${id eq 'admin'}">
						<li><a href="adminList.do">상품관리</a></li>					
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</header>