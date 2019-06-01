package com.kitri.together.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kitri.dto.TTLeaderDTO;
import com.kitri.together.service.TogetherService;


@WebServlet("/together")
public class TogetherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private TogetherService service;
	public TogetherServlet() {
		service = new TogetherService();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<TTLeaderDTO> list = service.findbest();
		
		request.setAttribute("list", list);
		String path = "/tayotogether/bestlistresult.jsp";
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}

}
