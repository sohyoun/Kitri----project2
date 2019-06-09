package com.kitri.admin.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.kitri.admin.service.MemberListService;
import com.kitri.dto.*;

@WebServlet("/adminmember")
public class AdminMemberContoller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberListService memberListService;

	public AdminMemberContoller() {
		memberListService = new MemberListService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("처음 회원목록서블릿 들어옴");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String cp = request.getParameter("currentPage");

		int currentPage = 1;
//		System.out.println("cp == " + cp );
//		
		if (cp != null) {
			currentPage = Integer.parseInt(cp);
		}

		// System.out.println("cp == " + cp);
		int cntPage = 10;
		int totalCnt = memberListService.getTotalCnt();
		int cntPerPageGroup = 5;

		String url = "adminmember";
		JavaBean javaBean = new JavaBean(cntPage, 
										 totalCnt, 
										 cntPerPageGroup, 
										 url, 
										 currentPage);
		// System.out.println("startPage " + memberListDTO.getStartPage());

		List<MemberBoardDTO> mlist = memberListService.selectMember(javaBean.getStartRow(), 
																	javaBean.getEndRow());

		javaBean.setMlist(mlist);
		
		request.setAttribute("mlist", javaBean.getMlist());
		request.setAttribute("javaBean", javaBean);
		
		//System.out.println("자바빈 포함리스트:" + javaBean.getMlist());
		//System.out.println("javaBean:" + javaBean);
		String path = "/tayoadmin/mlistresult.jsp";
		
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
		
//		Gson gson = new Gson();
//		String bd = gson.toJson(mlist);
//		JsonObject jsonObject = new JsonObject();
//		jsonObject.add("mlist", gson.toJsonTree(javaBean));
//		//System.out.println("회원목록게시판 제이슨반환 == " + jsonObject);
//
//		PrintWriter out = response.getWriter();
//		out.write(bd);

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}

}
