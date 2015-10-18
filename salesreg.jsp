<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
Statement st= con.createStatement(); 
out.println("Connection Created");
String QueryString = "create table salesreg(name VARCHAR(40) primary key,pwd VARCHAR(40), category VARCHAR(40),email VARCHAR(40));";
st.executeUpdate(QueryString);
out.println("Table Created");
con.close();
 }
catch(Exception e)
{
	out.println("Connection not created"+e.getMessage());
	e.printStackTrace();
}
%>
<html>
<body>
Hello World!
</body>
</html>






 