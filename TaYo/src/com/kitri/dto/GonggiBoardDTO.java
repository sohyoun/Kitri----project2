package com.kitri.dto;

import java.util.Date;

public class GonggiBoardDTO {

	private int gboard_seq;
	private String gboard_group; // 분류
	private String gboard_subject;
	private String gboard_writer; 
	private String gboard_contents;
	private Date gboard_date;

	public GonggiBoardDTO() {

	}

	public String getGboard_writer() {
		return gboard_writer;
	}
	
	public void setGboard_writer(String gboard_writer) {
		this.gboard_writer = gboard_writer;
	}
	
	public int getGboard_seq() {
		return gboard_seq;
	}

	public void setGboard_seq(int gboard_seq) {
		this.gboard_seq = gboard_seq;
	}

	public String getGboard_subject() {
		return gboard_subject;
	}

	public void setGboard_subject(String gboard_subject) {
		this.gboard_subject = gboard_subject;
	}

	public String getGboard_contents() {
		return gboard_contents;
	}

	public void setGboard_contents(String gboard_contents) {
		this.gboard_contents = gboard_contents;
	}

	public Date getGboard_date() {
		return gboard_date;
	}

	public void setGboard_date(Date gboard_date) {
		this.gboard_date = gboard_date;
	}

	public String getGboard_group() {
		return gboard_group;
	}

	public void setGboard_group(String gboard_group) {
		this.gboard_group = gboard_group;
	}

	public GonggiBoardDTO(int gboard_seq, String gboard_subject, String gboard_writer, String gboard_contents, Date gboard_date,
			String gboard_group) {
		super();
		this.gboard_seq = gboard_seq;
		this.gboard_subject = gboard_subject;
		this.gboard_writer = gboard_writer;
		this.gboard_contents = gboard_contents;
		this.gboard_date = gboard_date;
		this.gboard_group = gboard_group;
	}

	@Override
	public String toString() {
		return "GonggiBoard [gboard_seq=" + gboard_seq + ", gboard_subject=" + gboard_subject + ", gboard_contents="
				+ gboard_contents + ", gboard_date=" + gboard_date + ", gboard_group=" + gboard_group + "]";
	}

}
