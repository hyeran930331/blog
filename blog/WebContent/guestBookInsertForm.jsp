<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 입력폼</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/sketchy/bootstrap.min.css" integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" crossorigin="anonymous">
</head>
<body>
	<h1 align="center">guest BookInsertForm</h1>
	<!-- 3 출력-->
	<!-- Navbar(메뉴) -->
		<jsp:include page ="/blogMenu.jsp"></jsp:include>
		
	<form action="<%=request.getContextPath()%>/guestBookInsertAction.jsp" method="post">
	<div class="container" align="center">
			<table class="table table-borderless table-secondary">
				<tr> <!-- 1 -->
					<td style="text-align:left">
						member
					</td>
					<th>
						<input class="input-group-text" type="text" name="guestBookMember">
					</th>
				</tr>
				
				<tr> <!-- 2 -->
					<td style="text-align:left">
						pw
					</td>
					<th>
						<input class="input-group-text" type="password" name="guestBookPw">
					</th>
				</tr>
				
				<tr> <!-- 3 -->
					<td style="text-align:left">
						content
					</td>
					<th>
						<textarea class="input-group-text" name ="guestBookContent" rows="5" cols="88"></textarea>
					</th>
				</tr>

				<tr style="text-align:center"> <!-- 제일 하단 -->
					<td>
						<a class="btn btn-primary" href="<%=request.getContextPath()%>/guestBookList.jsp?currentPage=1">
							첫 페이지로
						</a>
					</td>
					<td>
						<button class="btn btn-info" type="submit">보내기</button>
					</td>
				</tr>
				
				
			</table>
	</div>
	</form>
</body>
</html>