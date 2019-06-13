package com.kitri.place.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.kitri.place.service.ApiDetailService;
import com.kitri.place.service.ApiService;

@WebServlet("/tayoDetailapi")
public class ApiDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApiDetailServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println("디테일 서블릿 왔다");
		
		if ("detailCommon".equals(cmd)) {
			System.out.println("cmd까지는 왔다");
			response.setContentType("text/xml;charset=utf-8");
			String contentId = request.getParameter("contentId");
			try {
				PrintWriter out = response.getWriter();
				out.print(new ApiDetailService().getDetail(cmd, contentId));
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("sigunguCode".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String areaCode = request.getParameter("areaCode");
			try {
				PrintWriter out = response.getWriter();
				out.print(new ApiService().getSigungu(areaCode));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		System.out.println("상세페이지 서블릿 들어옴");
//		response.setContentType("text/xml;charset=utf-8");
//		request.setCharacterEncoding("UTF-8");
//		String cmd = request.getParameter("cmd");
//		if ("tayoDetail".equals(cmd)) {
//			System.out.println(request.getParameter("contentId"));
//			System.out.println(request.getParameter("title"));
//			String path = "/tayoplace/tayoDetailPlace.jsp";
//			RequestDispatcher dispatcher = request.getRequestDispatcher(path);// path : 경로 내 프로젝트 안에서만 이동가능
//			dispatcher.forward(request, response);
//		}
//	}

}
