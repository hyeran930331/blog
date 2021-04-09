<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String memberId = request.getParameter("memberId");
	String memberPw = request.getParameter("memberPw");
		
System.out.println("Id : " + memberId);
System.out.printf("pw : %s\n",memberPw);
//%s 뒤에변수값을 가져다 s자리에 넣는다. 중간에 쓰일때 유용. \n한줄 띄운다/
	
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/blog","root","java1004");
//db 를 불러오고
//명령=쿼리를 실행하는데
	String sql = "delete from member where member_id= ? and member_pw= ?";
	PreparedStatement stmt = conn.prepareStatement(sql);
	stmt.setString(1, memberId);
	stmt.setString(2, memberPw);
	System.out.println("stmt : "+stmt);
//성공하면 stmt.executeUpdate()는 1이상. 아니면 0
	//int row = stmt.executeUpdate();
	int row = stmt.executeUpdate();
System.out.println("stmt.executeUpdate :"+ stmt.executeUpdate()); //가 1이 됨.
	//삭제 확인하려고
	
	if(row == 0 ){
		//삭제실패하면 안되면 0이 되니깐 이겠져
		response.sendRedirect(request.getContextPath()+"/memberDeleteForm.jsp?memberId="+memberId);
	}
	else {
		 response.sendRedirect(request.getContextPath()+"/memberList.jsp?currentPage=1");
		//삭제성공하면
	}
%>