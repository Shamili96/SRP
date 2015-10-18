<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%

boolean status=false;
try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
out.println("\nConnection created");
String username=request.getParameter("username");
System.out.print(username);
String userpass=request.getParameter("pwd");
String category=request.getParameter("category");
PreparedStatement ps=con.prepareStatement("select * from salesreg where name=? and pwd=? ");
ps.setString(1,username);
ps.setString(2,userpass);
ResultSet rs=ps.executeQuery();
status=rs.next();
if(status){
System.out.print("hi");
username=rs.getString(1);
session.setAttribute("username",String.valueOf(username));
session.setAttribute("islogin","plz sign in first");
session.setAttribute("category",category);
if(category.equals("Manager"))
{
%>
<jsp:forward page="Managehome.jsp"></jsp:forward>
<%
}
else if(category.equals("Salesman"))
{
%>
<jsp:forward page="Salesoption.html"></jsp:forward>
<%
}
else if(category.equals("admin"))
{
%>
<jsp:forward page="Adminhome.jsp"></jsp:forward>
<%
}
else if(category.equals("Customer"))
{
%>
<jsp:forward page="Products.html"></jsp:forward>
<%
}
else
{
%>
<jsp:forward page="home.html"></jsp:forward>
<%
}
}
else{
System.out.print("hi");
request.setAttribute("Error","Sorry! Username or Password Error. plz Enter Correct Detail or Register");
session.setAttribute("Loginmsg","plz sign in first");
%>
<jsp:forward page="Login.html"></jsp:forward>
<%
}
}
catch(Exception e){
out.println("Connection not created"+e.getMessage());
e.printStackTrace();
}

%>


