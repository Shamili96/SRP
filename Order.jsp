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
String orderid;

//out.println("Date:"+date1+"Start time:"+starttime);

ResultSet rs=st.executeQuery("select * from salesorder");
while(rs.next())
{
i=i+1;
}
orderid="tvscust"+(i+1);

String stime="",etime="",status="";
//out.println("Test before resultset");
ResultSet trs=st.executeQuery("select * from salesorder where eid='"+eid+"' order by et desc limit 1");
//out.println("Test after resultset");
while(trs.next())
{
	out.println("Inside while loop");%>
	<%stime=trs.getString(14);
		//out.println(stime);%>
	<%etime=trs.getString(15);
	//out.println("\netime: "+etime);%>
<%}
//out.println("\nstarttime: "+starttime);
//out.println("\ntrs:"+trs);
//String time=etime.substring(11,13);//database time,i.e.,hours
//int t=Integer.parseInt(time);
//String min=etime.substring(14,16);//database time,i.e.,mins
//int tmin=Integer.parseInt(min);
//String edate=etime.substring(8,10);//database date1
//out.println("\nEdate:"+edate);
//int edte=Integer.parseInt(edate);
//String startt=starttime.substring(11,13);//current time,i.e.,hours
//int start=Integer.parseInt(startt);
//String startmin=starttime.substring(14,16);//current time,i.e.,mins
//int smin=Integer.parseInt(startmin);
//String sdate=starttime.substring(8,10);//current date1
//out.println("\nEdate:"+sdate);
//int sdte=Integer.parseInt(sdate);
//out.println("\nt:"+t+"\nstart:"+start);
//int diff=start-t;
//int diffdate=edte-sdte;
//out.println("\nDiff:"+diff+"\nDiff date:"+diffdate);
//if(diff<1 || diffdate>1)
//{
	//out.println("\nManaging time");
	//status="Managing time";
//}
//if(diff>1 && diffdate<1)
//if(true)
//{
	//out.println("\nTime limit exceeded");
	//status="Time limit exceeded";
	//flag="1";
//}


		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");

		Date d1 = null;
		Date d2 = null;
			d1 = format.parse(starttime);
			d2 = format.parse(etime);

			//in milliseconds
			long diff = d2.getTime() - d1.getTime();

			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffDays = diff / (24 * 60 * 60 * 1000);

			//out.println("\nDays:"+diffDays + "days,");
			//out.println("\nHours:"+diffHours + " hours, ");
			//out.println("\nMinutes:"+diffMinutes + " minutes, ");
			//out.println("\nSeconds:"+diffSeconds + " seconds.");

if(diffDays<1)
{
	if(diffMinutes<=60)
	{
		//out.println("\nManaging time inside if");
		status="Managing time";
	}
	else
	{
		//out.println("\nTime limit exceeded inside else");
		status="Time limit exceeded";
		flag="1";
	}
}
else
{
	//out.println("\nManaging time inside else");
	status="Managing time";
}
//out.println(d1);

//out.println("Test1");

PreparedStatement ps=con.prepareStatement ("insert into salesorder(orderid,eid,custname,phone,email,door,street,city,state,option1,model,number,date) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
int s=ps.executeUpdate();
//System.out.print("\nStatus:"+s);

DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   //get current date time with Date()
	   Date date2 = new Date();
	   //out.println(dateFormat.format(date2));
	   String endtime=dateFormat.format(date2);
	   //out.println("\nStart time:"+starttime);
	   //out.println("\nEnd time:"+endtime);
	   
	   PreparedStatement ups=con.prepareStatement("update salesorder set st=?,et=?,status=? where orderid='"+orderid+"'");
	   ups.setString(1,starttime);
	   ups.setString(2,endtime);
	   ups.setString(3,status);
	   int j=ups.executeUpdate();
	   //out.println("\nUpdate status:"+j);
	   
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
 <form name="myForm" action="bill.jsp" onsubmit="return validateForm();" method="post">
<table class="customers">
<tr>
	<th><p><i>CUSTOMER NAME:</i></p></th>
	<td><input type="text" name="custname" value="<%=custname%>"></td>
</tr>
<tr>
	<th><input type="hidden" name="flag" value="<%=flag%>"></th>
	<td><input type="hidden" name="eid" value="<%=eid%>">
</td>
</tr>
<tr>
	<th><input type="submit" value="Order"></th>
</tr>
</table>
</form>
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
