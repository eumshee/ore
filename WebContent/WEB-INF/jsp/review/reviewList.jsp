<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review 리스트</title>
<style>
th, td {
	text-align: center;
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
		function formSubmit(writer,code) {
			frm.writer.value = writer;
			frm.code.value = code;
			frm.submit();
		}
			
		function goPage(page) {
			location.href="reviewList.do?page="+page;
		}

	</script>
</head>
<body>
	<div class="container">
		<h1>Review</h1>
		<br>
		<div align="center">
			<div class="col-lg-12 text-right">
				<c:if test="${!empty id}">
					<button class="btn btn-outline-dark mt-auto" type="button"
						onclick="location.href='reviewInsertForm.do'">WRITE</button>
				</c:if>
				<button class="btn btn-outline-dark mt-auto" type="button"
				onclick="location.href='index.do'">HOME</button>
			</div>
			<form id="frm" action="reviewSelect.do" method="post">
				<input type="hidden" id="id" name="id">
				<input type="hidden" id="writer" name="writer">
				<input type="hidden" id="code" name="code">
			</form>
			<br>
			<table class="table">
				<tr>
					<th>NO.</th>
					<th>ITEM</th>
					<th>NAME</th>
					<th>TITLE</th>
					<th>WRITER</th>
					<th>SCORE</th>
				</tr>
				<c:forEach items="${reviewList }" var="vo">
					<tr>
						<td width="50" onclick="formSubmit('${vo.userId}','${vo.itemCode}')">${vo.reviewNum }</td>
						<td width="100" onclick="formSubmit('${vo.userId}','${vo.itemCode}')">
						<img width="100" height="150"
						src="${pageContext.request.contextPath }/bootstrap/img/product/${vo.itemImg}"
						alt="${vo.itemName } }">
						</td>
						<td width="200" onclick="formSubmit('${vo.userId}','${vo.itemCode}')">${vo.itemName }</td>
						<td width="300" onclick="formSubmit('${vo.userId}','${vo.itemCode}')">${vo.reviewTitle }</td>
						<td width="100" onclick="formSubmit('${vo.userId}','${vo.itemCode}')">${vo.userId }</td>
						<td width="150" onclick="formSubmit('${vo.userId}','${vo.itemCode}')">
							<div class="rating">
							<c:forEach begin="1" end="${vo.reviewScore }">
							<i class="fa fa-star" style="color: #fff000;"></i>
							</c:forEach>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<br><br>
			<div class="col-lg-12 text-center">
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