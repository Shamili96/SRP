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
          <h2>ALL SALESMAN DETAILS:</h2>
		 <%
  
    try
  {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
Statement st=con.createStatement();
Statement statement = con.createStatement() ;
String eid="",ename="",phone="",email="",doj="",id="",cat="",cat2="";
int salary=0,age=0;
ResultSet rs = statement.executeQuery("select * from empdb") ; 
        %>
        <table id="customers">
            <tr>
                <th>EMPLOYEE ID</th>
                <th>EMPLOYEE NAME</th>
                <th>PHONE</th>
                <th>EMAIL</th>
				<th>AGE</th>
                <th>DATE OF JOINING</th>
            </tr>
            <% while(rs.next()){
				eid=rs.getString(1);
				ename=rs.getString(2);
				phone=rs.getString(3);
				email=rs.getString(4);
				salary=rs.getInt(5);
				age=rs.getInt(6);
				doj=rs.getString(7);
				id=eid;
				cat=id.substring(3,5);
				cat2=id.substring(0,4);
				//out.println(cat);
				if(cat.equals("sm") || cat2.equals("Sale"))
				{
				%>
            <tr>
                <td> <%=eid%></td>
				<td> <%=ename%></td>
                <td> <%=phone%></td>
                <td> <%=email%></td>	
				<td> <%=age%></td>
                <td> <%=doj%></td>	
            </tr>
<%
}
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
            <li><a href="custdetails.jsp">Customer Details</a></li>
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
