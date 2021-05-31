<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
		<script>
		function pwCheck() {
			if(frm.userPw.value == "") {
				alert("변경할 패스워드를 입력해주세요.");
				frm.userPw.focus();
				return false;
			}
			if(frm.userPw.value == ${vo.userPw}) {
				alert("다른 패스워드를 입력하세요.");
				frm.userPw.focus();
				return false;
			}
			
			frm.submit(); 
		}
	</script>
</head>
<body>
	<div align="center">
	<h3>회원정보</h3>
		<div style="width:70%;">
			<form id="frm" action="memberUpdate.do" method="post">
				<table>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" id="name" name="name" value="${vo.userName }" readonly="readonly">
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" id="userId" name="userId" readonly="readonly"  value="${vo.userId }">
						</td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td>
							<input type="password" id="userPw" name="userPw" value="${vo.userPw }">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<c:if test="${update eq 1 }">
								패스워드가 변경되었습니다.
							</c:if>
						</td>
					</tr>
				</table>
				<div>
					<button type="button" onclick="pwCheck()">수정</button>
					<button type="button" onclick="location.href='memberDelete.do'">탈퇴</button>
					<button type="reset">취소</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>