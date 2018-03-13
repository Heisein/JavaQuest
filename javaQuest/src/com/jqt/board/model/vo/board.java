package com.jqt.board.model.vo;

import java.util.Date;

public class board {
	private int bid;
	private int btype;
	private int bno;
	private String btitle;
	private String bcontext;
	private String bwriter;
	private int bcount;
	private int bcount2;
	private int ref_bid;
	private int ref_ref_bid;
	private int reply_level;
	private Date bdate;
	private String status;
	
	public board() {
		
	}

	

	@Override
	public String toString() {
		return "board [bid=" + bid + ", btype=" + btype + ", bno=" + bno + ", btitle=" + btitle + ", bcontext="
				+ bcontext + ", bwriter=" + bwriter + ", bcount=" + bcount + ", bcount2=" + bcount2 + ", ref_bid="
				+ ref_bid + ", ref_ref_bid=" + ref_ref_bid + ", reply_level=" + reply_level + ", bdate=" + bdate
				+ ", status=" + status + "]";
	}



	public Date getBdate() {
		return bdate;
	}



	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}



	public int getBcount2() {
		return bcount2;
	}



	public void setBcount2(int bcount2) {
		this.bcount2 = bcount2;
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

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
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

	


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}



	
	
}
