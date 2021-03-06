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

.td-left td 
	{
	text-align: left;
	}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

	document.addEventListener('keydown', function(event) {
	    if (event.keyCode === 13) {
	        event.preventDefault();
	    }
	}, true);

	function cartUpdate(qty, code) {
		var uid = frm.uid.value;
		console.log(uid);
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
	
	function placeOrder() {
		swal({
			text : "주문이 정상적으로 처리되었습니다.",
		   	icon  : "success",
		   	closeOnClickOutside : false,
		}).then(function(){
		var sum = $('#spansum').text();
		orderForm.totalsum.value = sum;
		orderForm.submit();
	});
	}
	
</script>
</head>
<body>
	<!-- 카트 리스트 보여주는 영역 -->
	<form id="frms" action="productSelect.do" method="post">
		<input type="hidden" id="code" name="code">
	</form>
	<form id="frmDel" action="cartDelete.do" method="post">
		<input type="hidden" id="itemCd" name="itemCd">
	</form>
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
									<!-- 카트 아이템 1건씩 반복출력 영역 -->
								<form id="frm" action="cartUpdate.do" method="post">
									<input type="hidden" id="itemCode" name="itemCode"> 
									<input type="hidden" id="itemQty" name="itemQty">
									<input type="hidden" id="uid" name="uid" value="${id }">
									<c:forEach items="${clist }" var="vo">
										<tr>
											<td class="product-col" onclick="formSelect('${vo.itemCode}')">
												<img width="100" height="150"
												src="${pageContext.request.contextPath }/bootstrap/img/product/${vo.itemImg}"
												alt="">
												<div class="p-title">
													<h5>${vo.itemName }</h5>
												</div>
											</td>
											<td class="price-col">
												<fmt:formatNumber value="${vo.itemPrice}" />
											</td>
											<td>
												<input type="number" min="1" max="99" id="qty"
												name="qty" style="width: 3em; text-align: center;"
												value="${vo.itemQty }" onclick="cartUpdate($(this).val(), '${vo.itemCode}')">
												<button class="btn btn-outline-dark mt-auto" type="submit">수정</button>
											</td>
											<td class="total">
												<fmt:formatNumber value="${vo.itemQty * vo.itemPrice}" />
											</td>
											<td class="product-close">
												<button class="btn btn-outline-dark mt-auto" type="button"
													onclick="cartDelete('${vo.itemCode}')">삭제</button>
											</td>
											<c:set var="sum" value="${sum + vo.itemQty * vo.itemPrice}">
											</c:set>
										</tr>
									</c:forEach>
								</form>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<hr>
			</div>

		</div>
	
		<div class="order">
			<div class="container">
				<div class="col-lg-12">
					<div class="order-info">
						<br> <br> <br>
						<h4>Order</h4>
						<br>
						<form id="orderForm" action="ordersInsert.do" method="post">
						 <input type="hidden" id="totalsum" name="totalsum" value="">
 							<table class="table td-left">
								<tr>
									<th width="200"><label for="name">받으시는 분</label></th>
									<td><input type="text" name="name" id="name" required="required"></td>
								</tr>
								<tr>
									<th><label for="addr">주소</label></th>
									<td><input type="text" name="addr" id="addr" size="50" required="required"></td>
								</tr>
								<tr>
									<th><label for="tel">연락처</label></th>
									<td><input type="text" name="tel" id="tel" required="required"></td>
								</tr>
								<tr>
									<th><label for="mail">이메일</label></th>
									<td><input type="text" name="mail" id="mail" size="50" required="required"></td>
								</tr>
								<tr>
									<th><label for="msg">주문 메시지</label></th>
									<td><textarea name="msg" id="msg" cols="55"></textarea></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			<div class="shopping-method">
				<div class="container">
					<div class="col-lg-12">
						<div class="shipping-info">
							<h4>Shipping</h4><br>
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
														<span id="spansum"><fmt:formatNumber value="${sum}" /></span>
													</c:when>
													<c:otherwise>
														<span id="spansum"><fmt:formatNumber value="${sum + 3000}" /></span>
													</c:otherwise>
												</c:choose>
											<td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="row">
								<div class="col-lg-12 text-right">
									<button onClick="placeOrder()" class="primary-btn chechout-btn">Place Order</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- Cart Page Section End -->
</body>
</html>