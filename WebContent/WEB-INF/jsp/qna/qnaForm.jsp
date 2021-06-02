<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
=======
.<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
>>>>>>> branch 'master' of https://github.com/eumshee/ore.git
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaInsert</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/4.16.1/full/ckeditor.js"></script>
<style>
table {
	border-collapse: collapse;
}

th {
	text-align: center;
	padding: 10px;
}

#cke_content {
	margin: auto;
}
</style>
<script>
	$(function() {
		CKEDITOR
				.replace(
						'content',
						{
							filebrowserUploadUrl : '${pageContext.request.contextPath}/fileUpload',
							height : '600px',
							width : '100%'
						});
	});

	function formCheck() {
		if (frm.title.value == "") {
			alert("제목을 입력하세요.");
			frm.title.focus();
			return false;
		}
		frm.submit();
	}

	function codeCheck() {
		frmCode.itemCode.value = $("#item option:selected").val();
		frmCode.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<h1>Q&#38;A</h1>
		<br>
		<div align="center">
			<form id="frmCode" action="qnaInsertCodeForm.do" method="post">
				<input type="hidden" id="itemCode" name="itemCode">
			</form>
			<form id="frm" action="qnaInsert.do" method="post">
				<table class="table">
					<tr>
						<th>제품</th>
						<td>
						<select id="item" name="item">
								<option hidden="">선택</option>
								<option value="outer">outer</option>
								<option value="top">top</option>
								<option value="bottom">bottom</option>
								<option value="acc">acc</option>
						</select>
						<button type="button" onclick="codeCheck()">불러오기</button>
							<c:if test="${code }">
								<c:forEach items="${code }" var="vo">
									<select id="itemCode" name="itemCode">
										<option hidden="">선택</option>
										<option value="${vo.itemCode}">'${vo.itemCode}'</option>
									</select>
								</c:forEach>
							</c:if>
							</td>
					</tr>
					<tr>
						<th><label for="title">제목</label></th>
						<td><input type="text" id="title" name="title" size=100></td>
					</tr>
					<tr>
						<th><label for="content">내용</label></th>
						<td><textarea id="content" name="content"></textarea></td>
					</tr>
				</table>
				<div>
					<button type="button" onclick="formCheck()">등록</button>
					<button type="reset">취소</button>
					<br> <br>
					<button type="button" onclick="location.href='qnaList.do'">목록으로</button>
				</div>
		</form>
	</div>
	</div>
</body>
</html>