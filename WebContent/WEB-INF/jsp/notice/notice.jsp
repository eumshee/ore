<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice/notice.jsp</title>
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
	text-align: center;
	padding: 10px;
}

#cke_content {
	margin: auto;
}
</style>
<script>
	$(function() {CKEDITOR.replace('content',
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
		frmDel.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<h1>Notice</h1>
		<br>
		<div align="center">
			<form id="frmDel" action="noticeDelete.do" method="post">
				<input type="hidden" id="did" name="did" value="${notice.id}">
			</form>
			<form id="frm" action="noticeUpdate.do" method="post">
				<input type="hidden" id="id" name="id" value="${notice.id}">
				<table class="table">
					<tr>
						<th>No.</th>
						<td width="200">${notice.id}</td>
						<th>DATE</th>
						<td>${notice.regDate}</td>
						<th>HIT</th>
						<td>${notice.hit+1}</td>
					</tr>
					<tr>
						<th>TITLE</th>
						<c:choose>
							<c:when test="${id eq 'admin' }">
								<td colspan="5"><input id="title" name="title" type="text"
									value="${notice.title}" size="100"></td>
							</c:when>
							<c:otherwise>
								<td colspan="5">${notice.title }
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th>CONTENT</th>
						<c:choose>
							<c:when test="${id eq 'admin' }">
								<td colspan="5"><textarea id="content" name="content"
										rows="6" cols="90">${notice.content}</textarea></td>
							</c:when>
							<c:otherwise>
								<td colspan="5"><textarea id="content" name="content"
										rows="6" cols="90" readonly="readonly">${notice.content}</textarea>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
				<div class="col-lg-12 text-center">
					<c:if test="${id eq 'admin' }">
						<button class="btn btn-outline-dark mt-auto" type="button"
							onclick="noticeUpdate()">MODIFY</button>
						<button class="btn btn-outline-dark mt-auto" type="button"
							onclick="noticeDelete()">DELETE</button>
					</c:if>
					<button class="btn btn-outline-dark mt-auto" type="button"
						onclick="location.href='noticeList.do'">BACK</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>