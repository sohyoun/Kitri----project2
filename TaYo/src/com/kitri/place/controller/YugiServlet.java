package com.plzdaeng.board.yugi.controller;

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

import com.plzdaeng.board.model.BoardPage;
import com.plzdaeng.board.yugi.service.YugiService;

@WebServlet("/yugi")
public class YugiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public YugiServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cmd = request.getParameter("cmd");

		if ("sido".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");

			try {

				PrintWriter out = response.getWriter();
				out.print(new YugiService().getSido(cmd));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if ("sigungu".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String uprCd = request.getParameter("upr_cd");
			try {

				PrintWriter out = response.getWriter();
				out.print(new YugiService().getSigungu(cmd, uprCd));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("shelter".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String uprCd = request.getParameter("upr_cd");
			String orgCd = request.getParameter("org_cd");
			try {

				PrintWriter out = response.getWriter();
				out.print(new YugiService().getShelter(cmd, uprCd, orgCd));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if ("kind".equals(cmd)) {
			response.setContentType("text/xml;charset=utf-8");
			String upKindCd = request.getParameter("up_kind_cd");
			try {

				PrintWriter out = response.getWriter();
				out.print(new YugiService().getKind(cmd, upKindCd));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if ("abandonmentPublic".equals(cmd)) {
			try {
				String resultXML = new YugiService().getSearch(cmd, request);
				response.setContentType("text/xml;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(resultXML);

			} catch (Exception e) { // TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	

}
