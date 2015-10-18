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
		   <h2>EMPLOYEE RECORDS:</h2>
		  
<%
  
    try
  {

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root"); 
//out.println("Connection created"); 
//String eid="empsm1";
String eid=request.getParameter("eid");
String yr=request.getParameter("year");
Statement st=con.createStatement();
String orderid="",opt="",model="",date1="";
String month="",year="",year1="";
int sum=0;
int number=0;
String empname="",phone="",email="",doj="";
int salary=0,age=0;
double bonus=0;
//out.println(eid);
//out.println("\nHello World");
 ResultSet resultset = st.executeQuery("select * from salesorder where eid='"+eid+"'") ; 
%>
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
				year1=date1.substring(0,4);
				if(year1.equals(yr))
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
//out.println(month+" "+year);
if(year.equals(yr))
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
if(sum>=0 && sum<=99)
	bonus=salary*0.05;
else if(sum>=100 && sum<=299)
	bonus=salary*0.1;
else if(sum>=300 && sum<=499)
	bonus=salary*0.15;
else if(sum>=500 && sum<=799)
	bonus=salary*0.2;
else if(sum>=800 && sum<=999)
	bonus=salary*0.25;
else if(sum>=1000)
	bonus=salary*0.3;
//out.println("\nBonus:"+bonus);
%>
</table>
<br>
<h2>EMPLOYEE YEARLY INCENTIVE:</h2>
<p><i>INCENTIVE:</i><i><%=bonus%></i></p>
<p><i>TOTAL NO. OF ORDERS:</i><i><%=sum%></i></p>

<%
int found=1;
ResultSet srs=st.executeQuery("select * from yearbonusdb where eid='"+eid+"'");
while(!srs.next())
{
	//out.println("\nNot found");
	found=0;
	break;
}
if(found==0)
{
PreparedStatement ps=con.prepareStatement("insert into yearbonusdb values(?,?,?,?)");
ps.setString(1,eid);
ps.setString(2,year);
ps.setInt(3,sum);
ps.setDouble(4,bonus);
int istatus=ps.executeUpdate();
//out.println("\nInsert status:"+istatus);
}
else
{
	PreparedStatement dps=con.prepareStatement("delete from yearbonusdb where eid='"+eid+"'");
	int dstatus=dps.executeUpdate();
	//out.println("Delete status:"+dstatus);
	PreparedStatement ps=con.prepareStatement("insert into yearbonusdb values(?,?,?,?)");
ps.setString(1,eid);
ps.setString(2,year);
ps.setInt(3,sum);
ps.setDouble(4,bonus);
int istatus=ps.executeUpdate();
//out.println("\nInsert status:"+istatus);
}
%>
<br><br>
<form name="myForm" action="Yearbonuspie1.jsp" method="post">
<input type="hidden" name="year" value="<%=year%>">
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
