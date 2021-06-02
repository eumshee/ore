<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<form id="frms" action="productSelect.do" method="post">
			<input type="hidden" id="code" name="code">
	</form>
	<form id="frmDel" action="cartDelete.do" method="post">
			<input type="hidden" id="itemCd" name="itemCd">
	</form>
	<div align="center">
		<form id="frm" action="cartUpdate.do" method="post">
			<input type="hidden" id="itemCode" name="itemCode">
			<input type="hidden" id="itemQty" name="itemQty">

    <div class="cart-page">
        <div class="container">
			<table class="cart-table">
            <thead>
				<tr>
					<th class="product-h">상품</th>
					<th>상품이름</th>
					<th class="quan">주문개수</th>
					<th>상품가격</th>
					<th>상품총가격</th>
					<c:if test="${!empty id }">
						<th></th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${clist }" var="vo">
						<tr>
							<td class="product-col" onclick="formSelect('${vo.itemCode}')">
								<img width="100" height="150" src="${pageContext.request.contextPath }/bootstrap/img/product/${vo.itemImg}" alt="">
							</td>
							<td onclick="formSelect('${vo.itemCode}')">${vo.itemName }</td>
							<td>
								<input type="number" min="1" max="99" id="qty" name="qty" style="width: 3em; text-align: center;"
								 value="${vo.itemQty }" onclick="cartUpdate($(this).val(), '${vo.itemCode}')">
							</td>
							<td>
								<fmt:formatNumber type="currency" value="${vo.itemPrice }"></fmt:formatNumber>
							</td>
							<td>
								<fmt:formatNumber type="currency" value="${vo.itemQty * vo.itemPrice }"></fmt:formatNumber>
							</td>
							<td>
								<button type="submit">수정</button>
								<button type="button" onclick="cartDelete('${vo.itemCode}')">삭제</button>
							</td>
						</tr>
				</c:forEach>
			</tbody>
			</table>	
		</div>
		</div>
		</form>
	</div>
</body>
</html>