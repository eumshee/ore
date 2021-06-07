<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>reviewSelect</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="//cdn.ckeditor.com/4.16.1/full/ckeditor.js"></script>
	<style>
		table {
			border-collapse: collapse;
		}

		th, td {
			text-align: center;
			vertical-align: middle !important;
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
			height: '500px',
			width: '950px'
		});
	});

	function reviewUpdate() {
		let title = $('#ctitle').val();
		let content = CKEDITOR.instances.content.getData();
		console.log(title, content);
		frm.title.value = title;
		frm.ccontent.value = content;
		
		frm.submit();
	}

	function reviewDelete() {
		frmDel.submit();
	}
	
	function formSelect(code) {
		frmSelect.code.value = code;
		frmSelect.submit();
		}
	
	</script>
</head>
<body>
<form id="frmDel" action="reviewDelete.do" method="post">
	<input type="hidden" id="num" name="num" value="${review.reviewNum}">
</form>
<form id="frm" action="reviewUpdate.do" method="post">
	<input type="hidden" id="rvNum" name="rvNum" value="${review.reviewNum}">
	<input type="hidden" id="writer" name="writer" value="${review.userId }">
	<input type="hidden" id="title" name="title">
	<input type="hidden" id="ccontent" name="ccontent">
</form>
<form id="frmSelect" action="productSelect.do" method="post">
	<input type="hidden" id="code" name="code" value="${item.itemCode}">
</form>
	<div class="container">
		<h1>Review</h1>
		<div align="right">
			<button class="btn btn-outline-dark mt-auto right" type="button" onclick="location.href='reviewList.do'">BACK</button><br><br>
		</div>
		<div align="center">
				<table class="table">
					<tr onclick="formSelect('${item.itemCode}')">
						<th>ITEM</th>
						<td class="product-col" style="text-align:left;"><img width="100" height="150"
										src="${pageContext.request.contextPath }/bootstrap/img/product/${review.itemImg}"
										alt="">
						<td colspan="6" style="text-align:left;" >${item.itemName}</td>
					</tr>
					<tr>
						<th>No.</th>
						<td>${review.reviewNum}</td>
						<th>WRITER</th>
						<td>${review.userId }</td>
						<th>SCORE</th>
						<td>
						<div class="rating">
							<c:forEach begin="1" end="${review.reviewScore}">
							<i class="fa fa-star" style="color: #fff000;"></i>
							</c:forEach>
						</div>
						</td>
						<th>DATE</th>
						<td>${review.reviewDate}</td>
					</tr>
					<tr>
						<th>TITLE</th>
						<c:choose>
							<c:when test="${id eq review.userId }">
								<td colspan="7">
									<input id="ctitle" name="ctitle" type="text" value="${review.reviewTitle}" size="100">
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="7">${review.reviewTitle}
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th>CONTENT</th>
						<c:choose>
							<c:when test="${id eq review.userId}">
								<td colspan="7">
									<textarea id="content" name="content" rows="6" cols="90">${review.reviewContent}</textarea>
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="7">
									<textarea id="content" name="content" rows="6" cols="90" readonly="readonly">${review.reviewContent}</textarea>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
			<div class="col-lg-12 text-center">
				<c:if test="${id eq review.userId }">
					<button class="btn btn-outline-dark mt-auto" type="button" onclick="reviewUpdate()">MODIFY</button>
					<button class="btn btn-outline-dark mt-auto" type="button" onclick="reviewDelete()">DELETE</button>
					<br><br>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>