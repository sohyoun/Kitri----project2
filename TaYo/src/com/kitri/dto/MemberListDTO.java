package com.kitri.dto;

import java.util.List;

public class MemberListDTO {
	//자바빈 

	private int cntPage = 10;// 페이지별 목록 수
	private int startRow = 1; // 시작 행
	private int endRow = 1;
	private List<MemberDetailDTO> list; // 회원목록
	private int totalPage = 1; // 총 페이지 수
	private int totalCnt; // 총 게시글 수
	private int cntPerPageGroup = 5;
	private int startPage;
	private int endPage;
	private String url;
	private int currentPage; // 현재 페이지

	// 기본 생성자 호출
	public MemberListDTO() {

	}
	
	public MemberListDTO(int cntPage, int totalCnt, int cntPerPageGroup,
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

	public List<MemberDetailDTO> getList() {
		return list;
	}

	public void setList(List<MemberDetailDTO> list) {
		this.list = list;
	}

	public void excute() {
		startRow = (currentPage - 1) * cntPage + 1;
		endRow = currentPage * cntPage;

		startPage = (currentPage - 1) * cntPerPageGroup + 1;
		endPage = startPage * cntPerPageGroup;

		if (endPage > totalPage) {
			endPage = totalPage;
		}
	}
}
