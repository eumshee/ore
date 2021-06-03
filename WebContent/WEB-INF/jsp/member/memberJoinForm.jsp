<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
	$(function() {
		// 서블릿 호출
		$('#idCheck').click(function() {
			if ($('#memberId').val() == "") {
				swal('아이디를 입력하세요.');
				$('#memberId').focus();
				return;
			}
			$.ajax({
				url : 'ajaxMemberIdCheck',
				data : {
					id : $('#memberId').val()
				},
				type : 'post',
				success : function(data) {
					console.log(data);
					if (data > 0) {
						swal('아이디가 존재합니다. 다른 아이디를 입력하세요.');
						$('#memberId').val("");
						$('#memberId').focus();
					} else {
						swal('사용가능한 아이디입니다.');
						$('#idCheck').val('checked');
						$('#memberId').prop('readonly', true);
						$('#memberPwd').focus();
					}
				},
				error : function(err) {
					console.error(err);
				}
			}); // ajax end
		}); // click end
	});

	function formCheck() {
		if ($('#memberId').val() == "") {
			swal("아이디를 입력하세요.");
			frm.memberId.focus();
			return false;
		}
		if ($('#idCheck').val() == "unChecked") {
			swal("ID 중복체크를 하세요.");
			return false;
		}
		if ($('#memberPwd').val() == "") {
			swal("비밀번호를 입력하세요.");
			frm.memberPwd.focus();
			return false;
		}
		if ($('#memberName').val() == "") {
			swal("이름을 입력하세요.");
			frm.memberName.focus();
			return false;
		}
		frm.submit();
	}
</script>
<style>
/* STRUCTURE */
th, td {
	text-align: left;
	padding: 5px;
}
.wrapper {
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
	width: 100%;
	height: 70%;
	padding: 20px;
}

.swal-text {
 	color: #212529;
}

.swal-button{
  padding: 7px 19px;
  border-radius: 2px;
  background-color: #212529;
  font-size: 12px;
  font-color: #212529;
  text-shadow: 0px -1px 0px rgba(0, 0, 0, 0.3);
}

#formContent {
	-webkit-border-radius: 10px 10px 10px 10px;
	border-radius: 10px 10px 10px 10px;
	background: #fff;
	padding: 30px;
	width: 90%;
	max-width: 600px;
	position: relative;
	padding: 0px;
	-webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
	text-align: center;
}

/* FORM TYPOGRAPHY*/
input[type=button], input[type=submit], input[type=reset] {
	background-color: #56baed;
	border: none;
	color: white;
	padding: 15px 80px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	text-transform: uppercase;
	font-size: 13px;
	-webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
	margin: 5px 20px 40px 20px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-ms-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}

input[type=button]:active, input[type=submit]:active, input[type=reset]:active,
	input[type=password]:active {
	-moz-transform: scale(0.95);
	-webkit-transform: scale(0.95);
	-o-transform: scale(0.95);
	-ms-transform: scale(0.95);
	transform: scale(0.95);
}

input[type=text], input[type=password] {
	background-color: #f6f6f6;
	border: none;
	color: #0d0d0d;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 5px;
	width: 200px;
	border: 2px solid #f6f6f6;
	-webkit-transition: all 0.5s ease-in-out;
	-moz-transition: all 0.5s ease-in-out;
	-ms-transition: all 0.5s ease-in-out;
	-o-transition: all 0.5s ease-in-out;
	transition: all 0.5s ease-in-out;
	-webkit-border-radius: 5px 5px 5px 5px;
	border-radius: 5px 5px 5px 5px;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #fff;
	border-bottom: 2px solid #212529;
}

input[type=text]:placeholder, input[type=password]:placeholder {
	color: #cccccc;
}

/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}

/* Simple CSS3 Fade-in Animation */
.underlineHover:after {
	display: block;
	left: 0;
	bottom: -10px;
	width: 0;
	height: 2px;
	background-color: #56baed;
	content: "";
	transition: width 0.2s;
}

.underlineHover:hover {
	color: #0d0d0d;
}

.underlineHover:hover:after {
	width: 100%;
}

/* OTHERS */
*:focus {
	outline: none;
}
</style>
<div class="wrapper fadeInDown">
	<div id="formContent">
		<div class="container">
			<br>
			<h1>Register</h1>
			<br>
			<br>
		</div>
		<form id="frm" action="memberJoin.do" method="post">
			<table align="center">
				<tr>
					<th>ID</th>
					<td><input type="text" id="memberId" name="memberId" size="24"></td>
					<td><button class="btn btn-outline-dark mt-auto" type="button" id="idCheck" value="unChecked">CHECK</button></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" id="memberPwd" name="memberPwd" size="24"><br></td>
				</tr>
				<tr>
					<th>NAME</th>
					<td><input type="text" id="memberName" name="memberName" size="24"><br></td>
				</tr>
			</table>
			<div class="fadeIn Second">
				<br><br>
				<button class="btn btn-outline-dark mt-auto" type="button" onclick="location.href='index.do'" style="width: 185px;">HOME</button>
				<button class="btn btn-outline-dark mt-auto" type="button" onclick="formCheck()" style="width: 185px;">JOIN</button>
			</div>
			<br><br>
		</form>
	</div>
</div>
