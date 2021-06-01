<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Q&#38;A 리스트</title>
	<style>
	th, td {
		text-align: center;
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
		function formSubmit(id,writer) {
			frm.id.value = id;
			frm.writer.value = writer;
			frm.submit();
		}
		
		function formSearch() {
			let search = document.getElementById("search").value;
			
			frmSearch.title.value=search;
			frmSearch.content.value=search;
			frmSearch.submit();
		}
			
		function goPage(page) {
			location.href="qnaList.do?page="+page;
		}
	</script>
</head>
<body>
		<div align="center">
		<h1>Q&#38;A</h1>
		<form id="frm" action="qnaSelect.do" method="post">
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="writer" name="writer">
		</form>
		<form id="frmSearch" action="qnaSearch.do" method="post">
			<input type="hidden" id="title" name="title">
			<input type="hidden" id="content" name="content">
		</form>
		<hr>
		<div style="width: 60%">
			<table class="table">
					<tr>
						<th>순번</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일자</th>
						<th>조회수</th>
					</tr>
				<c:forEach items="${qnaList }" var="vo">
					<tr>
						<td width="100" onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.id }</td>
						<td width="200" onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.title }</td>
						<td width="200" onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.writer }</td>
						<td width="150" onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.regDate }</td>
						<td width="100" onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.hit }</td>
					</tr>
				</c:forEach>
			</table>
			<div class="black">
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