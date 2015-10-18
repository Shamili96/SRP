<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,java.text.*"%>
<%try{

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root");
out.println("Connection created"); 
String name=request.getParameter("name"); 
String phone=request.getParameter("phone");
String org=request.getParameter("org"); 
String email=request.getParameter("email"); 
String message=request.getParameter("message"); 
PreparedStatement ps=con.prepareStatement("insert into feedback values(?,?,?,?,?)");
ps.setString(1,name);
ps.setString(2,phone);
ps.setString(3,org);
ps.setString(4,email);
ps.setString(5,message);
int s=ps.executeUpdate();
System.out.print(s);
out.println("Another record inserted successfully");

			con.close();
			out.println("Hello World");
 }
 catch(Exception e)
{
	out.println("Connection not created"+e.getMessage());
	e.printStackTrace();
}
%>
<jsp:forward page="Feedback.html"></jsp:forward>
<html>
<body>
Hello World!
</body>
</html>







 