<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/adminList.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
table {
	border-collapse: collapse;
}

th, td {
	text-align: center;
	padding: 10px;
	vertical-align : middle !important;
}

tr:hover td{background-color: #ddd;}

.container2 {
	width: 80%;
	margin: auto;
}

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
		function formSearch() {
			let search = document.getElementById("search").value;
			
			frmSearch.title.value=search;
			frmSearch.content.value=search;
			frmSearch.submit();
		}
		
		function formUpdate(code) {
			frmUpdate.code.value = code;
			frmUpdate.submit();
		}

		function formDelete(code) {
			frmDel.code.value = code;
			frmDel.submit();
		}
			
		function goPage(page) {
			location.href="adminList.do?page="+page;
		}

	</script>
</head>
<body>
	<div class="container2">
		<h1>Manage</h1>
		<form id="frm" action="productSelect.do" method="post">
			<input type="hidden" id="code" name="code">
		</form>
		<form id="frmUpdate" action="adminSelect.do" method="post">
			<input type="hidden" id="code" name="code">
		</form>
		<form id="frmSearch" action="noticeSearch.do" method="post">
			<input type="hidden" id="title" name="title"> <input
				type="hidden" id="content" name="content">
		</form>
		<form id="frmDel" action="adminDelete.do" method="post">
			<input type="hidden" id="code" name="code">
		</form>
		<br><input type="text" id="search" size=35>
		<button type="button" onclick="formSearch()">검색</button>
		<button type="button" onclick="location.href='adminInsertForm.do'">상품등록</button>
		<br><br>
	
		
			<table class="table">
				<tr>
					<th>상품코드</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>가격</th>
					<th>재고</th>
					<th>상품설명</th>
					<th>등록일</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${ProductList }" var="vo">
					<tr>
						<td onclick="formSubmit('${vo.itemCode}')">${vo.itemCode }</td>
						<td onclick="formSubmit('${vo.itemCode}')"><img src="${pageContext.request.contextPath }/bootstrap/img/product/${vo.itemImg}"
									alt="" width="100" height="150"></td>
						<td onclick="formSubmit('${vo.itemCode}')">${vo.itemName }</td>
						<td onclick="formSubmit('${vo.itemCode}')">${vo.itemPrice }</td>
						<td onclick="formSubmit('${vo.itemCode}')">${vo.itemStock }</td>
						<td onclick="formSubmit('${vo.itemCode}')">${vo.itemDesc }</td>
						<td onclick="formSubmit('${vo.itemCode}')">${vo.itemDate }</td>
						<td><button type="button" onclick="formUpdate('${vo.itemCode}')">수정</button></td>
						<td><button type="button" onclick="formDelete('${vo.itemCode}')">삭제</button></td>
					</tr>
				</c:forEach>
			</table>
			<br>
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
</body>
</html>