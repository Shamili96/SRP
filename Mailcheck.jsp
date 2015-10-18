<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="java.util.Date" %>
<%@page import="java.util.TimeZone"%>
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
<script>
function validateForm()
{
var x=document.forms["myForm"]["eid"].value;
if (x==null || x=="")
  {
  alert("Employee id must be filled out");
  return false;
  }
var x=document.forms["myForm"]["custname"].value;

if (x==null || x=="")
  {
  alert("Customer name must be filled out");
  document.myForm.pwd.focus();
  return false;
  }

  var x=document.forms["myForm"]["phone"].value;
  if (x==null || x=="")
  {
  alert("Please,select the category");
  return false;
  }
  if(x.length<10 || x.length>10)
  {
	alert("Invalid phone number");
	return false;
	}
  
  var x=document.forms["myForm"]["email"].value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
  alert("Not a valid e-mail address");
  return false;
  }
  
  var x=document.forms["myForm"]["door"].value;
  if (x==null || x=="")
  {
  alert("Please,enter the door number");
  return false;
  }
  
  var x=document.forms["myForm"]["street"].value;
  if (x==null || x=="")
  {
  alert("Please,enter the street name");
  return false;
  }
  
  var x=document.forms["myForm"]["city"].value;
  if (x==null || x=="")
  {
  alert("Please,enter the city name");
  return false;
  }
  
  var x=document.forms["myForm"]["state"].value;
  if (x==null || x=="")
  {
  alert("Please,enter the state name");
  return false;
  }
  
  var x=document.forms["myForm"]["option1"].value;
  if (x==null || x=="")
  {
  alert("Please,select the option");
  return false;
  }
  
  var x=document.forms["myForm"]["model"].value;
  if (x==null || x=="")
  {
  alert("Please,select the model");
  return false;
  }
  
  var x=document.forms["myForm"]["num"].value;
  if (x==null || x=="")
  {
  alert("Please,enter the number of tyres");
  return false;
  }
}

</script>
</head>
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
          <h2>ORDER:</h2>
		  <%
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
//out.println("Connection created"); 
DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   //get current date time with Date()
	   Date date1 = new Date();
	   //out.println(dateFormat.format(date1));
	   String s=dateFormat.format(date1);
	   //out.println("Date"+s);
	   //PreparedStatement ps=con.prepareStatement("insert into timedb values('"+s+"')");
	   //int i=ps.executeUpdate();
	   //out.println("Status:"+i);
%>
<form name="myForm" action="Order.jsp" onsubmit="return validateForm();" method="post">
<table>
<tr>
	<th><p><i>SALESMAN ID:</i></p></th>
	<td><input type="text" name="eid"></td>
</tr>
<tr>
	<th><p><i>CUSTOMER NAME:</i></p></th>
	<td><input type="text" name="custname"></td>
</tr>
<tr>
	<th><p><i>PHONE:</i></p></th>
	<td><input type="text" name="phone"></td>
</tr>
<tr>
	<th><p><i>EMAIL:</i></p></th>
	<td><input type="text" name="email"></td>
</tr>
<tr>
	<th><p><i>DOOR:</i></p></th>
	<td><input type="text" name="door"></td>
</tr>
<tr>
	<th><p><i>STREET:</i></p></th>
	<td><input type="text" name="street"></td>
</tr>
<tr>
	<th><p><i>CITY:</i></p></th>
	<td><input type="text" name="city"></td>
</tr>
<tr>
	<th><p><i>STATE:</i></p></th>
	<td><input type="text" name="state"></td>
</tr>
<tr>
	<th><p><i>OPTION:</i></p></th>
	<td><select name="option1">
	<option value="Order">Order</option>
	<option value="Retread">Retread</option>
</select></td>
</tr>
<tr>
	<th><p><i>TYRE MODEL:</i></p></th>
	<td><select name="model">
	<option value="Bike">Bike</option>
	<option value="Car">Car</option>
	<option value="Lorry">Lorry</option>
	<option value="Bus">Bus</option>
	<option value="JCB">JCB</option>
</select></td>
</tr>
<tr>
	<th><p><i>NO. OF TYRES:</i></p></th>
	<td><input type="text" name="num"></td>
</tr>
<%
Calendar localCalendar = Calendar.getInstance(TimeZone.getDefault());
Date currentTime = localCalendar.getTime();
        int currentDay = localCalendar.get(Calendar.DATE);
        int currentMonth = localCalendar.get(Calendar.MONTH) + 1;
        int currentYear = localCalendar.get(Calendar.YEAR);
		//out.println(currentDay+" "+currentMonth+" "+currentYear);
		
		
		%>
<tr>
	<th><p><i>ORDER DATE:</i></p></th>
	<td><input type="text" name="date" value="<%=currentYear%>-<%=currentMonth%>-<%=currentDay%>"></td>
</tr>
<tr>
<td><input type="hidden" name="starttime" value="<%=s%>"></td>
<td><input type="submit" value="Order">
<input type="reset" value="Clear"></td>
</tr>
</table>
</form>
<p>Your order has been placed successfully.....</p>
<%
	String flag=request.getParameter("flag");
	String empid=request.getParameter("empid");
	if(flag.equals("1"))
	{
	%>
	<form name="myForm2" action="Notificationtomanager.jsp" method="post">
	<input type="hidden" name="empid" value="<%=empid%>">
	<input type="submit" value="BACK">
	</form>
	<%
	}
	else
	{
	%>
	<jsp:forward page="Salesoption.html"></jsp:forward>
	<%
	}
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
<%
try
{
	String flag=request.getParameter("flag");
	String empid=request.getParameter("empid");
	if(flag.equals("1"))
	{
	%>
	<form name="myForm2" action="Notificationtomanager" method="post">
	<input type="hidden" name="empid" value="<%=empid%>">
	<input type="submit" value="BACK">
	</form>
	<%
	}
	else
	{
	%>
	<jsp:forward page="Salesoption.html"></jsp:forward>
	<%
	}
}
catch(Exception e)
{
	out.println("\nException:"+e.getMessage());
}
%>