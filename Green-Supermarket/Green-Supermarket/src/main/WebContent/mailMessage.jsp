<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*, javax.mail.*" %>  
<%@page import="javax.mail.internet.*" %>

<%
    String result;

    // Get email from the request parameter
    String to = request.getParameter("email");

    if (to != null && !to.isEmpty()) {
        final String subject ="Registration";
        final String messg =" Dear user, \n Congratulations 🎉 You have successfully registered for GreenSupermarket, your go-to destination for all things green and sustainable. We are thrilled to welcome you to our eco-friendly community.";
        final String from ="supermarketgreen6@gmail.com";
        final String pass ="ggof lnvv qmbu komq";

        String host="smtp.gmail.com";
        Properties props = new Properties();

        props.put("mail.smtp.host",host);
        props.put("mail.transport.protocol","smtp");
        props.put("mail.smtp.auth","true");
        props.put("mail.smtp.starttls.enable","true");
        props.put("mail.user",from);
        props.put("mail.password",pass);
        props.put("mail.port","465");

        Session mailSession=Session.getInstance(props, new javax.mail.Authenticator(){
            @Override
            protected PasswordAuthentication getPasswordAuthentication(){
                return new PasswordAuthentication(from,pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(messg);
            Transport.send(message);
            result="Message sent successfully";
            response.sendRedirect("index.jsp");
        } catch(MessagingException mex) {
            mex.printStackTrace();
            result="Error: Unable to send message";
        }
    } else {
        result = "Error: Email address is null or empty";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <!-- Use 'result' as needed, for example, to display a success or error message -->
    <p><%= result %></p>
</body>
</html>
