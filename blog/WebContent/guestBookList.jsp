<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="goodee.vo.Guestbook" %>
<%@ page import ="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/sketchy/bootstrap.min.css" integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R" crossorigin="anonymous"><title>게스트북 리스트</title>
</head>
<body>
	<!-- 1 수집request과 전처리 -->
	<%
		request.setCharacterEncoding("UTF-8");
		int rowPerPage=5;
		int currentPage = 1;
		if ( request.getParameter("currentPage") != null){
		//request.getParameter("currentPage");데이터 수집
		currentPage = Integer.parseInt(request.getParameter("currentPage"));//전처리, 숫자로 
		}
		
		int beginRow = (currentPage -1)* rowPerPage;
	%>
	<!-- 끝 -->
	
	
	<!-- 2 처리 (DB table 핸들링)-->
	<%
		Class.forName("org.mariadb.jdbc.Driver");
		//길어지니깐 짧게하려고 변수지정.
		String url ="jdbc:mysql://localhost:3306/blog";
		String user = "root";
		String pwd = "java1004";
		Connection conn = DriverManager.getConnection(url, user, pwd);
		System.out.println("DB명 : blog 불러오기");
		/*
		*String sel = "SELECT guestbook_no, guestbook_content, guestbook_member, guestbook_date";
		*String from = 	" FROM guestbook";
		*String order = " ORDER BY guestbook_date desc";
		*String limit = " LIMIT ?, ?"
		PreparedStatement stmt = conn.prepareStatement(sel+from+order+limit);
		*/
		
		//데이터 가져오는 프리페얼드스태이트먼트 + 리절트셋
		String sql = "SELECT guestbook_no, guestbook_content, guestbook_member, guestbook_date FROM guestbook ORDER BY guestbook_date desc LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1,beginRow);
		stmt.setInt(2,rowPerPage);
		System.out.println("불러오는 쿼리 SELECT : "+stmt);
		ResultSet rs = stmt.executeQuery();
		//Guestbook이라는 이름의 리스트 (rs를 그대로 옮길 표준배열)
		//for each문으로 모든데이터셋에 맞는 표준포맷으로.
		ArrayList<Guestbook> list = new ArrayList<>(); // 배열을 만들고
		while(rs.next() ){ //rs.next가 있을경우
			Guestbook g = new Guestbook();
			g.guestbookNo = rs.getInt("guestbook_no");
			g.guestbookContent = rs.getString("guestbook_content");
			g.guestbookMember = rs.getString("guestbook_member");
			g.guestbookDate = rs.getString("guestbook_date");
			list.add(g); //게스트의 no, content, member, date 를 받은 g를 추가함.
		}
		//리스트는 믿는걸로.
		
		//전체글수 가져오는 가져오는 프리페얼드스태이트먼트 + 리절트셋
		PreparedStatement stm2 = conn.prepareStatement("select count(*) from guestbook");
		System.out.println("카운트 쿼리 SELECT : "+stmt);
		ResultSet rs2 = stm2.executeQuery();
        
        int totalRow=0;
        if(rs2.next()){//rs.next가 있을경우        
            totalRow=rs2.getInt("count(*)");
        }
    	int lastPage = totalRow/rowPerPage;//몫만 가짐.
    	if (totalRow% rowPerPage !=0){//전체글수에서 똑떨어지지 않으면
            lastPage += 1; //한페이지도 추가함. 잘안씀 lastPage+1; lastPage++
    	} //전체글수로 페이지 숫자 구함
    	
	%>
	<!-- 끝 -->
	
	
	<!-- 3 출력-->
		<h1>guest Book List</h1>
		</div>
			<!-- Navbar(메뉴) -->
			<jsp:include page ="/blogMenu.jsp"></jsp:include>
		</div>
		
		<table class="table">
			<tr class="table-primary">
				<td>번호</td>
				<td>사용자</td>
				<td>내용</td>
				<td>날짜</td>
			</tr>
		<%
			for (Guestbook g : list){
		%>	
				<tr class="table-secondary">
					<td><%=g.guestbookNo %></td>
					<td><%=g.guestbookMember %></td>
					<td><%=g.guestbookContent %></td>
					<td><%=g.guestbookDate %></td>
				</tr>
			
		<%		
			}//for list 끝
		%>	
			<tr>
				<td colspan="4">
					<form align="center" action="<%=request.getContextPath()%>/guestBookInsertAction.jsp" method="post">
					<div class="container" >
								<table class="table table-borderless table-secondary" style="width:100px">
									<tr><!-- 0 -->
										<td colspan="6"> 
										<h1>comment</h1>
										</td>
									</tr>
									<tr> <!-- 1 -->
										<td colspan="6"> 
											<textarea class="input-group-text" name ="guestBookContent" rows="5" cols="100"></textarea>
										</td>
									</tr>
									
									<tr> <!-- 2 -->
										<td>
											member
										</td>
										
										<th>
											<input class="input-group-text" type="text" name="guestBookMember">
										</th>
										
										<td>
											pw
										</td>
										
										<th>
											<input class="input-group-text" type="password" name="guestBookPw">
										</th>
										
										<td>
											<button class="btn btn-success" type="submit">남기기</button>
										</td>
										<td colspan="5">
											<a class="btn btn-danger" href="<%=request.getContextPath()%>/boardDeleteAction.jsp">삭제</button>
									</tr>
									
									
								</table>
						</div>
						</form>
					</td>
			</tr>
					
		
			<tr>
				<!-- 페이징메뉴 -->
				<td colspan="4">
				<div class="btn-group btn-group-toggle">
					<a class="btn btn-secondary active"  href="<%=request.getContextPath()%>/guestBookList.jsp?currentPage=1">댓글홈</a>
					<a class="btn">현재페이지 : <%=currentPage%></a>
					<%
			         	if(currentPage > 1){//현재 페이지가 1보다 크면 이전이 나오게 해라.
			    	%>
			            <a class="btn btn-warning"  href="<%=request.getContextPath()%>/guestBookList.jsp?currentPage=<%=currentPage-1%>">이전</a>
			     	<%      
			         } //이전 if문끝
			   		%>
				    
				    <%
				    	if(currentPage<lastPage) {
			        %>
			            <a class="btn btn-info" href="<%=request.getContextPath()%>/guestBookList.jsp?currentPage=<%=currentPage+1%>">다음
			            </a>
			        <% 
			        } //다음 if문 끝
			        %>
	       	 	</div>
	        	</td>
	        	<!-- 페이징메뉴끝 -->
	        </tr>
        	
        
		</table>
	<!-- 끝 -->
</body>
</html>