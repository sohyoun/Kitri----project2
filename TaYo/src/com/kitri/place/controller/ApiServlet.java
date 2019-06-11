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

import com.kitri.place.service.ApiService;

@WebServlet("/tayoapi")
public class ApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ApiServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		System.out.println("유기까지는 왔다");

		if ("areaCode".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			System.out.println("여기는???");
			try {

				PrintWriter out = response.getWriter();
				out.print(new ApiService().getareaCode(cmd));
				System.out.println(cmd);
				System.out.println("22여기는???");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if ("sigunguCode".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String areaCode = request.getParameter("areaCode");
			System.out.println("여기는 시군구");
			try {
				System.out.println("여기는 시군구22");
				System.out.println(cmd + "" + areaCode);
				PrintWriter out = response.getWriter();
				out.print(new ApiService().getSigungu(areaCode));
				System.out.println("여기는 시군구야");
				System.out.println("cmd: " + cmd + " areaCode: " + areaCode);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("categoryCode".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String contentTypeId = request.getParameter("contentTypeId");
			System.out.println("여기는 대분류");
			try {
				System.out.println("여기는 대분류22");
				System.out.println(cmd + "" + contentTypeId);
				PrintWriter out = response.getWriter();
				out.print(new ApiService().getcat1(cmd, contentTypeId));
				System.out.println("여기는 대분류3란다");
				System.out.println("cmd: " + cmd + " contentTypeId: " + contentTypeId);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("categoryCode2".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String contentTypeId = request.getParameter("contentTypeId");
			String cat1 = request.getParameter("cat1");
			System.out.println("여기는 중분류");
			try {
				System.out.println("여기는 중분류22");
				System.out.println(cmd + "" + contentTypeId + cat1);
				PrintWriter out = response.getWriter();
				out.print(new ApiService().getcat2(contentTypeId, cat1));
				System.out.println("여기는 중분류3란다");
				System.out.println("cmd: " + cmd + " contentTypeId: " + contentTypeId + " cat1 " + cat1);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if ("categoryCode3".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String contentTypeId = request.getParameter("contentTypeId");
			String cat1 = request.getParameter("cat1");
			String cat2 = request.getParameter("cat2");
			System.out.println("여기는 소분류");
			try {
				System.out.println("여기는 소분류22");
				System.out.println(cmd + "" + contentTypeId);
				PrintWriter out = response.getWriter();
				out.print(new ApiService().getcat3(contentTypeId, cat1, cat2));
				System.out.println("여기는 소분류3란다");
				System.out.println("cmd: " + cmd + " contentTypeId: " + contentTypeId + " cat1" + cat1 + " cat2" + cat2);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		else if ("shelter".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String uprCd = request.getParameter("upr_cd");
			String orgCd = request.getParameter("org_cd");
			try {

				PrintWriter out = response.getWriter();
				out.print(new ApiService().getShelter(cmd, uprCd, orgCd));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if ("kind".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String upKindCd = request.getParameter("up_kind_cd");
			try {

				PrintWriter out = response.getWriter();
				out.print(new ApiService().getKind(cmd, upKindCd));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if ("abandonmentPublic".equals(cmd)) {
			try {
				String resultXML = new ApiService().getSearch(cmd, request);
				response.setContentType("text/xml;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(resultXML);

			} catch (Exception e) { // TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

}
