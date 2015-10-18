<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.Calendar" %>
<%@ page import ="java.util.Date" %>
<%@page import="java.util.TimeZone"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*,java.text.*"%>
<%
try {
String dateStart = "2015-10-6 22:39:19";
		String dateStop = "2015-10-6 22:41:48";

		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss");

		Date d1 = null;
		Date d2 = null;
			d1 = format.parse(dateStart);
			d2 = format.parse(dateStop);

			//in milliseconds
			long diff = d2.getTime() - d1.getTime();

			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffDays = diff / (24 * 60 * 60 * 1000);

			out.println(diffDays + " days, ");
			out.println(diffHours + " hours, ");
			out.println(diffMinutes + " minutes, ");
			out.println(diffSeconds + " seconds.");

		} catch (Exception e) {
			e.printStackTrace();
		}
%>