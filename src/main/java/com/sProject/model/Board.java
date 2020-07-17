package com.sProject.model;

import java.util.Date;

public class Board {
	private int board_num;					// 글 번호(PK)
	private String board_writer;			// 작성자(FK)
	private String board_subject;			// 글 제목
	private String board_content;			// 글 내용
	private int board_readcount;			// 조회수
	private int board_ref;					// 글 번호
	private int board_re_step;				// 답글
	private int board_re_level;				// 답답글
	private Date board_reg_date;			// 작성일
	private String board_del;				// 삭제 유무
	
	// page
	private int startRow;
	private int endRow;
	// 검색
	private String search;
	private String keyword;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_writer() {
		return board_writer;
	}
	public void setBoard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public int getBoard_ref() {
		return board_ref;
	}
	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}
	public int getBoard_re_step() {
		return board_re_step;
	}
	public void setBoard_re_step(int board_re_step) {
		this.board_re_step = board_re_step;
	}
	public int getBoard_re_level() {
		return board_re_level;
	}
	public void setBoard_re_level(int board_re_level) {
		this.board_re_level = board_re_level;
	}
	public Date getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(Date board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	public String getBoard_del() {
		return board_del;
	}
	public void setBoard_del(String board_del) {
		this.board_del = board_del;
	}
	
	
}
