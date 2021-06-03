<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>qnaSelect</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="//cdn.ckeditor.com/4.16.1/full/ckeditor.js"></script>
	<style>
		table {
			border-collapse: collapse;
		}

		th,
		td {
			text-align: center;
			padding: 10px;
		}

		#cke_content {
			margin: auto;
		}
	</style>
	<script>
		$(function () {
			CKEDITOR.replace('content', {
				filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload',
				height: '600px',
				width: '950px'
			});
		});

		function qnaUpdate() {
			frm.submit();
		}

		function qnaDelete() {
			frmDel.submit();
		}
	</script>
</head>

<body>
<form id="frmDel" action="qnaDelete.do" method="post">
	<input type="hidden" id="did" name="did" value="${qna.id}">
	<input type="hidden" id="dwriter" name="dwriter" value="${qna.writer}">
</form>
	<div class="container">
		<h1>Q&#38;A</h1>
		<br>
		<div align="center">
			<form id="frm" action="qnaUpdate.do" method="post">
				<input type="hidden" id="id" name="id" value="${qna.id}">
				<input type="hidden" id="writer" name="writer" value="${qna.writer}">
				<table class="table">
					<tr>
						<th>No.</th>
						<td>${qna.id}</td>
						<th>WRITER</th>
						<td>${qna.writer }</td>
						<th>DATE</th>
						<td>${qna.regDate}</td>
						<th>HIT</th>
						<td>${qna.hit+1}</td>
					</tr>
					<tr>
						<th>TITLE</th>
						<c:choose>
							<c:when test="${id eq qna.writer }">
								<td colspan="7">
									<input id="title" name="title" type="text" value="${qna.title}" size="100">
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="7">${qna.title}
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th>CONTENT</th>
						<c:choose>
							<c:when test="${id eq qna.writer}">
								<td colspan="7">
									<textarea id="content" name="content" rows="6" cols="90">${qna.content}</textarea>
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="7">
									<textarea id="content" name="content" rows="6" cols="90"
										readonly="readonly">${qna.content}</textarea>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
			</form>
			<div class="col-lg-12 text-center">
				<c:if test="${id eq qna.writer}">
					<button class="btn btn-outline-dark mt-auto" type="button" onclick="qnaUpdate()">MODIFY</button>
					<button class="btn btn-outline-dark mt-auto" type="button" onclick="qnaDelete()">DELETE</button>
					<br><br>
				</c:if>
				<button class="btn btn-outline-dark mt-auto" type="button" onclick="location.href='qnaList.do'">BACK</button>
			</div>
		</div>
	</div>
	
</body>

</html>