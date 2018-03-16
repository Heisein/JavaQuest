package com.jqt.board.model.vo;

import java.util.ArrayList;
import java.util.Date;

public class Board {
	private int bid;	//게시글 고유번호
	private int btype;	//0공지 1자유 2 qaa
	private int bno;	//게시글 번호 인데 ... insert할떄 자체적으로 타입 넣어둠 
	private String btitle;	//글 제목
	private String bcontext;	//글 내용, 제목 내용
	private String bwriter;		//닉네임
	private int bcount;			//조회수
	private int bcount2;		//댓글 조회수
	private ArrayList bcount3;	//좋아요 횟수.... 
	private int ref_bid;		//글에 대한 댓글 번호들
	private int ref_ref_bid;	//대댓글 ->아직 
	private int reply_level;	//0글  1 댓글 2 대댓글 -->> null
	private Date bdate;			// 날짜
	private String status;		//y,n
	
	public Board() {
		
	}

	

	@Override
	public String toString() {
		return "board [bid=" + bid + ", btype=" + btype + ", bno=" + bno + ", btitle=" + btitle + ", bcontext="
				+ bcontext + ", bwriter=" + bwriter + ", bcount=" + bcount + ", bcount2=" + bcount2 + ", ref_bid="
				+ ref_bid + ", ref_ref_bid=" + ref_ref_bid + ", reply_level=" + reply_level + ", bdate=" + bdate
				+ ", status=" + status + "]";
	}



	public int getBcount2() {
		return bcount2;
	}



	public void setBcount2(int bcount2) {
		this.bcount2 = bcount2;
	}



	public ArrayList getBcount3() {
		return bcount3;
	}



	public void setBcount3(ArrayList bcount3) {
		this.bcount3 = bcount3;
	}



	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
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
