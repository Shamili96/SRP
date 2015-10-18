<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%try{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
Statement st= con.createStatement(); 
out.println("Connection Created");
String QueryString = "create table salescustorder(orderid VARCHAR(40) primary key,custname VARCHAR(20),phone VARCHAR(40), email VARCHAR(40),door VARCHAR(40),street VARCHAR(40),city VARCHAR(40),state VARCHAR(20),option1 VARCHAR(10),model VARCHAR(10),number INT,date DATE,st DATETIME);";
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






 