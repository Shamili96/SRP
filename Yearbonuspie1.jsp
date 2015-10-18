<%@ page import="java.sql.*" %>
<%@ page import ="java.lang.*" %>
<%@ page import ="javax.sql.*" %>
<%@ page import="java.util.Calendar"%>
 <%@ page import="java.util.Date"%>
<%@ page import="java.util.TimeZone"%>
<%@ page  import="java.awt.*" %>
 <%@ page  import="java.io.*" %>
 <%@ page  import="org.jfree.chart.*" %>
 <%@ page  import="org.jfree.chart.entity.*" %>
 <%@ page  import ="org.jfree.data.general.*"%>
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
          <h2>EMPLOYEE YEARLY INCENTIVE:</h2>
		  
<%try
    {%>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3300/sampledb1","root","root");
Statement st=con.createStatement();
//String pdate=request.getParameter("pdate");
//String date1=request.getParameter("date1");
String eid="";
//String month="09";
String year=request.getParameter("year");
//String date1="2015-09-20";
ResultSet rs=st.executeQuery("select * from yearbonusdb where year='"+year+"'");
 final DefaultPieDataset data = new DefaultPieDataset();
 int i=0,sum=0;
 String str="";
 //double amt=0;
 while(rs.next())
 {
	 //opt=rs.getString(10);
	 eid=rs.getString(1);
	 sum=rs.getInt(3);
	 data.setValue(eid,sum);
 }
 
            JFreeChart chart = ChartFactory.createPieChart("Pie Chart ", data, true, true, false);
                 final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection()); 
			   String l="C:/TcatServer7/webapps/examples/jsp/jsp2/Salesproject/";
				i=i+1;
				String l2="piechart"+i+".png";
				String l1=l+l2;
                 final File file1 = new File("C:/TcatServer7/webapps/examples/jsp/jsp2/SRProject/Yearbonuspie.png");
                 ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
            
			 %>
			 <img src="Yearbonuspie.png" WIDTH="600" HEIGHT="400" BORDER="0" USEMAP="#chart">
		  <%
			}
			catch (Exception e) {
                 out.println(e);
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
