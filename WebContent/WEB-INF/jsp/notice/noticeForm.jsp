<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice/noticeForm.jsp</title>
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
	$(function() {CKEDITOR.replace('content',
		{
			filebrowserUploadUrl : '${pageContext.request.contextPath}/fileUpload',
			height : '500px',
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
</script>
</head>
<body>
	<div class="container">
		<h1>Notice</h1><br>
		<div align="center">
			<form id="frm" action="noticeInsert.do" method="post">
				<div>
					<table class="table">
						<tr>
							<th width="100"><label for="title">TITLE</label></th>
							<td><input type="text" id="title" name="title" size=100>
							</td>
						</tr>
						<tr>
							<th width="100"><label for="content">CONTENT</label></th>
							<td><textarea id="content" name="content"></textarea></td>
						</tr>
					</table>
					<div>
						<button class="btn btn-outline-dark mt-auto" type="button" onclick="formCheck()">WRITE</button>
						<button class="btn btn-outline-dark mt-auto" type="reset">RESET</button>
						<button class="btn btn-outline-dark mt-auto" type="button" onclick="location.href='noticeList.do'">BACK</button>
					</div>
				</div>
			</form>
		</div>
		</div>
</body>
</html>