package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.admin.model.service.MemberListService;
import com.kitri.dto.MemberBoard;
import com.kitri.dto.MemberListDTO;

@WebServlet("/boardlist")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	private MemberListService memberListService;
	
    public BoardListServlet() {
    	memberListService = new MemberListService();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("페이징처리 서블릿 들어옴");
		
		String cp = request.getParameter("currentPage");
		
		int currentPage = 1;
		
		/*
		 * if(cp != null) { currentPage = Integer.parseInt(cp); }
		 */
			
			int cntPage = 10;
			int totalCnt = memberListService.getTotalCnt();
			int cntPerPageGroup = 5;
			
			String url = "boardlist";
			MemberListDTO memberListDTO = new MemberListDTO(cntPage, totalCnt, cntPerPageGroup, url, currentPage);
			
			List<MemberBoard> list = memberListService.findByRows(memberListDTO.getStartRow(), memberListDTO.getEndRow());
			memberListDTO.setList(list);
			System.out.println("페이징처리할 리스트: " +list);
			request.setAttribute("boardlist", memberListDTO);
			System.out.println("memberListDTO == " + memberListDTO);
			//System.out.println(memberListDTO.getStartRow());
			
			String path = "/tayoadmin/board.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(path);
			rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
