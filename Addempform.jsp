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
<script>
function validateForm()
{
var x=document.forms["myForm"]["username"].value;
if (x==null || x=="")
  {
  alert("First name must be filled out");
  return false;
  }
var x=document.forms["myForm"]["pwd"].value;
if (x==null || x=="")
  {
  alert("Please,enter the password");
  return false;
  }

if(x.length < 6) {
		alert("Error: Password must contain at least six characters!");
        myForm.pwd.focus();
        return false;
      }
      if(x.value == myForm.username.value) {
        alert("Error: Password must be different from Username!");
        myForm.pwd.focus();
        return false;
      }
      re = /[0-9]/;
      if(!re.test(x)) {
        alert("Error: password must contain at least one number (0-9)!");
        myForm.pwd.focus();
        return false;
      }
      re = /[a-z]/;
      if(!re.test(x)) {
        alert("Error: password must contain at least one lowercase letter (a-z)!");
        myForm.pwd.focus();
        return false;
      }
      re = /[A-Z]/;
      if(!re.test(x)) {
        alert("Error: password must contain at least one uppercase letter (A-Z)!");
        myForm.pwd.focus();
        return false;
      }

  var x=document.forms["myForm"]["category"].value;
  if (x==null || x=="")
  {
  alert("Please,select the category");
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
 
}

</script>
</head>
<body>
<div class="main">

  <div class="header">
    <div class="header_resize">
      <div class="logo"><h1><a href="index.html">TYRE SOLUIONS</a></h1></div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="Adminhome.jsp"><span>ADMIN HOME</span></a></li>
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
          <h2>ADD EMPLOYEE:</h2>
<form name="myForm" action="Addemp.jsp" onSubmit="return validateForm();" method="post">
<table>
<tr>
	<th><p><i>EMPLOYEE ID:</i></p></th>
	<td><input type="text" name="eid"></td>
</tr>
<tr>
	<th><p><i>EMPLOYEE NAME:</i></p></th>
	<td><input type="text" name="ename"></td>
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
	<th><p><i>SALARY:</i></p></th>
	<td><input type="text" name="salary"></td>
</tr>
<tr>
	<th><p><i>AGE:</i></p></th>
	<td><input type="text" name="age"></td>
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
	<th><p><i>DATE OF JOINING:</i></p></th>
	<td><input type="text" name="doj" value="<%=currentYear%>-<%=currentMonth%>-<%=currentDay%>"></td>
</tr>
<tr>
	<td><input type="submit" value="Add Employee"></td>
	<td><input type="reset" value="Clear"></td>
</tr>
</table>
</form>
		  
        </div>
      </div></div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Sidebar Menu</h2>
          <ul class="sb_menu">
			<li><a href="Addempform.jsp">Add Employee</a></li>
            <li><a href="Allcustdetails.jsp">Customer Details</a></li>
            <li><a href="Salesmandetails.jsp">All Salesman Details</a></li>
            <li><a href="Individualsalesman.jsp">Individual Salesman Details</a></li>
            <li><a href="Empmonthbonus1.jsp">Check Monthly Bonus</a></li>
            <li><a href="Empyearbonus1.jsp">Check Yearly Incentive</a></li>
			<li><a href="Allemployees.jsp">View Employees</a></li>
            <li><a href="monthpie.jsp">Monthly Bonus Chart</a></li>
            <li><a href="yearpie.jsp">Yearly Incentive Chart</a></li>
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
