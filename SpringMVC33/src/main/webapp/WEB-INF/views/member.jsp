<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="assets/css/member.css" />

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.id{
margin-left: 81px;
}
</style>
</head>
<body>

	<form action="${cpath}/join.do" method="POST" class="joinForm"
		onsubmit="DoJoinForm__submit(this); return false;" align="center">

		<!-- input에 name 속성과 db 테이블 컬럼명과 동일하게 작성해주기  -->
		<h2>회원가입</h2>

		<br>
		<div class="textForm">
			<input name="id"  type="text" id="id" class="id" placeholder="아이디를 입력하세요 "> 
			<button type="button" id="idCheck">중복 확인</button>
			<br>
			<div id=text></div>
		</div>
		<br>

		<div class="textForm">
			<input  name="pw" type="text"  class="pw1" placeholder="비밀번호">
		
		<br>
		<input onfocusout="checkpw123()" type="text"  class="pwcheck" placeholder="비밀번호 재 입력"> <br>
		
		</div>
		<br> 
		
		<div class="textForm">
			<input name="name" type="text" class="name" placeholder="닉네임">
		</div>
		<br>
		<div class="textForm">
			<input name="mail" type="text" class="name" placeholder="메일">
		</div>

		<br>
		<div class="address_wrap">
			<div class="address_name">
				<input name="addr1" type="text" class="nickname" placeholder="주소">
				
		<div class="address_wrap">
			<div class="address_name">
				<input name="addr2" type="text" class="nickname" placeholder="동네">
		<div class="address_wrap">
			<div class="address_name">
				<input name="addr3" type="text" class="nickname" placeholder="성별">
			</div>
			<br> <br>
			<button type="submit" class="btn btn-danger">회원가입</button>
			</div>
	</form>
	<script>

	<!-- 아이디 중복확인 -->
	$('#idCheck').on('click',function(){
	let id = $('input[name=id]').val();
	let btn = document.getElementById('idCheck')
	let div = document.getElementById('text')
	
	
	if(!id){
		alert('아이디를 입력하지 않았습니다.')
	
	}else{
		$.ajax({
			url : '${cpath}/idCheck.do',
			type : 'POST',
			data : {'id':id},
			dataType : 'text',
			success : function(cnt){
				if(cnt >= 1) {
					div.innerHTML = "<h5>사용할 수 없는 아이디 입니다.</h5>";
					idCheck.css('border','2px solid red')
				}else if (cnt == 0) {
					div.innerHTML = "<h5>사용 가능한 아이디 입니다.</h5>";
					ChkID =1;
				}
				console.log(ChkID)
			},
			error : function(){
				alert('연결 실패')
			}
		});
	}		
	});
	
	
	<!-- 비밀번호 중복확인 -->
	
	function checkpw123(){
	let pw = $('.textForm .pw1').val();
	let pwcheck = $('.textForm .pwcheck').val();
	
	console.log(pw);
	console.log(pwcheck);
	if(pw != pwcheck){
		
		
		alert('비밀번호가 일치하지않습니다.')
		let pwcheck = $('.textForm .pwcheck');
		pwcheck.css('border','2px solid red')
		
	}else{
		
		
		alert('비밀번호가 일치.')
	}
	
	};
	
	</script>


</body>
</html>