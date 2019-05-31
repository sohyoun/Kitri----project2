package com.kitri.dto;

public class MemberBoard extends MemberDetailDTO{

	//회원 목록 테이블 진작에 만들었어야 됬는데.....
	private int board_seq; //글 번호
	private int parent_seq; // 부모 글 번호
	
	
	public MemberBoard() {
		
	}

	public MemberBoard(int board_seq, int parent_seq) {
		super();
		this.board_seq = board_seq;
		this.parent_seq = parent_seq;
	}

	public int getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}

	public int getParent_seq() {
		return parent_seq;
	}

	public void setParent_seq(int parent_seq) {
		this.parent_seq = parent_seq;
	}
	
	
	
}
