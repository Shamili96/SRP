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
String date1=request.getParameter("date");
String orders=request.getParameter("orders"); 
String startkm=request.getParameter("skm"); 
String endkm=request.getParameter("ekm"); 
String amount=request.getParameter("amount"); 
//out.println(username);
//out.println(d1);
String ename="";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from empdb where eid='"+eid+"'");
while(rs.next())
{	
	ename=rs.getString(2);
}

PreparedStatement ps=con.prepareStatement("insert into salesrecord values(?,?,?,?,?,?,?)");
ps.setString(1,eid);
ps.setString(2,ename);
ps.setString(3,date1);
//ps.setDate(2,date.valueOf(d1));
ps.setString(4,orders);
ps.setString(5,startkm);
ps.setString(6,endkm);
ps.setString(7,amount);
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
<jsp:forward page="Salesoption.html"></jsp:forward>
<html>
<body>
Hello World!
</body>
</html>







 