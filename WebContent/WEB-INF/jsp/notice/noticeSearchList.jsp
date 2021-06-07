<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			vertical-align: middle !important;
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
		
		if($('#search').val() == "") {
			alert("검색값을 입력하세요.");
			$('#search').focus();
			return false;
		}
		
		frmSearch.title.value=search;
		frmSearch.content.value=search;
		frmSearch.submit();
	}
	
	function formDelete(id) {
		frmDel.id.value = id;
		frmDel.submit();
	}
	
	function goPage(page) {
		location.href="noticeList.do?page="+page;
	}

</script>
</head>
<body>
<form id="frm" action="noticeSelect.do" method="post">
	<input type="hidden" id="id" name="id">
</form>
<form id="frmSearch" action="noticeSearch.do" method="post">
	<input type="hidden" id="title" name="title">
	<input type="hidden" id="content" name="content">
</form>
<form id="frmDel" action="noticeDelete.do" method="post">
	<input type="hidden" id="id" name="id">
</form>
	<div class="container">
		<h1>Notice Search</h1>
		<br>
		<div align="right">
		<button class="btn btn-outline-dark mt-auto" type="button"
						onclick="location.href='noticeList.do'">BACK</button>
						<br><br>
		</div>
		<div align="center">
		<div class="col-lg-12 text-right">
			<c:if test="${id eq 'admin' }">
				<button class="btn btn-outline-dark mt-auto" type="button"
				onclick="location.href='noticeForm.do'">WRITE</button>
			</c:if>
		</div>
		<table class="table">
			<tr>
				<th width="20">NO.</th>
				<th>TITLE</th>
				<th>DATE</th>
				<th>HIT</th>
				<c:if test="${id eq 'admin' }">
					<th>DEL</th>
				</c:if>
			</tr>
			<c:forEach items="${noticeList }" var="vo">
				<tr >
					<td width="100" onclick="formSubmit(${vo.id})">${vo.id }</td>
					<td width="200" onclick="formSubmit(${vo.id})">${vo.title }</td>
					<td width="150" onclick="formSubmit(${vo.id})">${vo.regDate }</td>
					<td width="100" onclick="formSubmit(${vo.id})">${vo.hit }</td>
					<c:if test="${id eq 'admin' }">
						<td width="50">
							<button  class="btn btn-outline-dark mt-auto" type="button" onclick="formDelete(${vo.id})">삭제</button>							
						</td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
			<br><br>
			<div class="col-lg-12 text-center">
				<input type="text" id="search" size=35>
				<button class="btn btn-outline-dark mt-auto" type="button"
					onclick="formSearch()">SEARCH</button>
				<br><br>
			</div>
			<br>
			<!-- 
			<jsp:include page="../common/paging.jsp" flush="true">
			    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
			    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
			    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
			    <jsp:param name="pageNo" value="${paging.pageNo}" />
			    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
			    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
			    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
			</jsp:include>
			 -->
	</div>
</div>
</body>
</html>