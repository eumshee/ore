<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin/adminInsertForm.jsp</title>
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
	//상품코드 중복체크
	$('#cdCheck').click(function(e) {
		e.preventDefault();
		let cdCheck = $("#category option:selected").val()+$("#code").val();
		if ($('#code').val() == "") {
			alert('상품번호를 입력하세요.');
			$('#code').focus();
			return;
		}
		$.ajax({
			url : 'ajaxCodeCheck',
			data : {
				code : cdCheck
			},
			type : 'post',
			success : function(data) {
				console.log(data);
				if (data > 0) {
					alert('존재하는 상품번호입니다. 다른 번호를 입력하세요.');
					$('#code').val(""); // id박스에 넣었던 값을 지움
					$('#code').focus();
				} else {
					alert('사용 가능한 상품번호입니다.');
					$('#cdCheck').val('checked');
					$('#name').focus();
				}
			},
			error : function(err) {
				console.log(err);
			}
		}); // end of ajax
	}); // end of click function	
	
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

	// Insert버튼
	$('#btnInsert').click(function(e) {
		e.preventDefault();
		let frm = document.getElementById('frm');
		let data = new FormData(frm);
		data.append('code1', $('#category option:selected').val() + $('#code').val());
		// 파일 업로드 서블릿
		$.ajax({
			contentType: false,
			processData: false,
			url: '${pageContext.request.contextPath }/uploadServlet',
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
	
});

</script>
</head>
<body>
	<div align="center">
		<h3>상품등록</h3>
		<hr>
		<div style="width: 60%;">
			<form id="frm" action="adminInsert.do" method="post" enctype='multipart/form-data'>
				<table class="table">
					<tr>
						<th width="150">상품코드</th>
						<td>
							<select id="category">
								<option value="" hidden>category</option>
								<option value="O">Outer</option>
								<option value="T">Top</option>
								<option value="B">Bottom</option>
								<option value="A">Acc</option>
							</select>
							<input type="text" name="code" id="code" value="" size="10">
							<button id="cdCheck">중복체크</button>
						</td>
						<th width="250">상품이미지</th>
					<tr>
						<th>상품명</th>
						<td><input type="text" name="name" id="name" value="" size="40"></td>
						<td rowspan="4">
								<div class="select_img"><img src="" width="250" height="350" id="img"/></div>
								<input type="file" name="file" id="file"/>
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="price" id="price" value="" size="40"></td>
					</tr>
					<tr>
						<th>재고</th>
						<td><input type="text" name="stock" id="stock" value="" size="40"></td>
					</tr>
					<tr>
						<th>등록일</th>
						<td><input type="date" name="date" id="date" value="" size="40"></td>
					</tr>
					<tr>
						<th>상품설명</th>
						<td colspan="2"><textarea name="desc" id="desc" cols="100" rows="8"></textarea></td>
					</tr>

				</table>
				<div align="center">
					<button type="button" id="btnInsert">상품등록</button>
					<button type="button" onclick="location.href='adminList.do'">목록보기</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>