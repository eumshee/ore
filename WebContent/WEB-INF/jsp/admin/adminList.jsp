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

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<script>
		function formSubmit(id) {
			console.log(id);
			frm.id.value = id;
			frm.submit();
		}
		
		function formSearch() {
			let search = document.getElementById("search").value;
			
			frmSearch.title.value=search;
			frmSearch.content.value=search;
			frmSearch.submit();
		}
		
		function formDelete(id) {
			frmDel.id.value = id;
			frmDel.submit();
		}
			
		function goPage(page) {
			location.href="adminList.do?page="+page;
		}

	</script>
</head>
<body>
	<div align="center">
		<h2>상품관리</h2>
		<form id="frm" action="adminSelect.do" method="post">
			<input type="hidden" id="id" name="id">
		</form>
		<form id="frmSearch" action="noticeSearch.do" method="post">
			<input type="hidden" id="title" name="title"> <input
				type="hidden" id="content" name="content">
		</form>
		<form id="frmDel" action="noticeDelete.do" method="post">
			<input type="hidden" id="did" name="did">
		</form>
		<br><input type="text" id="search" size=35>
		<button type="button" onclick="formSearch()">검색</button>
		<button type="button" onclick="location.href='noticeInsertForm.do'">상품등록</button>
		<br><br>
				
		<div style="width: 80%">
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
					<tr onclick="formSubmit('${vo.itemCode}')">
						<td>${vo.itemCode }</td>
						<td><img src="${pageContext.request.contextPath }/bootstrap/img/product/${vo.itemImg}"
									alt="" width="100" height="150"></td>
						<td>${vo.itemName }</td>
						<td>${vo.itemPrice }</td>
						<td>${vo.itemStock }</td>
						<td>${vo.itemDesc }</td>
						<td>${vo.itemDate }</td>
						<td><button type="button" onclick="formDelete(${vo.itemCode})">수정</button></td>
						<td><button type="button" onclick="formDelete(${vo.itemCode})">삭제</button></td>
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