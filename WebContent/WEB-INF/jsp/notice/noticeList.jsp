<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>notice/noticeList.jsp(paging)</title>
	<style>
		table {
			border-collapse: collapse;
		}
		th, td {
			text-align: center;
			padding: 10px;
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
		function formSubmit(id) {
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
			frmDel.did.value = id;
			frmDel.submit();
		}
			
		function goPage(page) {
			location.href="noticeList.do?page="+page;
		}

	</script>
</head>
<body>
	<section class="categories-page spad">
	<div class="container">
		<h1>Notice</h1>
		<form id="frm" action="noticeSelect.do" method="post">
			<input type="hidden" id="id" name="id">
		</form>
		<form id="frmSearch" action="noticeSearch.do" method="post">
			<input type="hidden" id="title" name="title">
			<input type="hidden" id="content" name="content">
		</form>
		<form id="frmDel" action="noticeDelete.do" method="post">
			<input type="hidden" id="did" name="did">
		</form>
		<br><br>
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
				<c:forEach items="${noticeList }" var="vo">
					<tr>
						<td width="100" onclick="formSubmit(${vo.id})">${vo.id }</td>
						<td width="200" onclick="formSubmit(${vo.id})">${vo.title }</td>
						<td width="150" onclick="formSubmit(${vo.id})">${vo.regDate }</td>
						<td width="100" onclick="formSubmit(${vo.id})">${vo.hit }</td>
						<c:if test="${id eq 'admin' }">
							<td width="50">
								<button type="button" onclick="formDelete(${vo.id})">삭제</button>							
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
			<div class="row col-lg-12 text-right">
				<input type="text" id="search" size=35>
				<button class="btn btn-outline-dark mt-auto"  type="button" onclick="formSearch()">검색</button>
				<c:if test="${id eq 'admin' }">
					<button class="btn btn-outline-dark mt-auto"  type="button" onclick="location.href='noticeInsertForm.do'">등록</button>
				</c:if>
			</div>
			<br><br>
			<div class="col-lg-12 text-center">
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
			<div class="col-lg-12 text-left">
				<button class="btn btn-outline-dark mt-auto" type="button" onclick="location.href='index.do'">홈</button>
			</div>
		</div>
	</div>
	</section>
</body>
</html>