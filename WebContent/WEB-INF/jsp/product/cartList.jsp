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
	</script>
</head>
<body>
	<form id="frms" action="productSelect.do" method="post">
			<input type="hidden" id="code" name="code">
	</form>
	<div align="center">
		<form id="frm" action="cartUpdate.do" method="post">
			<input type="hidden" id="itemCode" name="itemCode">
			<input type="hidden" id="itemQty" name="itemQty">

		<div style="width: 50%;">
			<table class="table">
				<tr>
					<th>상품</th>
					<th>상품이름</th>
					<th>주문개수</th>
					<th>상품가격</th>
					<th>상품총가격</th>
					<c:if test="${!empty id }">
						<th></th>
					</c:if>
				</tr>
				<c:forEach items="${clist }" var="vo">
						<tr>
							<td onclick="formSelect('${vo.itemCode}')">
								<img width="100" height="150" src="${pageContext.request.contextPath }/bootstrap/img/product/${vo.itemImg}">
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
							</td>
						</tr>
				</c:forEach>
			</table>	
		</div>
		</form>
	</div>
</body>
</html>