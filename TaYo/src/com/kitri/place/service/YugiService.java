package com.plzdaeng.board.yugi.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plzdaeng.util.YugiConfig;

public class YugiService {
	
	public StringBuilder getUrl(String cmd, String numOfRows)  {
	 	StringBuilder urlBuilder = new StringBuilder(); /*URL*/
	 	
        try {
        	urlBuilder.append(YugiConfig.YUGI_APIURL+cmd);
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") +"="+YugiConfig.YUGI_SERVICEKEY);
			if(!"".equals(numOfRows)) {
				urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(numOfRows, "UTF-8")); /*페이지당 보여줄 개수*/
			}
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} /*Service Key*/
        
		return urlBuilder;
	}
	
	
	public String getSido(String cmd) throws Exception {
		URL url = new URL(this.getUrl(cmd,"20").toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb.toString());
        rd.close();
        conn.disconnect();
        
        
        return sb.toString();
	}
	
	
	public String getSigungu(String cmd, String uprCd) throws Exception {
		StringBuilder strB = this.getUrl(cmd,"20");
		strB.append("&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode(uprCd, "UTF-8"));
		
		URL url = new URL(strB.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb.toString());
        rd.close();
        conn.disconnect();
        
        
        return sb.toString();
	}

	
	public String getShelter(String cmd, String uprCd, String orgCd) throws Exception {
		StringBuilder strB = this.getUrl(cmd,"20");
		strB.append("&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode(uprCd, "UTF-8"));
		strB.append("&" + URLEncoder.encode("org_cd","UTF-8") + "=" + URLEncoder.encode(orgCd, "UTF-8"));
		
		URL url = new URL(strB.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb.toString());
        rd.close();
        conn.disconnect();
        
        
        return sb.toString();
	}
	
	public String getKind(String cmd, String upKindCd) throws Exception {
		StringBuilder strB = this.getUrl(cmd,"");
		strB.append("&" + URLEncoder.encode("up_kind_cd","UTF-8") + "=" + URLEncoder.encode(upKindCd, "UTF-8"));
		
		System.out.println(strB.toString());
		URL url = new URL(strB.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb.toString());
        rd.close();
        conn.disconnect();
        
        
        return sb.toString();
	}
	
	public String getSearch(String cmd, HttpServletRequest request) throws Exception {
		StringBuilder strB = this.getUrl(cmd,"10");
		
		strB.append("&" + URLEncoder.encode("bgnde","UTF-8") + "=" + URLEncoder.encode(request.getParameter("bgnde"), "UTF-8"));
		strB.append("&" + URLEncoder.encode("endde","UTF-8") + "=" + URLEncoder.encode(request.getParameter("endde"), "UTF-8"));
		strB.append("&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode(request.getParameter("upkind"), "UTF-8"));
		strB.append("&" + URLEncoder.encode("kind","UTF-8") + "=" + URLEncoder.encode(request.getParameter("kind"), "UTF-8"));
		strB.append("&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode(request.getParameter("upr_cd"), "UTF-8"));
		strB.append("&" + URLEncoder.encode("org_cd","UTF-8") + "=" + URLEncoder.encode(request.getParameter("org_cd"), "UTF-8"));
		strB.append("&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + URLEncoder.encode(request.getParameter("care_reg_no"), "UTF-8"));
		strB.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(request.getParameter("pageNo"), "UTF-8"));
		
		System.out.println(strB.toString());
		URL url = new URL(strB.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        
        System.out.println(sb.toString());
        rd.close();
        conn.disconnect();
        
        
        return sb.toString();
	}
	
	
}
