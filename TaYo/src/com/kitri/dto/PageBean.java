package com.kitri.dto;

import java.util.List;

public class PageBean<T> {
	private int cntPerPage = 10; // 페이지별 보여줄 목록수
	private int startRow = 1; // 시작행
	private int endRow = 1; // 끝행
	private List<T> list; // 목록
	private int totalPage = 1; // 총페이지수
	private int totalCnt; // 총게시글 수
	private int cntPerPageGroup = 3; // 페이지그룹에 보여줄 페이지수
	private int startPage;// 페이지 그룹의 시작페이지
	private int endPage;// 페이지 그룹의 끝페이지
	private int currentPage;// 현재 페이지
	private String url = "";// 페이지링크 클릭시 요청할 url

	public PageBean(int cntPerPage, int totalCnt, int cntPerPageGroup, int currentPage, String url) {
		super();
		this.cntPerPage = cntPerPage;
		this.totalCnt = totalCnt;
		this.cntPerPageGroup = cntPerPageGroup;
		this.currentPage = currentPage;
		this.url = url;
		execute();
	}

	

	public void execute() {
		
		startRow = (currentPage - 1) * cntPerPage + 1;
		endRow = currentPage * cntPerPage;
		totalPage = (int) Math.ceil((float) totalCnt / cntPerPage); 

		int index = (currentPage-1) / cntPerPageGroup;
		
		startPage = index * cntPerPageGroup + 1;// - (curPerPageGroup/2);
		endPage = (index + 1) * cntPerPageGroup ; // + (int)Math.ceil((float)curPerPageGroup/2);
		if (endPage > totalPage) {
			endPage = totalPage;
		}
//		System.out.println("현재 페이지 :" + currentPage);
//		System.out.println("총게시글 수 :" + totalCnt);
//		System.out.println("시작 페이지  :" + startPage );
//		System.out.println("끝 페이지 :" + endPage );
		
		
	}
	
	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getCntPerPageGroup() {
		return cntPerPageGroup;
	}

	public void setCntPerPageGroup(int cntPerPageGroup) {
		this.cntPerPageGroup = cntPerPageGroup;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "PageBean [cntPerPage=" + cntPerPage + ", startRow=" + startRow + ", endRow=" + endRow + ", totalPage="
				+ totalPage + ", totalCnt=" + totalCnt + ", cntPerPageGroup=" + cntPerPageGroup + ", startPage="
				+ startPage + ", endPage=" + endPage + ", currentPage=" + currentPage + ", url=" + url + ",\n list="
				+ list + "]";
	}
}
