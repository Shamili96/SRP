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
<script>
function validateForm()
{
var x=document.forms["myForm"]["eid"].value;
if (x==null || x=="")
  {
  alert("Please, enter the employee id");
  return false;
  }
var x=document.forms["myForm"]["year"].value;
if (x==null || x=="")
  {
  alert("Please,enter the year");
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
          <h2>EMPLOYEE MONTHLY BONUS:</h2>
		  
<form name="myForm" action="Yearbonus.jsp" onSubmit="return validateForm();" method="post">
<table>
<tr>
	<th><p><i>EMPLOYEE ID:</i></p></th>
	<td><input type="text" name="eid"></td>
</tr>
<tr>
	<th><p><i>YEAR:</i></p></th>
	<td><input type="text" name="year"></td>
</tr>
<tr>
<td><input type="submit" value="SUBMIT">
<input type="reset" value="Clear"></td>
</tr>
</table>
</form>

		  
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
