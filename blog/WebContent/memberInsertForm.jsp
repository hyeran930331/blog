<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멤버 인설트폼</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
</head>
<body class="container">

<form action="<%=request.getContextPath()%>/memberInsertAction.jsp" method="post">
<!-- 액션앞에서 <%=request.getContextPath()%>/ 패스 가져오는 주소가 필요합니다. -->
	
	<h1> member InsertForm</h1>

	<table class="table table-borderless"> <!-- 4tr 2td -->
	
		<tr> <!-- 1 -->
			<th> 아이디 </th>
			<td> <input type="text" name="member_id" placeholder="필수"> 	</td>
		</tr>
		
		<tr> <!-- 2 -->
			<th> 비밀번호	</th>
			<td> <input type="password" name="member_pw"> 	</td>
		</tr>
		
		<tr><!-- 3 -->
			<th> 이름	</th>
			<td> <input type="text" name="member_name"> </td>
		</tr>
		
		<tr><!-- 4 -->
			<th> 이메일 	</th>
			<td> <input type="text" name="member_email">	</td>
		</tr>
		
		<tr>
			<td>
				<a class="btn btn-info" href="<%=request.getContextPath()%>/memberList.jsp?currentPage=1">첫 페이지로 </a>
			</td>
			<td>
				<button type="submit" class="btn btn-primary"> 가입</button>
			</td>
		</tr>
	</table>
	
</form>


</body>
</html>