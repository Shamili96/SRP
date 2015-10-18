<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,java.text.*"%>
<!DOCTYPE html>

<html>
<head>
<title>TYRE SOLUTIONS</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style1.css" rel="stylesheet" type="text/css" />
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
          <h2>CUSTOMER VERIFICATION:</h2>
		  <%try{

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root");
//out.println("Connection created"); 
Statement st=con.createStatement();
int i=0;
String custname=request.getParameter("custname"); 
String phone=request.getParameter("phone"); 
String email=request.getParameter("email"); 
String door=request.getParameter("door"); 
String street=request.getParameter("street"); 
String city=request.getParameter("city"); 
String state=request.getParameter("state");
String option1=request.getParameter("option1");  
String model=request.getParameter("model"); 
int num=Integer.parseInt(request.getParameter("num")); 
String date1=request.getParameter("date");
String starttime=request.getParameter("starttime");
String orderid;
//out.println(username);
//out.println(d1);
ResultSet rs=st.executeQuery("select * from salescustorder");
while(rs.next())
{
i=i+1;
}
orderid="tvs"+(i+1);
PreparedStatement ps=con.prepareStatement ("insert into salescustorder values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
ps.setString(1,orderid);
ps.setString(2,custname);
ps.setString(3,phone);
ps.setString(4,email);
ps.setString(5,door);
ps.setString(6,street);
ps.setString(7,city);
ps.setString(8,state);
ps.setString(9,option1);
ps.setString(10,model);
ps.setInt(11,num);
ps.setString(12,date1);
ps.setString(13,starttime);
int s=ps.executeUpdate();
System.out.print(s);

//out.println(custname);
//out.println("Another record inserted successfully");

			con.close();
			//out.println("Hello World");
 
 %>
 <form name="myForm" action="Custbill.jsp" onsubmit="return validateForm();" method="post">
<p><i>CUSTOMER NAME:</i><input type="text" name="custname" value="<%=custname%>"></p>
<input type="submit" value="Order"><br><br>
</form>
<%
}
catch(Exception e)
{
	out.println("\nException:"+e.getMessage());
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
