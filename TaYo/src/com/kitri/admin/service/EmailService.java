package com.kitri.admin.service;

import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.kitri.dto.EmailDTO;
import com.sun.xml.internal.messaging.saaj.packaging.mime.internet.MimeUtility;

public class EmailService {

	//메소드 
	public void mailSender(EmailDTO emailDTO) throws Exception {

		String host = "smtp.gmail.com"; // smtp 서버주소
		String username = "tayotayotest";
		String password = "kitri1234";
		int port = 587; // gmail 포트번호

		String senderMail = emailDTO.getSenderMail();
		String senderName = emailDTO.getSenderName();
		String recipient = emailDTO.getReceiveMail();
		String subject = emailDTO.getSubject();
		String contents = emailDTO.getMessage();

		// 정보를 담기위한 객체 생성
		Properties props = System.getProperties();

		props.put("mail.smtp.host", host); // 이메일 발송을 처리해줄 SMTP 서버 
		props.put("mail.smtp.port", port); // TLS의 포트번호는 587이며 SSL의 포트번호는 465이다.
		props.put("mail.transport.protocol", "smtp"); 
		props.put("mail.smtp.auth", "true"); // SMTP 서버의 인증을 사용한다는 의미 
		props.put("mail.smtp.starttls.enable", "true"); //로그인 시 TLS를 사용할 것인지 설정

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(un, pw);
			}
		});
		session.setDebug(true);
		Message mimeMessage = new MimeMessage(session);

		mimeMessage.addFrom(new InternetAddress[] { new InternetAddress(senderMail, senderName) 
				});
		mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));

		//한글깨짐 인코딩
		mimeMessage.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
		mimeMessage.setContent(contents, "text/html; charset=UTF-8");
		
		Transport.send(mimeMessage);

	}
 
}
