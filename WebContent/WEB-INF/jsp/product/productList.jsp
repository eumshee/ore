<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList.jsp</title>
</head>
<style>
.pagination {
	display: inline-block;
	margin: auto;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: #212529;
	color: #fff;
	border: 1px solid #212529;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<script>
	function formSubmit(code) {
		cosole.log(code);
		frm.code.value = code;
		frm.submit();
	}
	function goPage(page) {
		location.href = "productList.do?page=" + page + "&cate=${category}&sort=${sort}";
	}
	
	function addCart(itemCode){
		var link = document.location.href; 

 		$.ajax({
			url: '${pageContext.request.contextPath }/addCart.do',
			data: {
				id: '${id }', 
				itemCode: itemCode
			},
			success: function (result){
				console.log(result);
				location.href=link;
			},
			error: function (err){
				console.log(err);
			}
		});
	};

	function sortby(sort) {
		location.href = "productList.do?cate=${category}&sort=" + sort;
	}
</script>
<body>
	<form id="frmInput" action="addCart.do">
		<input type="hidden" id="itemCode" name="itemCode">
		<input type="hidden" id="id" name="id" value="${id }">
	</form>
	<!-- Categories Page Section Begin -->
	<section class="categories-page spad">
		<div class="container">
			<c:choose>
				<c:when test="${category eq 'O' }">
				<h1>Outer</h1>
				</c:when>
				<c:when test="${category eq 'T' }">
				<h1>Top</h1>
				</c:when>
				<c:when test="${category eq 'B' }">
				<h1>Bottom</h1>
				</c:when>
				<c:when test="${category eq 'A' }">
				<h1>Acc</h1>
				</c:when>
				<c:otherwise>
				<h1>Shop ALL</h1>
				</c:otherwise>
			</c:choose>
			<br>
			<form id="frm" action="productSelect.do" method="post">
				<input type="hidden" id="code" name="code">
			</form>
			<div class="categories-controls">
				<div class="row">
					<div class="col-lg-12">
						<div class="categories-filter">
							<div class="cf-left">
								<form action="#">
									<select class="sort" onchange="sortby(this.value)">
										<option value="">Sort by</option>
										<option value="new">Newest</option>
										<option value="lowest">Lowest Price</option>
										<option value="highest">Highest Price</option>
										<option value="name">Name</option>
									</select>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<c:forEach items="${ProductList }" var="vo">
					<div class="col-lg-4 col-md-6">
						<div class="single-product-item" >
							<figure>
								<img src="${pageContext.request.contextPath }/bootstrap/img/product/${vo.itemImg}"
									alt="">
									<div class="hover-icon">
                                        <a href="productSelect.do?code=${vo.itemCode }"><img
                                                src="${pageContext.request.contextPath }/bootstrap/img/icons/zoom-plus.png" alt=""></a>
                                                </div>
								</figure>
							<div class="product-text text-center">
								<a href="productSelect.do?code=${vo.itemCode }"><p>${vo.itemName }</p></a>
								<h6><fmt:formatNumber value="${vo.itemPrice }"/></h6>
								<c:choose>
									<c:when test="${vo.itemStock eq 0 }">
										<p>Out of stock</p>
									</c:when>
									<c:otherwise>
										<span class="btn btn-outline-dark mt-auto"
											onclick="addCart('${vo.itemCode }')">Add to cart</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<br>
						<br>
					</div>
				</c:forEach>
			</div>
			<br>
			<br>
			<div class="col-lg-12 text-center">
				<jsp:include page="../common/paging.jsp" flush="true">
					<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
					<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
					<jsp:param name="startPageNo" value="${paging.startPageNo}" />
					<jsp:param name="pageNo" value="${paging.pageNo}" />
					<jsp:param name="endPageNo" value="${paging.endPageNo}" />
					<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
					<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
				</jsp:include>
			</div>
		</div>
	</section>
</body>
</html>