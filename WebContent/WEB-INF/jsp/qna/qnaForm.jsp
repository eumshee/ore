.<%@ page language="java" contentType="text/html; charset=UTF-8"
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
		th, td {
			text-align: center;
			padding: 10px;
		}
		#cke_content {margin:auto;}
	</style>
	<script>
		$(function() {
			CKEDITOR.replace('content', {
				filebrowserUploadUrl: '${pageContext.request.contextPath}/fileUpload',
				height: '600px',
				width: '1000px'
			});
		}); 
	
		function formCheck() {
			if(frm.title.value == "") {
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
	<div align="center">
	<div>
		<h3>Q&#38;A 등록</h3>
	</div>
	<form id="frmCode" action="qnaInsertCodeForm.do" method="post">
		<input type="hidden" id="itemCode" name="itemCode">
	</form>
	<div style="width: 70%;">
		<form id="frm" action="qnaInsert.do" method="post">
			<div>
				<table class="table">
					<tr>
						<th width="100">제품코드</th>
						<td style="text-align: left;">
							<select id="item" name="item">
								<option hidden="">선택</option>
								<option value="outer">outer</option>
								<option value="top">top</option>
								<option value="bottom">bottom</option>
								<option value="acc">acc</option>
							</select>
						<button type="button" onclick="codeCheck()">불러오기</button>
						</td>
						<c:if test="${code }">
							<td>
								<c:forEach items="${code }" var="vo">
									<select id="itemCode" name="itemCode">
										<option hidden="">선택</option>
										<option value="${vo.itemCode}">'${vo.itemCode}'</option>
									</select>
								</c:forEach>
							</td>
						</c:if>
					</tr>
					<tr>
						<th width="100"><label for="title">제목</label></th>
						<td>
							<input type="text" id="title" name="title" size=109>
						</td>
					</tr>
					<tr>
						<th width="100"><label for="content">내용</label></th>
						<td>
							<textarea id="content" name="content"></textarea>
						</td>
					</tr>
				</table>
				<div>
					<button type="button" onclick="formCheck()">등록</button>
					<button type="reset">취소</button>
					<br><br>
					<button type="button" onclick="location.href='qnaList.do'">목록으로</button>
				</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>