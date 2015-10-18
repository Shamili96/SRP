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
if(opt.equals("Retread"))
{
	if(model.equals("truck"))
	{
		amt=number*300;
	}
	else if(model.equals("minitruck"))
	{
		amt=number*500;
	}
	else if(model.equals("van"))
	{
		amt=number*1000;
	}
	else if(model.equals("car"))
	{
		amt=number*1000;
	}else if(model.equals("auto"))
	{
		amt=number*2000;
	}
	if(model.equals("tractor"))
	{
		amt=number*300;
	}
	else if(model.equals("smallotr"))
	{
		amt=number*500;
	}
	else if(model.equals("largeotr"))
	{
		amt=number*1000;
	}
	else if(model.equals("extralargeotr"))
	{
		amt=number*1000;
	}else if(model.equals("ultralargeotr"))
	{
		amt=number*2000;
	}
}
//out.println("\nTotal amount:"+amt);
%>
<body>
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1><a href="index.html">TYRE SOLUTIONS</a></h1></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>HOME</span></a></li>
          <li><a href="Products.html"><span>PRODUCTS</span></a></li>
          <li><a href="About.html"><span>ABOUT US</span></a></li>
          <li><a href="Contact.html"><span>CONTACT US</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar"><div class="submb">
        <div class="article">
          <h2>BILL:</h2>
		    
        </div>
        <table id="customers">
		<tr>
			<th>Orderid</th>
			<td><%=orderid%></th>
		</tr>
		<tr>
			<th>Model</th>
			<td><%=model%></th>
		</tr>
		<tr>
			<th>No. of orders</th>
			<td><%=number%></th>
		</tr>
		<tr>
			<th>Amount</th>
			<td><%=amt%>
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
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Sidebar Menu</h2>
          <ul class="sb_menu">
            <li><a href="Orderform.jsp">Place New Order</a></li>
            <li><a href="Salesmanform.jsp">Submit Daily Records</a></li>
            <li><a href="Empmonthbonus.jsp">Monthly Bonus</a></li>
            <li><a href="Empyearbonus.jsp">Yearly Bonus</a></li>
          </ul>
        </div>
        
      </div>
      <div class="clr"></div>
    </div>
  </div>

  <div class="fbg">
    <div class="fbg_resize">
      <div class="col c1">
        <h2>About</h2>
        <img src="images/white.jpg" width="64" height="64" alt="pix" />

		<p>Tyre solutions committed to design, engineer, manufacture, and deliver superior quality pre cured tread rubber and other retreading related materials.
	<a href="About.html">Learn more....</a></p>
        <div class="clr"></div>
      </div>
      <div class="col c2">
        <h2>Products</h2>
        <p>1.PRECURED TREAD RUBBER</p>
<p>2.CAMEL BACK</p>
<p>3.CUSHION GUM</p>
<p>4.ROPE RUBBER</p>
<p>5.BVC</p>
<p>6.REPAIR PATCHES.<a href="Products.html">Learn more....</a></p>

      </div>
      <div class="col c3">
        <h2>Image Gallery</h2>
        <a href="#" class="nobg"><img src="images/pix1.jpg" width="64" height="64" alt="ad" class="ad" /></a>
        <a href="#" class="nobg"><img src="images/pix2.jpg" width="64" height="64" alt="ad" class="ad" /></a>
        <a href="#" class="nobg"><img src="images/pix3.jpg" width="64" height="64" alt="ad" class="ad" /></a>
        <a href="#" class="nobg"><img src="images/pix4.jpg" width="64" height="64" alt="ad" class="ad" /></a>
        <a href="#" class="nobg"><img src="images/pix5.jpg" width="64" height="64" alt="ad" class="ad" /></a>
        <a href="#" class="nobg"><img src="images/pix6.jpg" width="64" height="64" alt="ad" class="ad" /></a>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  </div>
</body>
</html>
