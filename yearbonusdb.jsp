<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
Statement st= con.createStatement(); 
out.println("Connection Created");
String QueryString = "create table yearbonusdb(eid VARCHAR(40),year VARCHAR(40),sum INT,bonus FLOAT);";
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






 