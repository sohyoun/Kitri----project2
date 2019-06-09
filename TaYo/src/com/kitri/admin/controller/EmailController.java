package com.kitri.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.service.EmailService;
import com.kitri.dto.EmailDTO;

@WebServlet("/email")
public class EmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private EmailService emailService;
	
    public EmailController() {
        emailService = new EmailService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String senderName = request.getParameter("senderName");
		String senderMail = request.getParameter("senderMail");
		String receiveMail = request.getParameter("receiveMail");
		String subject = request.getParameter("subject");
		String message = request.getParameter("message");
		
		EmailDTO emailDTO = new EmailDTO();
		
		emailDTO.setSenderName(senderName);
		emailDTO.setSenderMail(senderMail);
		emailDTO.setReceiveMail(receiveMail);
		emailDTO.setSubject(subject);
		emailDTO.setMessage(message);
		
		try {
			emailService.mailSender(emailDTO);
		} catch(Exception e) {
			e.printStackTrace();
		}
		//실패할 경우 폼으로 되돌아가기
		response.sendRedirect(request.getContextPath() + "/tayoadmin/email/emailwrite.jsp?message=ok");
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
