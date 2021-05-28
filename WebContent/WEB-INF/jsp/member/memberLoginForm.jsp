<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>memberLoginForm.jsp</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		function formCheck() {
			if(frm.memberId.value == "") {
				alert("아이디를 입력하세요.");
				frm.memberId.focus();
				return false;
			}
			if(frm.memberPwd.value == "") {
				alert("패스워드를 입력하세요.");
				frm.memberPwd.focus();
				return false;
			}
			frm.submit(); 
		}
	</script>
	<style>
		table {
			margin: auto;
			
		}
		.center {
			text-align: center;
		}
		th {
			padding-left: 10px;
		}
	</style>
</head>
<body>
	<div align="center">
		<h1>로그인</h1>
	</div>	
	<hr>
	<div>
		<form id="frm" action="memberLogin.do" method="post">
			<div>
				<table border="1">
					<tr>
						<th><label for="memberId">아이디</label></th>
						<td><input type="text" id="memberId" name="memberId"></td>
					</tr>
					<tr>
						<th><label for="memberPwd">패스워드</label></th>
						<td><input type="password" id="memberPwd" name="memberPwd"></td>
					</tr>
				</table>
				<br>
				<div class="center">
					<button type="button" onclick="formCheck()">로그인</button>
					<button type="reset">취소</button>
					<button type="button" onclick="location.href='index.do'">홈</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>