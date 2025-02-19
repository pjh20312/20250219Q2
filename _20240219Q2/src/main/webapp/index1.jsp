<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%
   Class.forName("com.mysql.cj.jdbc.Driver");
   String URL = "jdbc:mysql://localhost:3306/spring5fs";
   String sql = "select * from emp";
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp내용</title>
</head>
<body>
<a href="formEmp.jsp"> emp입력</a>
<table border="1">
<%
try(Connection conn = DriverManager.getConnection(URL, "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		) {
	while(rs.next()){
%>
<tr>
<td><a href="upFormemp.jsp?empno=<%=rs.getString("empno") %>"><%=rs.getString("empno") %></a>
</td><td><%=rs.getString("ename") %></td><td><%=rs.getString("job") %></td><td><%=rs.getString("sal") %></td>
<td><%=rs.getString("deptno") %></td>
<td><a href="deleteEmp.jsp?empno=<%=rs.getString("empno") %>">삭제</a></td>
<tr>
<%
	}
} catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</body>
</html>