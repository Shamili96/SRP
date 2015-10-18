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
          <h2>EMPLOYEE RECORDS:</h2>
		  
<%
  
    try
  {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
//out.println("Connection created"); 
//String eid="empsm1";
String eid=request.getParameter("eid");
String mon=request.getParameter("month");
Statement st=con.createStatement();
String orderid="",opt="",model="",date1="";
String month="",year="",ym="",ym1="";
int sum=0;
int number=0;
String empname="",phone="",email="",doj="";
int salary=0,age=0;
double bonus=0;
//out.println(eid);
//out.println("\nHello World");
 ResultSet resultset = st.executeQuery("select * from salesorder where eid='"+eid+"'") ; 
%>
<h2>HISTORY OF RECORDS</h2>
        <table id="customers">
            <tr>
                <th>ORDERID</th>
                <th>OPTION</th>
                <th>MODEL</th>
                <th>NUMBER</th>
				<th>DATE</th>
            </tr>
            <% while(resultset.next()){
				orderid=resultset.getString(1);
				opt=resultset.getString(10);
				model=resultset.getString(11);
				number=resultset.getInt(12);
				date1=resultset.getString(13);
				ym1=date1.substring(0,7);
				if(ym1.equals(mon))
				{%>
            <tr>
                <td> <%=orderid %></td>
                <td> <%=opt%></td>
                <td> <%=model%></td>	
				<td> <%=number%></td>
                <td> <%=date1%></td>	
            </tr>
<%
}
String d1=date1;
//out.println("\nDate:"+d1);
month=d1.substring(5,7);
year=d1.substring(0,4);
ym=d1.substring(0,7);
//out.println(month+" "+year);
if(ym.equals(mon))
{
	sum=sum+number;
}
}
//out.println("\nSum:"+sum);
//Resultset rs=st.executeQuery("select * from empdb where eid='"+eid+"'");
ResultSet rs= st.executeQuery("select * from empdb where eid='"+eid+"'"); 
while(rs.next())
{
	empname=rs.getString(2);
	phone=rs.getString(3);
	email=rs.getString(4);
	salary=rs.getInt(5);
	age=rs.getInt(6);
	doj=rs.getString(7);
}
if(sum>=0 && sum<=9)
	bonus=salary*0.01;
else if(sum>=10 && sum<=29)
	bonus=salary*0.02;
else if(sum>=30 && sum<=49)
	bonus=salary*0.04;
else if(sum>=50 && sum<=79)
	bonus=salary*0.06;
else if(sum>=80 && sum<=99)
	bonus=salary*0.08;
else if(sum>=100)
	bonus=salary*0.1;
//out.println("\nBonus:"+bonus);
%>
</table>
<h2>EMPLOYEE MONTHLY BONUS:</h2>
<p><i>BONUS:</i><i><%=bonus%></i></p>
<p><i>TOTAL NO. OF ORDERS:</i><i><%=sum%></i></p>
<%
int found=1;
ResultSet srs=st.executeQuery("select * from monthbonusdb where eid='"+eid+"'");
while(!srs.next())
{
	//out.println("\nNot found");
	found=0;
	break;
}
if(found==0)
{
PreparedStatement ps=con.prepareStatement("insert into monthbonusdb values(?,?,?,?)");
ps.setString(1,eid);
ps.setString(2,month);
ps.setInt(3,sum);
ps.setDouble(4,bonus);
int istatus=ps.executeUpdate();
//out.println("\nInsert status:"+istatus);
}
else
{
	PreparedStatement dps=con.prepareStatement("delete from monthbonusdb where eid='"+eid+"'");
	int dstatus=dps.executeUpdate();
	//out.println("Delete status:"+dstatus);
	PreparedStatement ps=con.prepareStatement("insert into monthbonusdb values(?,?,?,?)");
ps.setString(1,eid);
ps.setString(2,month);
ps.setInt(3,sum);
ps.setDouble(4,bonus);
int istatus=ps.executeUpdate();
//out.println("\nInsert status:"+istatus);
}
%>
<br><br>
<form name="myForm" action="Monthincentivepie.jsp" method="post">
<input type="hidden" name="month" value="<%=month%>">
<input type="submit" value="Create chart"><br><br>
</form>
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
