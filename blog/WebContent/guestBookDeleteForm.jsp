<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guest BookDeleteForm</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/sketchy/bootstrap.min.css" integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" crossorigin="anonymous">
</head>
<body>
	<!-- 3 출력-->
	<h1>boardDelete</h1>
	<form action="<%=request.getContextPath()%>/guestBookDeleteAction.jsp" method="post">
		<table class="table">
			<tr>
				<td>no : </td>
				<td> <input type="text" name="guestBookNo"></td>
			</tr>
			<tr>
				<td>member :</td> 
				<td> <input type="text" name="guestBookMember"></td>
			</tr>
			<tr>
				<td>pw : </td>
				<td> <input type="password" name="guestBookPw"></td>
			</tr>
			<tr>
				<td colspan="2">
				<button class="btn btn-danger" type="submit">삭제</button>
				</td>
		</table>
	</form>
</body>
</html>
