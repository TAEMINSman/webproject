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
	<h2>업로드 완료창</h2>
		<table class= "table table-boardered table-hover">
		<div class="panel-heading">다중파일 업로드하는 작업</div>
			<div class="panel-body">
		<tr>
			<td>아이디</td>
			<td>${map.name}</td>
		</tr>
		
		<c:forEach items="${map.fileList}" var="file">
		
		<tr>
			<td>${file}</td>
			<td>파일 다운로드 코드 집어넣기</td>
		</tr>
		</table>
		</c:forEach>
	</div>
	</div>

</body>
</html>