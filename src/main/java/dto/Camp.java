package dto;

import org.springframework.web.multipart.MultipartFile;

public class Camp {
	private int campidx;
	private String campname;
	private String campaddr;
	private String room;
	private String campimg;
	private String campimg2;
	private String campimg3;
	private int roomcnt;
	private int payidx;
	private int roomno;
	private String chkin;
	private String chkout;
	private String content;
	
	private MultipartFile f;
	
	public Camp () {}

	public Camp(int campidx, String campname, String campaddr, String room, String campimg, String campimg2,
			String campimg3, int roomcnt, int payidx, int roomno, String chkin, String chkout, String content,
			MultipartFile f) {
		super();
		this.campidx = campidx;
		this.campname = campname;
		this.campaddr = campaddr;
		this.room = room;
		this.campimg = campimg;
		this.campimg2 = campimg2;
		this.campimg3 = campimg3;
		this.roomcnt = roomcnt;
		this.payidx = payidx;
		this.roomno = roomno;
		this.chkin = chkin;
		this.chkout = chkout;
		this.content = content;
		this.f = f;
	}

	public int getCampidx() {
		return campidx;
	}

	public void setCampidx(int campidx) {
		this.campidx = campidx;
	}

	public String getCampname() {
		return campname;
	}

	public void setCampname(String campname) {
		this.campname = campname;
	}

	public String getCampaddr() {
		return campaddr;
	}

	public void setCampaddr(String campaddr) {
		this.campaddr = campaddr;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getCampimg() {
		return campimg;
	}

	public void setCampimg(String campimg) {
		this.campimg = campimg;
	}

	public String getCampimg2() {
		return campimg2;
	}

	public void setCampimg2(String campimg2) {
		this.campimg2 = campimg2;
	}

	public String getCampimg3() {
		return campimg3;
	}

	public void setCampimg3(String campimg3) {
		this.campimg3 = campimg3;
	}

	public int getRoomcnt() {
		return roomcnt;
	}

	public void setRoomcnt(int roomcnt) {
		this.roomcnt = roomcnt;
	}

	public int getPayidx() {
		return payidx;
	}

	public void setPayidx(int payidx) {
		this.payidx = payidx;
	}

	public int getRoomno() {
		return roomno;
	}

	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}

	public String getChkin() {
		return chkin;
	}

	public void setChkin(String chkin) {
		this.chkin = chkin;
	}

	public String getChkout() {
		return chkout;
	}

	public void setChkout(String chkout) {
		this.chkout = chkout;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public MultipartFile getF() {
		return f;
	}

	public void setF(MultipartFile f) {
		this.f = f;
	}

	@Override
	public String toString() {
		return "Camp [campidx=" + campidx + ", campname=" + campname + ", campaddr=" + campaddr + ", room=" + room
				+ ", campimg=" + campimg + ", campimg2=" + campimg2 + ", campimg3=" + campimg3 + ", roomcnt=" + roomcnt
				+ ", payidx=" + payidx + ", roomno=" + roomno + ", chkin=" + chkin + ", chkout=" + chkout + ", content="
				+ content + ", f=" + f + "]";
	}

	
	

	
} //end class
