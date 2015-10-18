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
<body>
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1><a href="index.html">TYRE SOLUTIONS</a></h1></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>LOGOUT</span></a></li>
          </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar"><div class="submb">
        <div class="article">
          <h2>ORDER FORM:</h2>
		  
		  <%
  
    try
  {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
//out.println("Connection created"); 
String cname=request.getParameter("custname");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from salescustorder where custname='"+cname+"' order by st desc limit 1");
String orderid="",opt="",model="",type1="",custname="",phone="",email="",door="",street="",city="",state="",date1="";
int price=0;
int number=0;
//out.println(cname);
//out.println("\nHello World");
while(rs.next()){
 orderid=rs.getString(1);
 custname=rs.getString(2);
 phone=rs.getString(3);
 email=rs.getString(4);
 door=rs.getString(5);
 street=rs.getString(6);
 city=rs.getString(7);
 state=rs.getString(8);
 opt=rs.getString(9);
 model=rs.getString(10);
 number=rs.getInt(11);
 date1=rs.getString(12);
 }
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
String eid="NULL";
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
}
catch(Exception e)
{
out.println("Exception : " + e.getMessage() + "");
}%>
		  
        </div>
        
      </div></div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Sidebar Menu</h2>
          <ul class="sb_menu">
            <li><a href="Products.html">Products</a></li>
			<li><a href="About.html">About Us</a></li>
			<li><a href="Contact.html">Contact Us</a></li>
            <li><a href="Gallery.html">Gallery</a></li>
            <li><a href="Manufacturing.html">Manufacturing</a></li>
            <li><a href="Solution.html">Solutions</a></li>
			<li><a href="Custorder.jsp">Order</a></li>
            <li><a href="Feedback.html">Feedback</a></li>
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
