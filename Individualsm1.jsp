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
    font-family: "trebuchet MS", Arial, Helvetica, sans-serif;
    width: 100%;
    border-collapse: collapse;
}

#customers td, #customers th {
    font-size: 15px;
    border: 1px solid #98bf21;
    padding: 3px 7px 2px 7px;
}

#customers th {
    font-size: 15px;
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
          <li class="active"><a href="Managehome.jsp"><span>MANAGER HOME</span></a></li>
          <li><a href="index.html"><span>LOGOUT</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar"><div class="submb">
        <div class="article">
          <h2>INDIVIDUAL SALESMAN DETAILS:</h2>
		 
		 <%
  
    try
  {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
Statement st=con.createStatement();
Statement statement = con.createStatement() ;
String eid=request.getParameter("eid");
String orderid="",custname="",phone="",email="",door="",street="",city="",state="",opt="",model="",date1="",stt="",et="",status="";
int num=0;
int salary=0,age=0;
ResultSet rs = statement.executeQuery("select * from salesorder where eid='"+eid+"'") ; 
        %>
        <table id="customers">
            <tr>
				<th>Order Id</th>
				<th>Customer</th>
				<th>Phone</th>
                <th>Option</th>
				<th>Model</th>
				<th>Number</th>
                <th>Start Time</th>
				<th>End Time</th>
                <th>Status</th>
            </tr>
            <% while(rs.next()){
				orderid=rs.getString(1);
				custname=rs.getString(3);
				phone=rs.getString(4);
				opt=rs.getString(10);
				model=rs.getString(11);
				num=rs.getInt(12);
				stt=rs.getString(14);
				et=rs.getString(15);
				status=rs.getString(16);
				%>
            <tr>
				<td> <%=orderid%></td>
				<td> <%=custname%></td>
				<TD> <%=phone%></TD>	
                <td> <%=opt%></td>
                <td> <%=model%></td>	
				<td> <%=num%></td>
                <td> <%=stt%></td>
				<td> <%=et%></td>
                <td> <%=status%></td>
            </tr>
<%
}
%>
</table>
<br><br>
<%
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
            <li><a href="Manage.html">Customer Details</a></li>
            <li><a href="Salesmandetails1.jsp">All Salesman Details</a></li>
            <li><a href="Individualsalesman1.jsp">Individual Salesman Details</a></li>
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
