<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 <%
    Class.forName("com.mysql.cj.jdbc.Driver");
    String URL = "jdbc:mysql://localhost:3306/spring5fs";
    String sql = "select * from emp where empno = "+ request.getParameter("empno");
    int empno = 0;
    String ename = "";
    String job = "";
try(Connection conn = DriverManager.getConnection(URL, "root", "1234");
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		) {
	if(rs.next()){
		empno = rs.getInt("empno");
		ename = rs.getString("ename");
		job = rs.getString("job");
		//System.out.println(empno + ", "+ ename + ", " + job);
	}
}catch(Exception e){
		e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp 수정</title>
</head>
<body>
<form action="updateEmp.jsp">
사원번호: <input type="text" name="empno" value="<%=empno %>" /><br/>
이름: <input type="text" name="ename" value="<%=ename %>"/><br/>
직업: <input type="text" name="job" value="<%=job %>"/><br/>
<input type="submit" value="수정"/>
</form>
</body>
</html>