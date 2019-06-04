package com.kitri.util;

import java.io.IOException;
import java.util.Map;

import javax.xml.parsers.*;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.kitri.api.tour.service.TourResionCodeService;
import com.sun.org.apache.xerces.internal.dom.ChildNode;

public class APIUtill {

	// 도시코드와 도시이름 맵핑
	static Map<String, String> locCodeNameMap;

	public String test() {
		TourResionCodeService service = new TourResionCodeService();
		String json = service.getResionCode();
		return json;
	}

	public static void main(String[] args) {
		APIUtill apiutil = new APIUtill();
		String xmlStr = apiutil.test();
		DocumentBuilderFactory objDocumentBuilderFactory = null;
		DocumentBuilder objDocumentBuilder = null;
		org.w3c.dom.Document doc = null;
		try {
			objDocumentBuilderFactory = DocumentBuilderFactory.newInstance();
			objDocumentBuilder = objDocumentBuilderFactory.newDocumentBuilder();
			doc = objDocumentBuilder.parse(xmlStr);
		} catch (SAXException | IOException e) {
			e.printStackTrace();
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		}
		NodeList nodelist =doc.getChildNodes();
		System.out.println(nodelist.item(1));
		
		
		System.out.println(xmlStr);
//		System.out.println(jsonObj.get);

//		String code = (String) jsonObj.get();
//		System.out.println(code);
	}

}
