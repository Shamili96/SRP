<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,java.text.*"%>
<%try{

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root");
out.println("Connection created"); 
String eid=request.getParameter("eid"); 
String ename=request.getParameter("ename"); 
String phone=request.getParameter("phone"); 
String email=request.getParameter("email"); 
String salary=request.getParameter("salary"); 
String age=request.getParameter("age"); 
String doj=request.getParameter("doj"); 
PreparedStatement ps=con.prepareStatement("insert into empdb values(?,?,?,?,?,?,?)");
ps.setString(1,eid);
ps.setString(2,ename);
ps.setString(3,phone);
ps.setString(4,email);
ps.setString(5,salary);
ps.setString(6,age);
ps.setString(7,doj);
int s=ps.executeUpdate();
System.out.print(s);
//Statement st= con.createStatement(); 

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
<jsp:forward page="Adminhome.jsp"></jsp:forward>
<html>
<body>
Hello World!
</body>
</html>







 