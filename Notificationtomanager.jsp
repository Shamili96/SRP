<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %> 

<%@page import="javax.mail.*" %> 
<%@page import="javax.activation.*" %> 
<%@page import="java.security.Security" %> 
<%@page import="java.util.Properties" %> 
<%@page import="javax.mail.Message" %> 
<%@page import="javax.mail.Session" %> 
<%@page import="javax.mail.Transport" %> 
<%@page import="javax.mail.internet.InternetAddress"%> 
<%@page import="javax.mail.internet.MimeMessage"%> 
<%@page import="java.util.Random" %> 
<%@page import="javax.mail.internet.*"%> 
<%@page import="java.io.*"%> 
<%@page import="javax.mail.Authenticator"%>
<%@page import="javax.mail.PasswordAuthentication"%>

<% 
//Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider()); 
out.println("\nHai");
try 
{ 
String empid=request.getParameter("empid");
out.println(empid);
//String email=request.getParameter("mailaddress"); 
String email="shamilimails92@gmail.com";
//Random r = new Random(); 
//int no=r.nextInt(); 
//if(no<0) 
//{ 
//no=no*-1; 
//} 
//String username="give u r username of mailid"; 
String username="srp.project15"; 
//String password="password of u r mailid"; 
String password="Srp_project15"; 
String recipients=email; 
//String block= new Integer(no).toString(); 
out.println("\nusername:"+username);
out.println("\nRecipient:"+email);
// seekerRegbean ob=new seekerRegbean();	

out.println("Usrename is**************"+recipients); 
out.println("mail iddddddddddddddd"+email); 
String mailhost ="smtp.gmail.com"; 
String subject="www.tvstread.com"; 
out.println("SUBJECT:"+subject); 
//String sender=username;
String sender="srp.project15@gmail.com"; 
//String body=block; 

out.println("\nSender:"+sender);
out.println("\nSubject:"+subject);


out.println("*try block"); 
Properties props = new Properties(); 
props.setProperty("mail.transport.protocol", "smtp"); 
props.setProperty("mail.host", mailhost); 
props.put("mail.smtp.auth", "true"); 
props.put("mail.smtp.port", "465"); 
props.put("mail.smtp.socketFactory.port", "465"); 
props.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory"); 
props.put("mail.smtp.socketFactory.fallback", "false"); 
props.setProperty("mail.smtp.quitwait", "false"); 

javax.mail.Authenticator pa; 

out.println("**try block"); 

pa = new javax.mail.Authenticator() 
{ 
public javax.mail.PasswordAuthentication getPasswordAuthentication() 
{	
//return new javax.mail.PasswordAuthentication("uername@xx.com","your password"); 
return new javax.mail.PasswordAuthentication("srp.project15@gmail.com","Srp_project15"); 

} 
}; 
Session session1 = Session.getInstance(props,pa); 
MimeMessage message = new MimeMessage(session1); 
message.setSender(new InternetAddress(sender)); 

int len=recipients.length();
out.println("\nRecipients length:"+len);
InternetAddress[] addressTo = new InternetAddress[len];
        //for (int i = 0; i < len; i++)
        //{
          //  addressTo[i] = new InternetAddress(recipients[i]);
        //}
        message.setRecipients(Message.RecipientType.TO, recipients);
		
		
		
BodyPart messageBodyPart = new MimeBodyPart(); 
out.println("**try block"); 
message.setSubject(subject); 		
String content="Time limit exceeding"+empid;

	message.setContent(content, "text/html"); 


//Multipart multipart = new MimeMultipart(); 
//multipart.addBodyPart(messageBodyPart); 

// Part two is attachment 
//messageBodyPart = new MimeBodyPart(); 
//String filename = "file.txt"; 
//DataSource source = new FileDataSource(filename); 
//messageBodyPart.setDataHandler(new DataHandler(source)); 
//messageBodyPart.setFileName(filename); 
//multipart.addBodyPart(messageBodyPart); 

// Put parts in message 
//message.setContent(multipart); 

// Send the message 
out.println("**try block"); 
Transport.send(message); 
out.println("**try block"); 


//Transport.send(message); 
//response.sendRedirect("success.jsp"); 
%>
<jsp:forward page="Salesoption.html"></jsp:forward>
<%
} 

catch(Exception e) 
{ 
	out.println(e);
	//out.println("\nException:"+e.getMessage()); 
} 
 //finally {
   //     transport.close();
    //}

out.println("*****End1*****"); 

%> 

