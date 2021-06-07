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
		
		function formSubmit(id, writer, name, img, code) {
			frms.id.value = id;
			frms.writer.value = writer;
			frms.name.value = '${product.itemName}';
			frms.img.value = '${product.itemImg}';
			frms.code.value = '${product.itemCode}';
			frms.submit();
		}
		
		function frmSubmit(writer,code) {
			rvfrm.writer.value = writer;
			rvfrm.code.value = code;
			rvfrm.submit();
		}
	</script>
</head>
<body>
	<form id="frms" action="qnaSelect.do" method="post">
		<input type="hidden" id="id" name="id">
		<input type="hidden" id="writer" name="writer">
		<input type="hidden" id="name" name="name">
		<input type="hidden" id="img" name="img">
		<input type="hidden" id="code" name="code">
	</form>
	<form id="rvfrm" action="reviewSelect.do" method="post">
		<input type="hidden" id="writer" name="writer">
		<input type="hidden" id="code" name="code">
	</form>
	<div class="container">
		<h1>Mypage</h1>
		<br> <br>
		<div class="info">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<h3>My info</h3>
					<br>
					<div
						style="width: 90%; border: 1px solid black; padding: 1em; margin-bottom: 2em;">
						<form id="frm" action="memberUpdate.do" method="post">
							<table>
								<tr>
									<th width="100">NAME</th>
									<td><input type="text" id="name" name="name"
										value="${vo.userName }" readonly="readonly" size="10"></td>
								</tr>
								<tr>
									<th>ID</th>
									<td><input type="text" id="userId" name="userId"
										readonly="readonly" value="${vo.userId }" size="10"></td>
								</tr>
								<tr>
									<th>PW</th>
									<td><input type="password" id="userPw" name="userPw"
										value="${vo.userPw }" size="10"></td>
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

				<div class="col-lg-8 col-md-6">
					<h3>My Order</h3>
					<br>
					<div
						style="width: 100%; border: 1px solid black; padding: 1em; margin-bottom: 2em;">
						<div style="padding: 1.5em;">
							<table class="table">
								<tr>
									<th>NO.</th>
									<th>DATE</th>
									<th>PRICE</th>
								</tr>
								<c:choose>
									<c:when test="${empty orderList }">
										<td colspan="3"><p>주문 내역이 없습니다.</p></td>
									</c:when>
									<c:otherwise>
										<c:forEach items="${orderList }" var="vo">
											<tr>
												<td width="150">${vo.orderNum }</td>
												<td width="150">${vo.orderDate }</td>
												<td width="150">${vo.orderPrice }</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</div>
				</div>
			</div>


			<br> <br>
			<!-- QNA 영역 출력 -->
			<div class="row">
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
												<tr onclick="formSubmit(${vo.id},'${vo.writer}','${product.itemImg}', '${product.itemName}', '${product.itemCode}')">
		 											<td width="100">${vo.id }</td>
													<td width="300">${vo.title } <span style="font-size: 10pt; color: lightgray;">(${vo.commentCnt })</span></td>
													<td width="100">${vo.writer }</td>
													<td width="150">${vo.regDate }</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:when test="${empty qnaList }">
											<td colspan="4"><p>작성한 게시글이 없습니다.</p></td>
										</c:when>
										<c:otherwise>
											<c:forEach items="${qnaList }" var="vo">
												<tr onclick="formSubmit(${vo.id},'${vo.writer}')">
													<td width="100">${vo.id }</td>
													<td width="300">${vo.title } <span style="font-size: 10pt; color: lightgray;">(${vo.commentCnt })</span>       </td>
													<td width="100">${vo.writer }</td>
													<td width="150">${vo.regDate }</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</table>
							</div>
						</div>
						<div class="review" align="center"
							style="border: 1px solid black; padding: 1em; margin-bottom: 2em;">
							<h4>Review</h4>
							<div style="padding: 1.5em;">
								<table class="table">
									<tr>
										<th>NO.</th>
										<th>TITLE</th>
										<th>SCORE</th>
										<th>WRITER</th>
										<th>DATE</th>
									</tr>
									<c:forEach items="${reviewList }" var="vo">
										<tr>
											<td width="50" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">${vo.reviewNum }</td>
											<td width="300" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">${vo.reviewTitle }</td>
											<td width="150" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">
												<div class="rating">
												<c:forEach begin="1" end="${vo.reviewScore }">
												<i class="fa fa-star" style="color: #fff000;"></i>
												</c:forEach>
												</div>
											</td>
											<td width="100" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">${vo.userId }</td>
											<td width="100" onclick="frmSubmit('${vo.userId}','${vo.itemCode}')">${vo.reviewDate }</td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>