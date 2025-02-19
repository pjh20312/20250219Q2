<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%
String empno = request.getParameter("empno");
String ename = request.getParameter("ename");
String job = request.getParameter("job");
if(!"".equals(empno)&&!"".equals(ename)&&!"".equals(job)){
	String URL = "jdbc:mysql://localhost:3306/spring5fs";
	String sql = "update empno set ename = + '" + ename + ", job = '" +job +"' where empno = " + empno;
	Class.forName("com.mysql.cj.jdbc.Driver");

	try (Connection conn = DriverManager.getConnection (URL, "root", "1234");
	 Statement stmt = conn.createStatement();
		)
	{

  	stmt.executeUpdate(sql);
	}catch(Exception e){
	e.printStackTrace();
 }
}
response.sendRedirect("index1.jsp");
%>
