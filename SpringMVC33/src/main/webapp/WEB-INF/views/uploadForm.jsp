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


	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">Panel Heading</div>
			<div class="panel-body">
				<form class="form-horizontal" action="${cpath}/upload.do" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-sm-2" for="email">다중파일 업로드하는 작업:</label>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="email"
								placeholder="Enter email">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="name">이름 :</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="Enter password">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
						<input onclick="fileAdd()"type = "button" class ="btn btn-primary btn-sm" value="파일추가">	
							<div id ="bspace"></div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Submit</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-body">Panel Content</div>
		</div>
	</div>
<script>
	//file 이 여러개가 되었을 때 구분할수 있게하는 숫자를 하나 만들어줌 
	var cnt = 1;
	
	function fileAdd() {
	
		
		$('#bspace').append("<br> <input type='file' name='file"+cnt+"'>");
			cnt++;
		}
		
	
</script>

</body>
</html>