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
		}
	</style>
</head>
<body>
	<div align="center">
		<div style="width: 50%;">
			<table class="table">
				<tr>
					<th>유저</th>
					<th>상품코드</th>
					<th>상품이름</th>
					<th>주문개수</th>
					<th>상품가격</th>
					<th>상품총가격</th>
				</tr>
				<c:forEach items="${clist }" var="vo">
						<tr>
							<td>${vo.userId }</td>
							<td>${vo.itemCode }</td>
							<td>${vo.itemName }</td>
							<td>${vo.itemQty }</td>
							<td>
								<fmt:formatNumber type="currency" value="${vo.itemPrice }"></fmt:formatNumber>
							</td>
							<td>
								<fmt:formatNumber type="currency" value="${vo.itemQty * vo.itemPrice }"></fmt:formatNumber>
							</td>
						</tr>
				</c:forEach>
			</table>	
		</div>
	</div>
</body>
</html>