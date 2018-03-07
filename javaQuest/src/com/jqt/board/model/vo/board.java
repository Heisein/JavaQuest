package com.jqt.board.model.vo;

import java.util.Date;

public class board {
	private int bid;
	private int btype;
	private int bno;
	private String btitle;
	private String bcontext;
	private int bwriter;
	private int bcount;
	private int ref_bid;
	private int ref_ref_bid;
	private int reply_level;
	private Date bdate;
	private String status;
	
	public board() {
		
	}

	public board(int bid, int btype, int bno, String btitle, String bcontext, int bwriter, int bcount, int ref_bid,
			int ref_ref_bid, int reply_level, Date bdate, String status) {
		super();
		this.bid = bid;
		this.btype = btype;
		this.bno = bno;
		this.btitle = btitle;
		this.bcontext = bcontext;
		this.bwriter = bwriter;
		this.bcount = bcount;
		this.ref_bid = ref_bid;
		this.ref_ref_bid = ref_ref_bid;
		this.reply_level = reply_level;
		this.bdate = bdate;
		this.status = status;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontext() {
		return bcontext;
	}

	public void setBcontext(String bcontext) {
		this.bcontext = bcontext;
	}

	public int getBwriter() {
		return bwriter;
	}

	public void setBwriter(int bwriter) {
		this.bwriter = bwriter;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public int getRef_bid() {
		return ref_bid;
	}

	public void setRef_bid(int ref_bid) {
		this.ref_bid = ref_bid;
	}

	public int getRef_ref_bid() {
		return ref_ref_bid;
	}

	public void setRef_ref_bid(int ref_ref_bid) {
		this.ref_ref_bid = ref_ref_bid;
	}

	public int getReply_level() {
		return reply_level;
	}

	public void setReply_level(int reply_level) {
		this.reply_level = reply_level;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "board [bid=" + bid + ", btype=" + btype + ", bno=" + bno + ", btitle=" + btitle + ", bcontext="
				+ bcontext + ", bwriter=" + bwriter + ", bcount=" + bcount + ", ref_bid=" + ref_bid + ", ref_ref_bid="
				+ ref_ref_bid + ", reply_level=" + reply_level + ", bdate=" + bdate + ", status=" + status + "]";
	}
	
}
