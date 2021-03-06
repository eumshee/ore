<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/adminSelect.jsp</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="//cdn.ckeditor.com/4.16.1/full/ckeditor.js"></script>
<style>
table {
	border-collapse: collapse;
}

th, td {
	padding: 10px;
	vertical-align : middle !important;
}

th {
	text-align: center;
}
</style>
<script>
$(function() {
	$('#btnUpdate').click(function(e) {
		e.preventDefault();
		let frm = document.getElementById('frm');
		let data = new FormData(frm);
		data.append('fileN',$('#fileN').val());
		data.append('newfile',$('#newfile').val());
		
		// 파일 업로드 서블릿
		$.ajax({
			contentType: false,
			processData: false,
			url: '${pageContext.request.contextPath }/updateServlet',
			type: 'post',
			data: data,
			success: function(result) {
				location.href='adminList.do';
			},
			error: function(err) {
				console.log(err);
			}
		}); // end of ajax
	}); // end of click
	
	// 이미지 변경
	$("#file").change(function(){
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(250);        
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
		  });
});

	function adminDelete() {
		frmDel.submit();
	}
	
</script>
</head>
<body>
	<div class="container">
		<h1>Manage</h1>
	<div align="center">
		<form id="frmDel" action="adminDelete.do" method="post">
			<input type="hidden" id="code" name="code" value="${product.itemCode}">
		</form>
			<form id="frm" action="adminUpdate.do" method="post"  enctype='multipart/form-data'>
				<br>
				<table class="table">
					<tr>
						<th>상품코드</th>
						<td><input type="text" name="code" id="code" value="${product.itemCode}" size="40" readonly></td>
						<td rowspan="5" width="400" align="center">
						<b>상품이미지</b>
						<div class="select_img">
						<img src="${pageContext.request.contextPath }/bootstrap/img/product/${product.itemImg}" alt="" width="250" height="350" id="img"><br>
						</div>
						<input type="file" id="file" name="file"  onchange="javascript:document.getElementById('newfile').value = this.value.substr(12)">
						<input type="hidden" id="fileN" value="${product.itemImg}">
						<input type="hidden" id="newfile">
						</td>
					</tr>
					<tr>
						<th>상품명</th>
						<td><input type="text" name="name" id="name" value="${product.itemName}" size="40"></td>
						
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="price" id="price" value="${product.itemPrice}" size="40"></td>
					</tr>
					<tr>
						<th>재고</th>
						<td><input type="text" name="stock" id="stock" value="${product.itemStock}" size="40"></td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><input type="date" name="date" id="date" value="${product.itemDate}" size="40"></td>
					</tr>
					<tr>
						<th>상품설명</th>
						<td colspan="2"><textarea name="desc" cols="100" rows="8">${product.itemDesc }</textarea></td>
					</tr>

				</table>
				<div align="center">
					<button class="btn btn-outline-dark mt-auto"  type="button" id="btnUpdate">상품수정</button>
					<button class="btn btn-outline-dark mt-auto"  type="button" onclick="adminDelete()">상품삭제</button>
					<button class="btn btn-outline-dark mt-auto"  type="button" onclick="location.href='adminList.do'">목록보기</button>
				</div>
			</form>
		</div>
		</div>
</body>
</html>