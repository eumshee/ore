<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>notice/notice.jsp</title>
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
			
			CKEDITOR.editorConfig = function( config ) {
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
<div align="center">
	<h3>공지사항 내용</h3>
	<form id="frmDel" action="noticeDelete.do" method="post">
		<input type="hidden" id="did" name="did" value="${notice.id}">
	</form>
	<hr>
	<div style="width: 70%;">
		<form id="frm" action="noticeUpdate.do" method="post">
			<input type="hidden" id="id" name="id" value="${notice.id}"> 
			<table class="table">
				<tr>
						<th>순번</th>
						<td>${notice.id}</td>
						<th>작성일자</th>
						<td>${notice.regDate}</td>
						<th>조회수</th>
						<td>${notice.hit+1}</td>
				</tr>
				<tr>
						<th>제목</th>
						<c:choose>
							<c:when test="${id eq 'admin' }">
								<td colspan="5">
									<input id="title" name="title" type="text" value="${notice.title}" size="100">
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="5">${notice.title }
							</c:otherwise>
						</c:choose>
				</tr>
				<tr>
						<th>내용</th>
						<c:choose>
							<c:when test="${id eq 'admin' }">
								<td colspan="5">
									<textarea id="content" name="content" rows="6" cols="90">${notice.content}</textarea>
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="5">
									<textarea id="content" name="content" rows="6" cols="90" readonly="readonly">${notice.content}</textarea>
								</td>
							</c:otherwise>
						</c:choose>
				</tr>
			</table>
			<div align="center">
				<c:if test="${id eq 'admin' }">
					<button type="button" onclick="noticeUpdate()">수정</button>
					<button type="button" onclick="noticeDelete()">삭제</button>
					<br><br>
				</c:if>
				<button type="button" onclick="location.href='noticeList.do'">목록보기</button>
			</div>
		</form>
	</div>
</div>
</body>
</html>