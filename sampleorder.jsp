<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,java.text.*"%>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="java.util.Date" %>
<%@page import="java.util.TimeZone"%>
<!DOCTYPE html>

<html>
<head>
<title>TYRE SOLUTIONS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style1.css" rel="stylesheet" type="text/css" />
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
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
<%try{

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root");
//out.println("Connection created"); 
Statement st=con.createStatement();

int i=0;
String flag="0";
String eid=request.getParameter("eid"); 
String custname=request.getParameter("custname"); 
String phone=request.getParameter("phone"); 
String email=request.getParameter("email"); 
String door=request.getParameter("door"); 
String street=request.getParameter("street"); 
String city=request.getParameter("city"); 
String state=request.getParameter("state");
String option1=request.getParameter("option1");  
String model=request.getParameter("model"); 
String num=request.getParameter("num"); 
String date1=request.getParameter("date");
String starttime=request.getParameter("starttime");
String etime=starttime;
out.println("Etime:"+etime);
String orderid;

out.println("Date:"+date1+"Start time:"+starttime);

ResultSet rs=st.executeQuery("select * from salesorder");
while(rs.next())
{
i=i+1;
}
orderid="tvscust"+(i+1);


out.println("Test1");

PreparedStatement ps=con.prepareStatement ("insert into salesorder(orderid,eid,custname,phone,email,door,street,city,state,option1,model,number,date,st,et) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,orderid);
ps.setString(2,eid);
ps.setString(3,custname);
ps.setString(4,phone);
ps.setString(5,email);
ps.setString(6,door);
ps.setString(7,street);
ps.setString(8,city);
ps.setString(9,state);
ps.setString(10,option1);
ps.setString(11,model);
ps.setString(12,num);
ps.setString(13,date1);
ps.setString(14,starttime);
ps.setString(15,etime);
int s=ps.executeUpdate();
System.out.print("\nStatus:"+s);


	   
//out.println("Another record inserted successfully");

			con.close();
			//out.println("Hello World");
 %>
<body>
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1><a href="index.html">TYRE SOLUTIONS</a></h1></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="Salesoption.html"><span>SALESMAN HOME</span></a></li>
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
          <h2>CUSTOMER VERIFICATION:</h2>
 
<%
}
catch(Exception e)
{
	out.println("\nException:"+e.getMessage());
}
%>
		  
		  </div>
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
