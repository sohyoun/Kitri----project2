package com.kitri.dto;

public class FoodDTO {
	private String foodId;		//음식코드
	private int locId;			//지역코드
	private String foodName;	//음식점이름
	private String foodCtg;		//음식점종류
	private int foodPrice;		//음식가격
	private String foodTime;	//음식영업시간
	private String foodWay;		//음식가는방법
	private String foodInfo;	//음식세부정보
	public String getFoodId() {
		return foodId;
	}
	public void setFoodId(String foodId) {
		this.foodId = foodId;
	}
	public int getLocId() {
		return locId;
	}
	public void setLocId(int locId) {
		this.locId = locId;
	}
	public String getFoodName() {
		return foodName;
	}
	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}
	public String getFoodCtg() {
		return foodCtg;
	}
	public void setFoodCtg(String foodCtg) {
		this.foodCtg = foodCtg;
	}
	public int getFoodPrice() {
		return foodPrice;
	}
	public void setFoodPrice(int foodPrice) {
		this.foodPrice = foodPrice;
	}
	public String getFoodTime() {
		return foodTime;
	}
	public void setFoodTime(String foodTime) {
		this.foodTime = foodTime;
	}
	public String getFoodWay() {
		return foodWay;
	}
	public void setFoodWay(String foodWay) {
		this.foodWay = foodWay;
	}
	public String getFoodInfo() {
		return foodInfo;
	}
	public void setFoodInfo(String foodInfo) {
		this.foodInfo = foodInfo;
	}
	
	
	
	
}
