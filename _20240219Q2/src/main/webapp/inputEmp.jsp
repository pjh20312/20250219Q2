<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String job = request.getParameter("job");
String sal = request.getParameter("sal");
String deptno = request.getParameter("deptno");

String URL = "jdbc:mysql://localhost:3306/spring5fs";
String sql = "insert into emp(empno, ename, job, sal, deptno) values (" + empno + ", '" + ename + "', '" + job +"', '" + sal + "', '" + deptno + "' )";
Class.forName("com.mysql.cj.jdbc.Driver");

try (Connection conn = DriverManager.getConnection (URL, "root", "1234");
	 Statement stmt = conn.createStatement();
		)
{
  stmt.executeUpdate(sql);
} catch(Exception e){
	e.printStackTrace();
}
response.sendRedirect("index1.jsp");
%>