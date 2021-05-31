<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/adminSelect.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="//cdn.ckeditor.com/4.16.1/full/ckeditor.js"></script>
<style>
table {
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	vertical-align : middle !important;
}

th {
	text-align: center;
}

#cke_content {
	margin: auto;
}
</style>
<script>
	$(function() {
		CKEDITOR
				.replace(
						'content',
						{
							filebrowserUploadUrl : '${pageContext.request.contextPath}/fileUpload',
							height : '600px',
							width : '950px'
						});

		CKEDITOR.editorConfig = function(config) {
			config.toolbarStartupExpanded = false; // 툴바 접기
		};
	});

	function noticeUpdate() {
		frm.submit();
	}

	function noticeDelete() {
		frmdel.submit();
	}
</script>
</head>
<body>
	<div align="center">
		<h3>상품정보 수정</h3>
		<form id="frmDel" action="noticeDelete.do" method="post">
			<input type="hidden" id="id" name="id" value="${notice.id}">
		</form>
		<hr>
		<div style="width: 60%;">
			<form id="frm" action="noticeUpdate.do" method="post">
				<input type="hidden" id="id" name="id" value="${notice.id}">
				<table class="table">
					<tr>
						<th>상품코드</th>
						<td><input type="text" name="code" id="code" value="${product.itemCode}" size="40"></td>
						<td rowspan="5" width="400">
						<img src="${pageContext.request.contextPath }/bootstrap/img/product/${product.itemImg}" alt="" width="250" height="350"><br>
						<input type="file" name="board_file"/></td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input type="text" name="name" id="name" value="${product.itemName}" size="40"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="price" id="price" value="${product.itemPrice}" size="40"></td>
					</tr>
					<tr>
						<th>재고</th>
						<td><input type="text" name="stock" id="stock" value="${product.itemStock}" size="40"></td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><input type="text" name="date" id="date" value="${product.itemDate}" size="40"></td>
					</tr>
					<tr>
						<th>상품설명</th>
						<td colspan="2"><textarea name="desc" cols="60" rows="8">${product.itemDesc }</textarea></td>
					</tr>

				</table>
				<div align="center">
					<button type="button" onclick="adminUpdate()">상품수정</button>
					<button type="button" onclick="adminDelete()">상품삭제</button>
					<button type="button" onclick="location.href='adminList.do'">목록보기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>