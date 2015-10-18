<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
Statement st= con.createStatement(); 
out.println("Connection Created");
String QueryString = "create table billdb(orderid VARCHAR(40),eid VARCHAR(40),custname VARCHAR(20),option1 VARCHAR(10),model VARCHAR(10),number INT,amount INT);";
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






 