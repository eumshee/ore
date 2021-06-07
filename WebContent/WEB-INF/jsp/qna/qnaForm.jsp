<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>qnaInsert</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		$(function () {
			CKEDITOR.replace('content', {
				filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload',
				height: '600px',
				width: '100%'
			});
		    
		}); // document end

		function formCheck() {
			if (frm.title.value == "") {
				alert("제목을 입력하세요.");
				frm.title.focus();
				return false;
			}
			
			if ($('#item option').prop("selected",false)) {
				alert("제품을 선택하세요.");
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
							<select id="item" name="item" onchange="codeCheck()">
								<option hidden="">선택</option>
								<option value="outer">outer</option>
								<option value="top">top</option>
								<option value="bottom">bottom</option>
								<option value="acc">acc</option>
							</select>
							<br>
							<c:if test="${code }">
									<select id="itemCode" name="itemCode" onchange="itemCheck()">
										<option hidden="">선택</option>
										<c:forEach items="${code }" var="vo">
										<option value="${vo.itemCode}">${vo.itemCode}</option>
										</c:forEach>
									</select>
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
					<button class="btn btn-outline-dark mt-auto" type="reset">RESET</button>
					<button class="btn btn-outline-dark mt-auto" type="button" onclick="formCheck()">WRITE</button>
					<br><br>
					<button class="btn btn-outline-dark mt-auto" type="button" onclick="location.href='qnaList.do'">BACK</button>
				</div>
			</form>
		</div>
	</div>
</body>

</html>