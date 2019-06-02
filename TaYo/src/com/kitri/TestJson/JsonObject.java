package com.kitri.TestJson;

import org.json.simple.JSONObject;

import com.sun.javafx.scene.paint.GradientUtils.Parser;

import jdk.nashorn.internal.parser.JSONParser;

public class JsonObject {
	
	String json; //JSON 객체를 전달해 주기 위한 String
	
	public void jsonadd(){
		
		JSONObject jsonObject = new JSONObject(); //JSONObject 객체 생성
		jsonObject.put("name", "김의연"); // (key = "name" : value = "김의연")
		jsonObject.put("hobby", "game" );
		
		JSONObject outer = new JSONObject();
		outer.put("univ", jsonObject);
		json = outer.toJSONString(); // 최종적으로 만들어진 json 객체를 String으로 변환하여 저장
		
	}

	public static void main(String[] args) {
		JsonObject jsonObject = new JsonObject();
		jsonObject.jsonadd();
	}
	
	
}
