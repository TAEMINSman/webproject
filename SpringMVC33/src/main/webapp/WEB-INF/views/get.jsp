<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 프로젝트의 contextpath값을 동적으로 가져오는 방법 -->
<!-- contextpath : 동적으로 가져올수 있다 -->
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap 사용하기 위해 필요한 라이브러리 3개 
 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<!--  내 게시물 조회 -->
	<div class="container">
		<h3>게시글 조회 페이지</h3>
		<div class="panel panel-default">
			<form class="form-inline" action="${cpath}/">

				<div class="panel-body">
					<table class="table table-bordered table-hover">

						<tr class="heading">
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>작성일</td>

						</tr>

					</table>
					<div id="Insertview" style="display: none">
						<form id="frm">
							<input type="hidden" name="id" value="${mvo.name}" />

							<div class="form-group">
								<label for="title">제목 : </label> <input type="text"
									class="form-control" name="title" id="title">
							</div>
							<div class="form-group">
								<label class="writer" for="writer">작성자 :</label> <input
									type="text" class="form-control" name="writer" id="writer"
									value="${mvo.name}" redonly>
							</div>
							<div class="form-group">
								<label> 내용: </label>
								<textarea rows="10" class="form-control" name="contents"
									id="contents">
 				   </textarea>
							</div>

							<button type="button" onclick="boardInsert()"
								class="btn btn-default btn-sm">글쓰기</button>
							<button type="reset" class="btn btn-warning btn-sm close">닫기</button>
						</form>
						<div></div>
					</div>
			</form>
		</div>
		<br>
		<button onclick='location.href="${cpath}/"'
			class="btn btn-default btn-sm">메인페이지 이동</button>
		<br>
	</div>
	<br>
	</div>

	<script type="text/javascript">
	//1. 해당하는 페이지에 접속하자마자 서버에 데이터를 요청하는 ajax 함수를 실행 
	$(document).ready(function() {
		loadList(); // --> 호출 !! 

	})
	//2, 서버에 요청하는 ajax 함수를 생성 
	function loadList() {
		$.ajax({
			//$.ajax 문법 매개변수로 객체가 들어간다 {} 형식안에 객체를 넣기 
			//서버  url 
			url : '${cpath}/getAjax.do',

			// 요청 방식
			type : 'get',
			// 받아올 데이터 타입 지정 
			dataType : 'json',
			// 성공했을때 실행할 함수 
			success : listView,
			//실패했을때 실행할 함수 
			error : function() {
				alert('실패!');
			}

		})
	}
	// 3. 화면에 받아오는 함수 생성 
	function listView(data) {
		var blist = "";
		//for-each 문을 사용하는 방법 
		//$.each(어떤 데이터를 가지고 반복, 어떤함수로 처리해줄건지)
		$.each(data,function(index, board) {
							//function (인덱스번호,data안에 들어있는 각각의 값들을 어떤 변수로 받아줄건지)
							console.log(data);
							blist += "<tr class ='innerContent'>"
							blist += "<td>" + board.idx + "</td>"
							blist += "<td><a href='javascript:viewContent("
									+ board.idx + ")'>" + board.title
									+ "</a></td>"
							blist += "<td>" + board.writer + "</td>"
							blist += "<td>" + board.indate + "</td>"
							
							if("${mvo.id}"==board.id){
							
							blist += "<td><button onclick ='boardDelete("+ board.idx+")' class = 'btn-sm btn-danger btn'>삭제</button></td>"

							}else{
								
							blist += "<td><button onclick ='boardDelete("+ board.idx+")' class = 'btn-sm btn-danger btn'>삭제</button></td>"
							
							}
							
							
							
							blist += "</tr>"

							blist += "<tr class='innerContent' id ='vc"+board.idx+"' style='display:none'>"
							blist += "<td colspan='5'>"
							blist += "<textarea row ='5' class ='form-control'>"
									+ board.contents + "</textarea>"
							blist += "<br>"
							blist += "<button onclick='boardUpdate("
									+ board.idx
									+ ")' class='btn-primary btn btn-sm'>수정</button>"
							blist += "&nbsp<button class='btn-warning btn btn-sm'>닫기</button>"

							blist += "</td>"
							blist += "</tr>"

						})

		// heading 이라는 class 명을 가진 tr 태그 다음에 blist 를 추가하기 ! 
		$('.innerContent').remove();
		$('.heading').after(blist);
	}

	function goInsert() {

		if ($('#Insertview').css('display') == 'none') {
			//$('#Insertview').css('display','block');
			$('#Insertview').slideDown();
		} else {
			//$('Insertview').css('display','none');
			$('#Insertview').slideUp();
		}

	}

	// data: 보내줄 데이터 객체 형식으로 넘겨주기 
	//1. 글쓰기 버튼을 클릭했을때 (boardInsert)
	function boardInsert() {
		//2. form 태그 안쪽에 있는 input 2개, textarea 안에 들어있는 값을 가져와서 
		//form태그 안에 있는 input , textarea 등등에 name 값이 달려 있는 직렬화 함수를 만든다 .

		var formdata = $('#frm').serialize();

		//3. boardInsert.do로 해당하는 데이터를 보내주기 

		$.ajax({
			url : '${cpath}/boardInsert.do',
			type : 'post',
			// 받아올 데이터 타입 지정 
			data : formdata,
			// 성공했을때 실행할 함수 
			success : loadList,
			//실패했을때 실행할 함수 
			error : function() {
				alert('에러!');
			}
		});

		$('.close').trigger('click');
		$('#Insertview').slideUp();
	}
	function boardDelete(idx) {
		//2. form 태그 안쪽에 있는 input 2개, textarea 안에 들어있는 값을 가져와서 
		//form태그 안에 있는 input , textarea 등등에 name 값이 달려 있는 직렬화 함수를 만든다 .

		//3. boardInsert.do로 해당하는 데이터를 보내주기 

		$.ajax({
			url : '${cpath}/boardDelete.do',
			type : 'post',
			// 받아올 데이터 타입 지정 
			data : {
				'idx' : idx
			},
			// 성공했을때 실행할 함수 
			success : loadList,
			//실패했을때 실행할 함수 
			
			
		});
	}
	function viewContent(idx) {
		if ($('#vc' + idx).css('display') == 'none') {

			$('#vc' + idx).css('display', 'table-row')
		} else {
			$('#vc' + idx).css('display', 'none')
		}
	}
	function boardUpdate(idx) {

		var contents = $('#vc' + idx + ' textarea').val();

		$.ajax({
			url : '${cpath}/boardUpdate.do',
			type : 'post',
			data : {
				'idx' : idx,
				'contents' : contents
			},

			success : loadList,

			error : function() {
				alert('실패!');

			}
		})
		
		
	}
	</script>
</body>
</html>

