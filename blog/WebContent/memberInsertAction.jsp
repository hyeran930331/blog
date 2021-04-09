<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<%
	request.setCharacterEncoding("UTF-8");
	String memberId= request.getParameter("member_id");
	//memberID라는 문자열 변수에 = member_id로 name된 값을 넣어라.
	//이하 반복.
	String memberPw= request.getParameter("member_pw");
	
	String memberName= request.getParameter("member_name");
	String memberEmail=request.getParameter("member_email");
	//input name 을 잘봐야된다!
%>

<%
	//if (memberId==null || memberPw==null || memberName==null || memberEmail==null)
	//{ 
		//response.sendRedirect(request.getContextPath()+"/memberInsertForm.jsp?currentPage=1");
		// 멤버인설트 페이지가 나오게한다.
	//} 
	//else {
%>
	<%
		//그다음 쿼리 실행
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
		PreparedStatement stmt = conn.prepareStatement("insert into member(member_id, member_pw, member_name, member_email, member_date) values(?,?,?,?,now())");
		//insert into 테이블 명! 데이터 베이스 명 말고
		//insert into 테이블(변수) 값 ( now() ); 나우뒤에 괄호하나 안침
		stmt.setString(1, memberId);
		stmt.setString(2, memberPw);
		stmt.setString(3, memberName);
		stmt.setString(4, memberEmail);
		int row = stmt.executeUpdate();
	%>
	<%
		if (row == 0){
			//만약 0개를 했으면=실패.
			response.sendRedirect(request.getContextPath()+"/memberInsertForm.jsp");
			//다시 보내라
		}else{
			//0 이 아니라면 = 성공.
			response.sendRedirect(request.getContextPath()+"/memberList.jsp");	
		}
	//}
%>

