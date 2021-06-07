<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>qna/qnaSearchList.jsp</title>
	<style>
		table {
			border-collapse: collapse;
		}
		th, td {
			text-align: center;
			padding: 10px;
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
	</script>
</head>
<body>
<form id="frm" action="qnaSelect.do" method="post">
	<input type="hidden" id="id" name="id">
	<input type="hidden" id="writer" name="writer">
	<input type="hidden" id="code" name="code">
</form>
<form id="frmSearch" action="qnaSearch.do" method="post">
	<input type="hidden" id="title" name="title">
	<input type="hidden" id="content" name="content">
</form>
<form id="frmDel" action="qnaDelete.do" method="post">
	<input type="hidden" id="did" name="did">
</form>
	<div class="container">
		<h1>Q&#38;A Result</h1>
		<br>
		<div align="right">
		<c:if test="${!empty id}">
			<button class="btn btn-outline-dark mt-auto" type="button"
			onclick="location.href='qnaInsertForm.do'">WRITE</button>
		</c:if>
		<button class="btn btn-outline-dark mt-auto" type="button" onclick="location.href='qnaList.do'">BACK</button>
		<br><br>
		<div align="center">
			<br>
		<div style="width: 100%">
			<div class="col-lg-12 text-right">
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
						<td width="100" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.id }</td>
						<td width="200" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.title }</td>
						<td width="200" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.writer }</td>
						<td width="150" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.regDate }</td>
						<td width="100" onclick="formSubmit(${vo.id},'${vo.writer}','${vo.itemCode}')">${vo.hit }</td>
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
			</div>
		</div>
		</div>
	</div>
	</div>
</body>
</html>