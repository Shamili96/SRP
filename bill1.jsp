<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="javax.sql.*" %>
<html>
<head>
<title>TVS TREAD</title>
<link href="style2.css" rel="stylesheet" type="text/css"/>
<script>
function doit(){
if (!window.print){
alert("You need NS4.x to use this print button!")
return
}
window.print()
}
</script>
</head>
<%
  
    try
  {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
//out.println("Connection created"); 
String cname=request.getParameter("custname");
String flag=request.getParameter("flag");
String empid=request.getParameter("eid");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from salesorder where custname='"+cname+"'");
String orderid="",eid="",custname="",phone="",email="",door="",street="",city="",state="",opt="",model="",date1="";
int number=0;
//out.println(cname);
//out.println("\nHello World");
while(rs.next()){
 orderid=rs.getString(1);
 eid=rs.getString(2);
 custname=rs.getString(3);
 phone=rs.getString(4);
 email=rs.getString(5);
 door=rs.getString(6);
 street=rs.getString(7);
 city=rs.getString(8);
 state=rs.getString(9);
 opt=rs.getString(10);
 model=rs.getString(11);
 number=rs.getInt(12);
 date1=rs.getString(13);}
int amt=0;
//String opt="Order";
//out.println(orderid+" "+opt+" "+model+" "+number);
if(opt.equals("Order"))
{
	if(model.equals("Bike"))
	{
		amt=number*300;
	}
	else if(model.equals("Car"))
	{
		amt=number*500;
	}
	else if(model.equals("Lorry"))
	{
		amt=number*1000;
	}
	else if(model.equals("Bus"))
	{
		amt=number*1000;
	}else if(model.equals("JCB"))
	{
		amt=number*2000;
	}
}
else
{
	if(model.equals("Bike"))
	{
		amt=number*150;
	}
	else if(model.equals("Car"))
	{
		amt=number*250;
	}
	else if(model.equals("Lorry"))
	{
		amt=number*500;
	}
	else if(model.equals("Bus"))
	{
		amt=number*500;
	}else if(model.equals("JCB"))
	{
		amt=number*1000;
	}
}
//out.println("\nTotal amount:"+amt);
PreparedStatement bps=con.prepareStatement("insert into billdb values(?,?,?,?,?,?,?)");
bps.setString(1,orderid);
bps.setString(2,eid);
bps.setString(3,custname);
bps.setString(4,opt);
bps.setString(5,model);
bps.setInt(6,number);
bps.setInt(7,amt);

int bi=bps.executeUpdate();

%>
<body>
<div class="header">
<div class="header_resize">
<div class="logo"></div>
<div class="addr"><p>SUNDARAM INDUSTRIES LIMITED<br>
Phone:(+9144) 27452867, (+91) 9841098081<br>
Email:sales@tvstread.com</p>
<div class="clr"></div>
</div>
</div>
<div class="clr"></div>
<div class="contentbg">
<div class="contentsize">
<div class="contents">
<center>
<table border=0">
<tr>
<td><p>BILL TO:</p>
<td>door</td>
</tr>
<tr>
<td></td>
<td>street</td>
</tr>
</center>
<tr>
<td></td>
<td>city</td>
</tr>
</center>
<tr>
<td></td>
<td>state</td>
</tr>
</table><br><br>
<table>
<tr>
<th>Order Id</th>
<th>Description</th>
<th>Quantity</th>
<th>Unit Price</th>
</th>Total Price</th>
</tr>
<tr>
<td><%=
</center>
</div>
<div class="clr"></div>
</div>
</div>
</body>
</html>