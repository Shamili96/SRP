<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%try{

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root");
out.println("Connection created"); 
String username=request.getParameter("username"); 
String pwd=request.getParameter("pwd"); 
String category=request.getParameter("category"); 
String email=request.getParameter("email"); 
out.println(username);
PreparedStatement ps=con.prepareStatement("insert into salesreg values(?,?,?,?)");
ps.setString(1,username);
ps.setString(2,pwd);
ps.setString(3,category);
ps.setString(4,email);
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
<jsp:forward page="Register1.html"></jsp:forward>
<html>
<body>
Hello World!
</body>
</html>







 