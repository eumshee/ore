<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		function formSubmit(id,writer,code) {
			frm.id.value = id;
			frm.writer.value = writer;
			frm.code.value = code;
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
			
		function goPage(page) {
			location.href="qnaList.do?page="+page;
		}
		
		function qnaInsert() {
			
		}
	</script>
</head>
<body>
	<div class="container">
		<h1>Q&A</h1>
		<br>
		<div align="center">
			<div class="col-lg-12 text-right">
				<c:if test="${!empty id}">
					<button class="btn btn-outline-dark mt-auto" type="button"
						onclick="location.href='qnaInsertForm.do'">WRITE</button>
				</c:if>
			</div>
			<form id="frm" action="qnaSelect.do" method="post">
				<input type="hidden" id="id" name="id">
				<input type="hidden" id="writer" name="writer">
				<input type="hidden" id="code" name="code">
			</form>
			<form id="frmSearch" action="qnaSearch.do" method="post">
				<input type="hidden" id="title" name="title"> <input
					type="hidden" id="content" name="content">
			</form>
			<br>
			<table class="table">
				<tr>
					<th>NO.</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>DATE</th>
					<th>HIT</th>
				</tr>
				<c:forEach items="${qnaList }" var="vo">
					<tr>
						<td width="50" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.id }</td>
						<td width="350" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.title }</td>
						<td width="150" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.writer }</td>
						<td width="150" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.regDate }</td>
						<td width="50" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.hit }</td>
					</tr>
				</c:forEach>
			</table>
			<br><br>
			<div class="col-lg-12 text-center">
				<input type="text" id="search" size=35>
				<button class="btn btn-outline-dark mt-auto" type="button"
					onclick="formSearch()">SEARCH</button>
				<button class="btn btn-outline-dark mt-auto" type="button"
					onclick="location.href='index.do'">HOME</button>
				<br><br>
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
	</div>
</body>
</html>