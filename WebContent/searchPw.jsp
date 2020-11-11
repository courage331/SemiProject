<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.activation.*"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<%!
public class MyAuthentication extends Authenticator { //아이디 패스워드 인증받기 함수
  PasswordAuthentication pa;
  public MyAuthentication(){
    pa=new PasswordAuthentication("tkwkdkdlrk18@gmail.com","sksms2353");        
  }
  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return pa;
  }
}
%>

<%
StringBuffer temp = new StringBuffer();
Random rnd = new Random();
for (int i = 0; i < 10; i++) {
	int rIndex = rnd.nextInt(3);
	switch (rIndex) {
	case 0:
		// a-z
		temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		break;
	case 1:
		// A-Z
		temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		break;
	case 2:
		// 0-9
		temp.append((rnd.nextInt(10)));
		break;
	}
}
String AuthenticationKey = temp.toString();
System.out.println(AuthenticationKey);
%>

<%
 // SMTP 서버 주소
 String smtpHost = "smtp.gmail.com";


 //받는 사람의 정보
 String toName = request.getParameter("c_name");
 String toEmail = request.getParameter("c_email");


 //보내는 사람의 정보
 String fromName = "왈왈호텔";
 String fromEmail = "tkwkdkdlrk18@gmail.com";
 
 try {
  Properties props = new Properties();
props.put("mail.smtp.user", fromEmail);
props.put("mail.smtp.host", "smtp.googlemail.com");
props.put("mail.smtp.port", "465");
props.put("mail.smtp.starttls.enable", "true");
props.put("mail.smtp.auth", "true");
props.put("mail.smtp.debug", "true");
props.put("mail.smtp.socketFactory.port", "465");
props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
props.put("mail.smtp.socketFactory.fallback", "false");

  // 메일 인증
  Authenticator myauth=new MyAuthentication(); 
  Session sess=Session.getInstance(props, myauth);


  InternetAddress addr = new InternetAddress();
  addr.setPersonal(fromName,"UTF-8");
  addr.setAddress(fromEmail);


  Message msg = new MimeMessage(sess);
  msg.setFrom(addr);         
  msg.setSubject(MimeUtility.encodeText("왈왈호텔의 회원인증 메일입니다.", "utf-8","B"));
  msg.setContent("인증번호는『"+AuthenticationKey+"』입니다.", "text/html;charset=utf-8");
  msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));


  Transport.send(msg);


 } catch (Exception e) {
  e.printStackTrace();
 	out.println("<script>");
	out.println("alert('메일 전송에 실패했습니다.\\n다시 시도해주세요.');");
	out.println("</script>");
	%>
	<script>
	history.back();
	</script>
	<%
  return;
 }
 
	out.println("<script>");
	out.println("alert('메일이 전송되었습니다.');");
	out.println("</script>");
	session.setAttribute("certif", AuthenticationKey);
%>
<script>
history.back();
</script>