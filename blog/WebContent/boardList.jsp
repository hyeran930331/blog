<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!--page전체에 import불러오기 ="java패키지. sql클래스. *모든메소드/기능,액션 -->
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>boardList</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<p align="center">
	<img src="<%=request.getContextPath()%>/img/gdj34.PNG">
	</p>
</head>
<body>
	<div class="container" align="center">
		<h1>board List</h1>
		
		<div class="btn-group btn-group-toggle"><!-- 상단 메뉴 -->
			<a href="<%=request.getContextPath()%>/boardList.jsp?currentPage=1">
				<img src="<%=request.getContextPath()%>/img/home.PNG" width="25" height="25">
			</a>
			<a href="<%=request.getContextPath()%>/boardInsertForm.jsp">
				<img src="<%=request.getContextPath()%>/img/write.PNG" width="25" height="25">
			</a>
			<%
				String[] submenu = {"html","css","javascript","java","jsp","sql","spring","rdbms"};
				for(String sm : submenu) {
					//for 에서 : 의 의미?
			%>
				<a class="btn btn-light" href = "<%=request.getContextPath()%>/boardList.jsp?boardCategory=<%=sm%>" ><%=sm%></a>
			<%
				}
			%>
		</div> <!-- 상단메뉴 끝 -->
		
		<%	
			Class.forName("org.mariadb.jdbc.Driver");
			//마리아 디비 드라이브 검색
			//org켠다 mariadb를 jdbc Drive자동으로 켜지게 = 마리아db 준비
		System.out.print("\n"); 
//1단계 드라이브 불러오기 성공하면 띄어쓰기 콘솔에 출력
			
			String url ="jdbc:mysql://localhost:3306/blog";
			//마리아 디비 유알엘 검색
			String user = "root";
			String pwd = "java1004";
			//길어지니깐 짧게하려고 변수지정.
			Connection conn = DriverManager.getConnection(url, user, pwd);
		System.out.println(conn);
		//클래스@위치
		System.out.println("사원들 DB:연결 성공");
//2단계 DB불러오기 성공 콘솔에 출력
		
		
//여기까지 모든 페이지 동일



		int currentPage = 1;
         //현재페이지
		if(request.getParameter("currentPage") != null){
		//현재페이지가 널값이 아니라면
         currentPage = Integer.parseInt(request.getParameter("currentPage"));
		//integer.parseInt?
      }
		String boardCategory = request.getParameter("boardCategory");
		// 보드 카테고리 값을 받자.
		//이런게 가능한가? 
	System.out.println("boardCategory : "+boardCategory);
		int rowPerPage = 10;
		System.out.println("rowPerPage : "+rowPerPage);

         //한페이지에 몇행씩 볼래? 고정
		int beginRow = (currentPage-1)*10;
         //시작은 0
         System.out.println("beginRow : "+beginRow);


			String sql = null;
			PreparedStatement stmt = null;
			if (boardCategory == null) 
				//만약 보드카테고리 가 정보가 없다면
				{
					sql = "select board_no, board_category, board_title, board_content, board_user, board_date from board order by board_no desc limit ?,?";
					stmt = conn.prepareStatement(sql);
					stmt.setInt(1,beginRow);
					stmt.setInt(2,rowPerPage);
					//그냥 현재 페이지 출력
				} else { //카테고리 값이 있으면
					sql = "select board_no, board_category, board_title, board_user from board where board_category= ? order by board_no desc limit ?, ?";
					//from테이블:쿼리(명령) 실행해서 select 변수 값을 beginRwo 부터 rowPerPage 만큼 가져옴)
					//where어디냐면 board_category= 보드카테고리인것 만!
					//order순서 board_no 이 desc숫자큰 순서
					stmt = conn.prepareStatement(sql);
					//stmt = conn.prepareStatement(sql); 을 꼭 먼저 했어야 한다.
					stmt.setString(1,boardCategory);
					stmt.setInt(2,beginRow);
					stmt.setInt(3,rowPerPage);
				}
		System.out.println("from테이블:쿼리(명령) 실행해서 select 변수 값을 beginRwo 부터 rowPerPage 만큼 가져옴");
//3단계 완료되었는지 확인	
			ResultSet rs = stmt.executeQuery();
		System.out.println(rs);
//4단계 완료되었는지 확인	
			
//여기까지 sql stmt rs 동일해도 어차피 한페이지안에서니깐 충돌없음
//PreparedStatement ResultSet 메서드는 위에서 불러옴.
		
		%>
		
		<table class="table table-hover">
			<thead>
				<tr>
					<th>board_no</th>
					<th>board_category</th>
					<th>board_title</th>
					<th>board_user</th>
				</tr>
			</thead>
			<tbody>
				<%
					while(rs.next()){
				%>
						<tr>
							<td><%=rs.getString("board_no")%></td>
							<td><%=rs.getString("board_category")%></td>
							<td><a href="<%=request.getContextPath()%>/boardOne.jsp?boardNo=<%=rs.getInt("board_no")%>"><%=rs.getString("board_title")%></a></td>
							<td><%=rs.getString("board_user")%></td>
						</tr>
				<%
					}
				%>
			</tbody>
		</table>
</div>		
	<!-- 하단메뉴 -->
		<div class="btn-group btn-group-toggle">
			<a class="btn btn-secondary active"  href="<%=request.getContextPath()%>/boardList.jsp?currentPage=1">홈(첫페이지로)</a>
			<a class="btn">현재페이지 : <%=currentPage%></a>
			
			 <%
		         if(currentPage > 1){
		         //현재 페이지가 1보다 크면 이전이 나오게 해라.
		      %>
		            <a class="btn btn-secondary"  href="<%=request.getContextPath()%>/boardList.jsp?currentPage=<%=currentPage-1%>">이전</a>
		      <%      
		         }
		      %>
		      
		      
		      <%
		         PreparedStatement stm2 = conn.prepareStatement("select count(*) from board");
		         ResultSet rs2 = stm2.executeQuery();
		         int totalRow=0;
		
		         if(rs2.next()){        
		                totalRow=rs2.getInt("count(*)");
		                        }
		        int lastPage = totalRow/rowPerPage;
		        
		    
if (totalRow% rowPerPage !=0){
		                lastPage += 1; // 잘안씀 lastPage - lastPage+1; lastPage++
		        }
		         //현재 페이지가 전체게시글/페이지행 몫이 딱 떨어지거나. 몫보다 클때.
		         //select count(*) from board
		         //보드 케이블의 총 행수 구하는 쿼리.
		
		      if(currentPage<lastPage) {
		        %>
		            <a class="btn btn-secondary" href="<%=request.getContextPath()%>/boardList.jsp?currentPage=<%=currentPage+1%>">다음
		            </a>
		        <% } %>
        </div>
        <!-- 하단메뉴끝 -->

</body>
</html>