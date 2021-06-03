<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<style>
th, td {
	text-align: center;
}
</style>
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
		
		function formSubmit(id,writer) {
			frms.id.value = id;
			frms.writer.value = writer;
			frms.submit();
		}
	</script>
</head>
<body>
	<form id="frms" action="qnaSelect.do" method="post">
		<input type="hidden" id="id" name="id"> <input type="hidden"
			id="writer" name="writer">
	</form>
	<div class="container">
		<h1>Mypage</h1>
		<br> <br>
		<div class="info">
			<div class="col-lg-6">
				<h3>My info</h3>
				<br>
				<div
					style="width: 70%; border: 1px solid black; padding: 1em; margin-bottom: 2em;">
					<form id="frm" action="memberUpdate.do" method="post">
						<table>
							<tr>
								<th width="100">NAME</th>
								<td><input type="text" id="name" name="name"
									value="${vo.userName }" readonly="readonly"></td>
							</tr>
							<tr>
								<th>ID</th>
								<td><input type="text" id="userId" name="userId"
									readonly="readonly" value="${vo.userId }"></td>
							</tr>
							<tr>
								<th>PW</th>
								<td><input type="password" id="userPw" name="userPw"
									value="${vo.userPw }"></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;"><c:if
										test="${update eq 1 }">
										패스워드가 변경되었습니다.
									</c:if></td>
							</tr>
						</table>
						<div align="center">
							<br>
							<button class="btn btn-outline-dark mt-auto" type="button"
								onclick="pwCheck()">수정</button>
							<button class="btn btn-outline-dark mt-auto" type="button"
								onclick="location.href='memberDelete.do'">탈퇴</button>
						</div>
					</form>
				</div>
			</div>
			<br> <br>
			<div class="col-lg-12">
				<div class="board">
					<h3>My Board</h3>
					<br>
					<div class="qna" align="center"
						style="border: 1px solid black; padding: 1em; margin-bottom: 2em;">
						<h4>Q&#38;A</h4>
						<div style="padding: 1.5em;">
							<table class="table">
								<tr>
									<th>NO.</th>
									<th>TITLE</th>
									<th>WRITER</th>
									<th>DATE</th>
								</tr>
								<c:choose>
									<c:when test="${id eq 'admin' }">
										<c:forEach items="${qnaAll }" var="vo">
											<tr>
												<td width="100"
													onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.id }</td>
												<td width="200"
													onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.title }</td>
												<td width="200"
													onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.writer }</td>
												<td width="150"
													onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.regDate }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<c:forEach items="${qnaList }" var="vo">
											<tr>
												<td width="100"
													onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.id }</td>
												<td width="200"
													onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.title }</td>
												<td width="200"
													onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.writer }</td>
												<td width="150"
													onclick="formSubmit(${vo.id},'${vo.writer}')">${vo.regDate }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>