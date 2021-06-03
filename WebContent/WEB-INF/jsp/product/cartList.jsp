<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product/cartList.jsp</title>
<style>
th, td {
	text-align: center;
	vertical-align: middle !important;
}
</style>
<script>
	function cartUpdate(qty, code) {
		console.log(code);
		console.log(qty);
		frm.itemQty.value = qty;
		frm.itemCode.value = code;
	}

	function formSelect(code) {
		frms.code.value = code;
		frms.submit();
	}

	function cartDelete(code) {
		frmDel.itemCd.value = code;
		frmDel.submit();
	}
	
</script>
</head>
<body>
	<!-- Cart Page Section Begin -->
	<form id="frms" action="productSelect.do" method="post">
		<input type="hidden" id="code" name="code">
	</form>
	<form id="frmDel" action="cartDelete.do" method="post">
		<input type="hidden" id="itemCd" name="itemCd">
	</form>
	<form id="frm" action="cartUpdate.do" method="post">
		<input type="hidden" id="itemCode" name="itemCode"> <input
			type="hidden" id="itemQty" name="itemQty">
		<div class="cart-page">
			<div class="container">
				<h1>Cart</h1>
				<br>
				<div class="cart-table">
					<table>
						<thead>
							<tr>
								<th class="product-h">Product</th>
								<th>Price</th>
								<th class="quan">Quantity</th>
								<th>Total</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:set var="sum" value="0">
							</c:set>
							<c:choose>
								<c:when test="${empty clist }">
									<td colspan="5"><p>장바구니가 비어있습니다.</p></td>
								</c:when>
								<c:otherwise>
									<c:forEach items="${clist }" var="vo">
										<tr>
											<td class="product-col"  onclick="formSelect('${vo.itemCode}')">
											<img width="100" height="150"
												src="${pageContext.request.contextPath }/bootstrap/img/product/${vo.itemImg}"
												alt="">
												<div class="p-title">
													<h5>${vo.itemName }</h5>
												</div></td>
											<td class="price-col"><fmt:formatNumber
													value="${vo.itemPrice}" /></td>
											<td><input type="number" min="1" max="99" id="qty"
												name="qty" style="width: 3em; text-align: center;"
												value="${vo.itemQty }"
												onclick="cartUpdate($(this).val(), '${vo.itemCode}')">
												<button class="btn btn-outline-dark mt-auto" type="submit">수정</button>
											</td>
											<td class="total"><fmt:formatNumber
													value="${vo.itemQty * vo.itemPrice}" /></td>
											<td class="product-close">
												<button class="btn btn-outline-dark mt-auto" type="button"
													onclick="cartDelete('${vo.itemCode}')">삭제</button>
											</td>
											<c:set var="sum" value="${sum + vo.itemQty * vo.itemPrice}">
											</c:set>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="shopping-method">
				<div class="container">
					<div class="col-lg-12">
						<div class="shipping-info">
							<h5>Shipping</h5>
							<div class="chose-shipping">
								<c:choose>
									<c:when test="${sum >= 200000}">
										<div class="cs-item">
											<label>일반배송</label>
										</div>
										<div class="cs-item">
											<label class="active"> 20만원 이상 무료배송 </label>
										</div>
									</c:when>
									<c:otherwise>
										<div class="cs-item">
											<label class="active">일반배송</label>
										</div>
										<div class="cs-item">
											<label> 20만원 이상 무료배송 </label>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<div class="total-info">
							<div class="total-table">
								<table>
									<thead>
										<tr>
											<th>Total</th>
											<th>Shipping</th>
											<th>Total Cart</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="total"><fmt:formatNumber value="${sum}" /></td>
											<td class="shipping"><c:choose>
													<c:when test="${sum >= 200000}">
															Free
														</c:when>
													<c:otherwise>
														<fmt:formatNumber value="3000" />
													</c:otherwise>
												</c:choose></td>
											<td><c:choose>
													<c:when test="${sum >= 200000}">
														<fmt:formatNumber value="${sum}" />
													</c:when>
													<c:otherwise>
														<fmt:formatNumber value="${sum + 3000}" />
													</c:otherwise>
												</c:choose>
											<td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-lg-12 text-right">
									<a href="#" class="primary-btn chechout-btn">Proceed to
										checkout</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Cart Page Section End -->
</body>
</html>