<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Q&#38;A 리스트</title>
	<style>
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
</head>
<body>
		<div align="center">
		<h1>Q&#38;A</h1>
		<form id="frm" action="qnaSelect.do" method="post">
			<input type="hidden" id="id" name="id">
		</form>
		<form id="frmSearch" action="qnaSearch.do" method="post">
			<input type="hidden" id="title" name="title">
			<input type="hidden" id="content" name="content">
		</form>
		<form id="frmDel" action="qnaDelete.do" method="post">
			<input type="hidden" id="did" name="did">
		</form>
		<hr>
		<div style="width: 80%">
			<table class="table">
				<tr>
					<th>순번</th>
					<th>제목</th>
					<th>작성일자</th>
					<th>조회수</th>
					<c:if test="${id eq 'admin' }">
					<th>기능</th>
					</c:if>
				</tr>
				<c:forEach items="${qnaList }" var="vo">
					<tr>
						<td width="100" onclick="formSubmit(${vo.id})">${vo.id }</td>
						<td width="200" onclick="formSubmit(${vo.id})">${vo.title }</td>
						<td width="200" onclick="formSubmit(${vo.id})">${vo.writer }</td>
						<td width="150" onclick="formSubmit(${vo.id})">${vo.regDate }</td>
						<td width="100" onclick="formSubmit(${vo.id})">${vo.hit }</td>
						<c:if test="${vo.writer eq id }">
							<td width="50">
								<button type="button" onclick="formDelete(${vo.writer})">삭제</button>							
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<div>
				<input type="text" id="search" size=35>
				<button type="button" onclick="formSearch()">검색</button>
				<c:if test="${!empty id}">
					<button type="button" onclick="location.href='qnaInsertForm.do'">등록</button>
				</c:if>
				<br><br>
				<button type="button" onclick="location.href='index.do'">홈</button>
			</div>
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