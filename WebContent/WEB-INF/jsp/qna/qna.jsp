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
		th, td {
			text-align: center;
			padding: 10px;
		}
		#cke_content {margin:auto;}
	</style>
	<script>
		$(function() {
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
<div align="center">
	<h3>Q&#38;A 상세보기</h3>
	<form id="frmDel" action="qnaDelete.do" method="post">
		<input type="hidden" id="did" name="did" value="${qna.id}">
		<input type="hidden" id="dwriter" name="dwriter" value="${qna.writer}">
	</form>
	<hr>
	<div style="width: 70%;">
		<form id="frm" action="qnaUpdate.do" method="post">
			<input type="hidden" id="id" name="id" value="${qna.id}"> 
			<input type="hidden" id="writer" name="writer" value="${qna.writer}"> 
			<table class="table">
				<tr>
						<th>순번</th>
						<td>${qna.id}</td>
						<th>작성자</th>
						<td>${qna.writer }</td>
						<th>작성일자</th>
						<td>${qna.regDate}</td>
						<th>조회수</th>
						<td>${qna.hit+1}</td>
				</tr>
				<tr>
						<th>제목</th>
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
						<th>내용</th>
						<c:choose>
							<c:when test="${id eq qna.writer}">
								<td colspan="7">
									<textarea id="content" name="content" rows="6" cols="90">${qna.content}</textarea>
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="7">
									<textarea id="content" name="content" rows="6" cols="90" readonly="readonly">${qna.content}</textarea>
								</td>
							</c:otherwise>
						</c:choose>
				</tr>
			</table>
		</form>
			<div align="center">
				<c:if test="${id eq qna.writer}">
					<button type="button" onclick="qnaUpdate()">수정</button>
					<button type="button" onclick="qnaDelete()">삭제</button>
					<br><br>
				</c:if>
				<button type="button" onclick="location.href='qnaList.do'">목록보기</button>
			</div>
	</div>
</div>
</body>
</html>