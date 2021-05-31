<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productSelect.jsp</title>
</head>
<body>
	<!-- Product Page Section Beign -->
	<section class="product-page">
		<div class="container">
			<div class="product-control">
				<br> <a href="productList.do"><h5>Shop</h5></a>＞
				<c:choose>
					<c:when test="${fn:startsWith(product.itemCode, 'O')}">
						<a href="productOuterList.do"><h5>Outer</h5></a>
					</c:when>
					<c:when test="${fn:startsWith(product.itemCode, 'T')}">
						<a href="productTopList.do"><h5>Top</h5></a>
					</c:when>
					<c:when test="${fn:startsWith(product.itemCode, 'B')}">
						<a href="productBottomList.do"><h5>Bottom</h5></a>
					</c:when>
					<c:when test="${fn:startsWith(product.itemCode, 'A')}">
						<a href="productAccList.do"><h5>Acc</h5></a>
					</c:when>
				</c:choose>
			</div>
			<div class="row">
				<div class="col-lg-6">
					<div class="product-slider owl-carousel">
						<div class="product-img">
							<figure>
								<img
									src="${pageContext.request.contextPath }/bootstrap/img/product/${product.itemImg}"
									alt="">
							</figure>
						</div>
					</div>

				</div>
				<div class="col-lg-6">
					<div class="product-content">
						<h2>${product.itemName }</h2>
						<div class="pc-meta">
							<h4><fmt:formatNumber value="${product.itemPrice }"/></h4>
						</div>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Quis ipsum suspendisse ultrices gravida. Risus commodo
							viverra maecenas accumsan lacus vel facilisis.</p>
						<ul class="tags">
							<li><span>Season :</span> <c:choose>
									<c:when test="${fn:contains(product.itemDate, '11')}">
										2020 Winter Drop
									</c:when>
									<c:when test="${fn:contains(product.itemDate, '03')}">
										2021 Spring Drop
									</c:when>
									<c:when test="${fn:contains(product.itemDate, '05')}">
										2021 Summer Drop
									</c:when>
								</c:choose></li>
						</ul>
						<c:choose>
							<c:when test="${product.itemStock eq 0 }">
								<h5>Out of stock</h5>
							</c:when>
							<c:otherwise>
								<div class="product-quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
								<a href="#" class="primary-btn pc-btn">Add to cart</a>
							</c:otherwise>
						</c:choose>

						<ul class="p-info">
							<li>Product Information</li>
							<li>Reviews</li>
							<li>Product Care</li>
						</ul>
					</div>
				</div>
				<img
					src="${pageContext.request.contextPath }/bootstrap/img/product/policy.jpg"
					alt="">
				<div class="col-lg-12 text-center">
					<h4>Q&A</h4>
					여기에 게시판 영역
				</div>
			</div>
		</div>
	</section>
	<!-- Product Page Section End -->

</body>
</html>