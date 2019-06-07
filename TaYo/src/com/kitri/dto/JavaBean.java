package com.kitri.dto;

import java.util.List;

public class JavaBean {
	//자바빈 
	//페이징 처리 하려면 필요한 DTO
	private int cntPage = 10;// 페이지별 목록 수
	private int startRow = 1; // 시작 행
	private int endRow = 1; // 끝 행 
	private int totalPage; // 총 페이지 수
	private int totalCnt; // 총 게시글 수
	private int cntPerPageGroup = 5;
	private int startPage;
	private int endPage;
	private String url;
	private int currentPage; // 현재 페이지
	private List<MemberBoardDTO> list;

	public JavaBean(int cntPage, int startRow, int endRow, int totalPage, int totalCnt, int cntPerPageGroup,
			int startPage, int endPage, String url, int currentPage, List<MemberBoardDTO> list) {
		super();
		this.cntPage = cntPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.totalPage = totalPage;
		this.totalCnt = totalCnt;
		this.cntPerPageGroup = cntPerPageGroup;
		this.startPage = startPage;
		this.endPage = endPage;
		this.url = url;
		this.currentPage = currentPage;
		this.list = list;
	}

	public List<MemberBoardDTO> getList() {
		return list;
	}

	public void setList(List<MemberBoardDTO> list) {
		this.list = list;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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

	// 기본 생성자 호출
	public JavaBean() {

	}
	
	public JavaBean(int cntPage, int totalCnt, int cntPerPageGroup,
			String url, int currentPage) {
		super();
		this.cntPage = cntPage;
		this.totalCnt = totalCnt;
		this.cntPerPageGroup = cntPerPageGroup;
		this.url = url;
		this.currentPage = currentPage;
		excute();
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

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public void excute() {
		
		totalPage = (totalCnt % cntPage) == 0 ? totalCnt / cntPage : (totalCnt / cntPage) + 1 ;
		
		startRow = (currentPage - 1) * cntPage + 1;
		endRow = currentPage * cntPage;

		startPage = (currentPage - 1) * cntPerPageGroup + 1;
		endPage = startPage * cntPerPageGroup;

		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}

	@Override
	public String toString() {
		return "JavaBean [cntPage=" + cntPage + ", startRow=" + startRow + ", endRow=" + endRow + ", totalPage="
				+ totalPage + ", totalCnt=" + totalCnt + ", cntPerPageGroup=" + cntPerPageGroup + ", startPage="
				+ startPage + ", endPage=" + endPage + ", url=" + url + ", currentPage=" + currentPage + ", list="
				+ list + "]";
	}
	
	
}
