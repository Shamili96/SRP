<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="javax.sql.*" %>
<!DOCTYPE html>

<html>
<head>
<title>TYRE SOLUTIONS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style1.css" rel="stylesheet" type="text/css" />
<script>
function doit(){
if (!window.print){
alert("You need NS4.x to use this print button!")
return
}
window.print()
}
</script>
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
}

#customers td, #customers th {
    font-size: 1em;
    border: 1px solid #98bf21;
    padding: 3px 7px 2px 7px;
}

#customers th {
    font-size: 1.1em;
    text-align: left;
    padding-top: 5px;
    padding-bottom: 4px;
    background-color: #A7C942;
    color: #ffffff;
}
}
</style>
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
ResultSet rs=st.executeQuery("select * from salesorder where custname='"+cname+"' order by et desc limit 1");
String orderid="",eid="",custname="",phone="",email="",door="",street="",city="",state="",opt="",model="",date1="",type1="";
int price=0;
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

ResultSet sel=st.executeQuery("select * from pricedb where type='"+model+"'");
while(sel.next())
{
	type1=sel.getString(1);
	price=sel.getInt(2);
}

//out.println(type1+" "+price);

amt=number*price;

//out.println("\nTotal amount:"+amt);
%>
<body>
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1><a href="index.html">TYRE SOLUTIONS</a></h1></div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar"><div class="submb">
        <div class="article">
          <h2><center>ORDER FORM:</center></h2>
		    
        </div>
		<table  id="customers" align="left">
		<tr>
		<th>
		<p><font color="black">BILL TO: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></p>
		</th>
		</tr>
		<tr>
		<td>
		<p><%=custname%>,<br>
		<%=door%>,<%=street%><br>
		<%=city%>,<br>
		<%=state%>.</p>
		</td>
		</tr>
		</table>
		<table  id="customers" align="right">
		<tr>
		<th>
		<p><font color="black">SHIP TO: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font></p>
		</th>
		</tr>
		<tr>
		<td>
		<p><%=custname%>,<br>
		<%=door%>,<%=street%><br>
		<%=city%>,<br>
		<%=state%>.</p>
		</td>
		</tr>
		</table>
		<br><br><br><br><br><br><br><br><br><br><br><br>
		
		<table id="customers">
		<tr>
		<th>Description &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
		<th>Quantity</th>
		<th>Unit price</th>
		<th>Amount</th>
		</tr>
		<tr>
		<td><p>Model:<%=model%><br>Orderid:<%=orderid%><br>Order Date:<%=date1%></p><br><br><br><br><br></td>
		<td><%=number%><br><br><br><br><br></td>
		<td><%=price%><br><br><br><br><br></td>
		<td><%=amt%><br><br><br><br><br></td>
		</tr>
		<tr>
		<td><p><i>Thank you for your business.......</p></td>
		<td colspan="3">Total: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%=amt%></td>
		</tr>
		</table>
<br><br>
<button onclick="doit()">save</button><br><br>

<%
PreparedStatement bps=con.prepareStatement("insert into billdb values(?,?,?,?,?,?,?)");
bps.setString(1,orderid);
bps.setString(2,eid);
bps.setString(3,custname);
bps.setString(4,opt);
bps.setString(5,model);
bps.setInt(6,number);
bps.setInt(7,amt);

int bi=bps.executeUpdate();
//out.println("\nInsert status:"+bi);
%>
<form name="myForm" action="Mailcheck.jsp" method="post">
<input type="hidden" name="flag" value="<%=flag%>">
<input type="hidden" name="empid" value=<%=empid%>">
<input type="submit" value="BACK">
</form>
<%
}
catch(Exception e)
{
out.println("Exception : " + e.getMessage() + "");
}
%>
      </div></div>
      <div class="clr"></div>
    </div>
  </div>

  </div>
</body>
</html>
