package com.kitri.recomand;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;



/**
 * Servlet implementation class recomand
 */
@WebServlet("/recomand")
public class RecomandServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
 
    public RecomandServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("RecomandServlet doPost");
		
		String jsonStr = request.getParameter("jsonData");
		System.out.println(jsonStr);
		
        JSONParser jsonParser = new JSONParser();
        
        JSONObject jsonObj = null;
		try {
			jsonObj = (JSONObject) jsonParser.parse(jsonStr);
			System.out.println(jsonObj.toJSONString());
			String season = (String) jsonObj.get("season");
			String theme = (String) jsonObj.get("theme");
			String city = (String) jsonObj.get("city");
			String day = (String) jsonObj.get("day");
			System.out.println("RecomandServlet"+ season +" "+ theme+" "+city+" "+day);			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	}

}
