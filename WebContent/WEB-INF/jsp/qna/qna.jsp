<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>qnaSelect</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="//cdn.ckeditor.com/4.16.1/full/ckeditor.js"></script>
	<style>
		table {
			border-collapse: collapse;
		}

		th, td {
			text-align: center;
			vertical-align: middle !important;
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
				width: '950px'
			});
		});

		function qnaUpdate() {
			let title = $('#ctitle').val();
			let content = CKEDITOR.instances.content.getData();
			console.log(title, content);
			frm.title.value = title;
			frm.ccontent.value = content;
			
			frm.submit();
		}

		function qnaDelete() {
			frmDel.submit();
		}

        // 댓글 등록
        function writeCmt() {
            var form = document.getElementById("writeCommentForm");
            
            var board = form.commentBoard.value
            var id = form.commentId.value
            var content = form.commentContent.value;
     		console.log(board, id, content);
            
            if(!content)
            {
                alert("내용을 입력하세요.");
                return false;
            }

            
            var param = { "commentBoard": board,
            		"commentId": id,
            		"commentContent": content};
            
       		var link = document.location.href; 
       		
        		$.ajax({
	       			url: '/commentWriteAction.do',
	       			data: param,
	       			contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
	       			success: function (result){
	       				console.log(result);
	       				location.href=link;
	       			},
	       			error: function (err){
	       				console.log(err);
	       			}
       			});
            
        }
  

	</script>
</head>

<body>
<form id="frmDel" action="qnaDelete.do" method="post">
	<input type="hidden" id="did" name="did" value="${qna.id}">
	<input type="hidden" id="dwriter" name="dwriter" value="${qna.writer}">
</form>
<form id="frm" action="qnaUpdate.do" method="post">
	<input type="hidden" id="id" name="id" value="${qna.id}">
	<input type="hidden" id="writer" name="writer" value="${qna.writer }">
	<input type="hidden" id="title" name="title">
	<input type="hidden" id="ccontent" name="ccontent">
</form>
	<div class="container">
		<h1>Q&#38;A</h1>
		<br>
		<div align="center">
				<table class="table">
					<tr>
						<th>ITEM</th>
						<td class="product-col" style="text-align:left;"><img width="100" height="150"
										src="${pageContext.request.contextPath }/bootstrap/img/product/${item.itemImg}"
										alt="">
						<td colspan="6">${item.itemName}</td>
					</tr>
					<tr>
						<th>No.</th>
						<td>${qna.id}</td>
						<th>WRITER</th>
						<td>${qna.writer }</td>
						<th>DATE</th>
						<td>${qna.regDate}</td>
						<th>HIT</th>
						<td>${qna.hit+1}</td>
					</tr>
					<tr>
						<th>TITLE</th>
						<c:choose>
							<c:when test="${id eq qna.writer }">
								<td colspan="7">
									<input id="ctitle" name="ctitle" type="text" value="${qna.title}" size="100">
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="7">${qna.title}
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th>CONTENT</th>
						<c:choose>
							<c:when test="${id eq qna.writer}">
								<td colspan="7">
									<textarea id="content" name="content" rows="6" cols="90">${qna.content}</textarea>
								</td>
							</c:when>
							<c:otherwise>
								<td colspan="7">
									<textarea id="content" name="content" rows="6" cols="90" readonly="readonly">${qna.content}</textarea>
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
			<div class="col-lg-12 text-center">
				<c:if test="${id eq qna.writer}">
					<button class="btn btn-outline-dark mt-auto" type="button" onclick="qnaUpdate()">MODIFY</button>
					<button class="btn btn-outline-dark mt-auto" type="button" onclick="qnaDelete()">DELETE</button>
					<br><br>
				</c:if>
				<button class="btn btn-outline-dark mt-auto" type="button"
					onclick="location.href='qnaList.do'">BACK</button>
			</div>
		</div>
		
		<br><br>
		
		<div class="col-lg-12 text-center">
			<h4>Comment</h4>
			<div style="padding: 1.5em;">
			<!-- 댓글 부분 -->
			<div id="comment" align="center">
			<table border="1" style="border-color: lightgray;">
				<!-- 댓글 목록 -->
				<c:forEach items="${commentList }" var="comment" >
				<tr>
					<!-- 아이디, 작성날짜 -->
					<td width="150">
						<div>
							${comment.commentId}<br>
							<font size="2" color="lightgray">${comment.commentDate}</font>
						</div>
					</td>
					<!-- 본문내용 -->
					<td width="550">
						<div class="text_wrapper">
							${comment.commentContent}
						</div>
					</td>
					<!-- 버튼 -->
					<td width="100">
						<div id="btn" style="text-align:center;">
							<a href="#" class="btn btn-outline-dark mt-auto" >ANSWER</a><br>
							<!-- 댓글 작성자만 수정, 삭제 가능하도록 -->
							<c:if test="${comment.commentId == id }">
								<a href="#" class="btn btn-outline-dark mt-auto" >MODIFY</a><br>
								<a href="#" class="btn btn-outline-dark mt-auto" >DELETE</a>
							</c:if>
						</div>
					</td>
				</tr>
				</c:forEach>
			</table>
						
				<c:if test="${!empty id }">
				<!-- 로그인 했을 경우만 댓글 작성가능 -->
					<form id="writeCommentForm">
						<input type="hidden" id="commentBoard" name="commentBoard" value="${qna.id}">
						<input type="hidden" id="commentId" name="commentId" value="${id }">
						<table class="table" >
								<tr>
									<!-- 아이디-->
									<td width="150">
										<div>
											${id}
										</div>
									</td>
									<!-- 본문 작성-->
									<td width="550">
										<div>
											<textarea id="commentContent" name="commentContent" rows="4" cols="70"></textarea>
										</div>
									</td>
									<!-- 댓글 등록 버튼 -->
									<td width="100">
										<div>
											<button type="button" onclick="writeCmt()" class="btn btn-outline-dark mt-auto" >WRITE</button>
										</div>
									</td>
								</tr>
						</table>
					</form>
				</c:if>
				</div>
			</div>
		</div>
	</div> <!-- container end -->

</body>

</html>