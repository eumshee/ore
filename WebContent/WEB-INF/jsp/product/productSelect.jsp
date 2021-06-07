<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productSelect.jsp</title>
<style>
th, td {
	text-align: center;
}

a {
	text-decoration: none;
	outline: none;
	color: #000;	
}

a:hover,
a:focus {
	text-decoration: none;
	outline: none;
	color: #000;
}

</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
		function formSubmit(id, writer, name, img, code) {
			frms.id.value = id;
			frms.writer.value = writer;
			frms.name.value = '${product.itemName}';
			frms.img.value = '${product.itemImg}';
			frms.code.value = '${product.itemCode}';
			frms.submit();
		}
		
		function addCart(itemCode){
	 		$.ajax({
				url: '${pageContext.request.contextPath }/addCart.do',
				data: {
					id: '${id }', 
					itemCode: itemCode,
					qty: $('#qty').val()
				},
				success: function (result){
					eventsuccess();
				},
				error: function (err){
					console.log(err);
				}
			});
		};

		function eventsuccess() {
			swal({
				text : $('#qty').val() + "개가 장바구니에 추가되었습니다.",
			   	icon  : "success",
			   	closeOnClickOutside : false,
			}).then(function(){
			var link = document.location.href; 
				location.href=link;
			});
		}
		
		function frmSubmit(writer,code) {
			rvfrm.writer.value = writer;
			rvfrm.code.value = code;
			rvfrm.submit();
		}
	</script>
</head>
<body>
	<form id="frms" action="qnaSelect.do" method="post">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="writer" name="writer">
		<input type="hidden" id="name" name="name">
		<input type="hidden" id="img" name="img">
		<input type="hidden" id="code" name="code">
	</form>
	<form id="rvfrm" action="reviewSelect.do" method="post">
		<input type="hidden" id="writer" name="writer">
		<input type="hidden" id="code" name="code">
	</form>
	<!-- Product Page Section Beign -->
	<section class="product-page">
		<div class="container">
			<div class="product-control">
				<br> <a href="productList.do?cate=&sort=new"><h5>Shop</h5></a>＞
				<!-- small nav 영역 -->
				<c:choose>
					<c:when test="${fn:startsWith(product.itemCode, 'O')}">
						<a href="productList.do?cate=O&sort=new"><h5>Outer</h5></a>
					</c:when>
					<c:when test="${fn:startsWith(product.itemCode, 'T')}">
						<a href="productList.do?cate=T&sort=new"><h5>Top</h5></a>
					</c:when>
					<c:when test="${fn:startsWith(product.itemCode, 'B')}">
						<a href="productList.do?cate=B&sort=new"><h5>Bottom</h5></a>
					</c:when>
					<c:when test="${fn:startsWith(product.itemCode, 'A')}">
						<a href="productList.do?cate=A&sort=new"><h5>Acc</h5></a>
					</c:when>
				</c:choose>
			</div>
			<!-- 제품 정보 출력 -->
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
							<h4>
								<fmt:formatNumber value="${product.itemPrice }" />
							</h4>
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
									<c:otherwise>
										Basic Collection
									</c:otherwise>

								</c:choose></li>
						</ul>
						<c:choose>
							<c:when test="${product.itemStock eq 0 }">
								<h5>Out of stock</h5>
							</c:when>
							<c:otherwise>
								<div class="product-quantity">
									<div class="pro-qty">
										<input type="text" id="qty" value="1">
									</div>
								</div>
								<button type="button" onclick="addCart('${product.itemCode }')" class="primary-btn pc-btn">Add to cart</button>
							</c:otherwise>
						</c:choose>

						<ul class="p-info">
							<li><a href="#info">Product Information</li>
							<li><a href="#qna">Q&A</a></li>
							<li><a href="#review">Reviews</a></li>
						</ul>
					</div>
				</div>
				<a name="info"><img src="${pageContext.request.contextPath }/bootstrap/img/product/policy.jpg" alt=""></a>
				
				<!-- QNA 영역 -->
				<div class="col-lg-12 text-center">
					<a name="qna"><h4>Q&A</h4></a>
					<div style="padding: 1.5em;">
						<table class="table">
							<tr>
								<th>NO.</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>DATE</th>
							</tr>
							<c:choose>
								<c:when test="${!empty qnaList }">
									<c:forEach items="${qnaList }" var="vo">
										<tr onclick="formSubmit(${vo.id},'${vo.writer}', '${product.itemImg}', '${product.itemName}')">
											<td width="100">${vo.id }</td>
											<td width="300">${vo.title } <span style="font-size: 10pt; color: lightgray;">(${vo.commentCnt })</span></td>
											<td width="100">${vo.writer }</td>
											<td width="150">${vo.regDate }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">작성된 게시글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						<br><br><br>
					</div>
				</div>

				<!-- 리뷰 영역 -->
				<div class="col-lg-12 text-center">
					<a name="review"><h4>Review</h4></a>
					<div style="padding: 1.5em;">
						<table class="table">
							<tr>
								<th>NO.</th>
								<th>TITLE</th>
								<th>SCORE</th>
								<th>WRITER</th>
								<th>DATE</th>
							</tr>
							<c:choose>
								<c:when test="${!empty reviewList }">
									<c:forEach items="${reviewList }" var="vo">
										<tr>
											<td width="50" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">${vo.reviewNum }</td>
											<td width="300" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">${vo.reviewTitle }</td>
											<td width="150" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">
												<div class="rating">
												<c:forEach begin="1" end="${vo.reviewScore }">
												<i class="fa fa-star" style="color: #fff000;"></i>
												</c:forEach>
												</div>
											</td>
											<td width="100" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">${vo.userId }</td>
											<td width="100" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">${vo.reviewDate }</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">작성된 게시글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
					<br><br>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Page Section End -->

</body>
</html>