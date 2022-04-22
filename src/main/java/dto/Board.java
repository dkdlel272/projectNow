package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int num;
	private String writer;
	private String pass;
	private String subject;
	private String content;
	private String file1;
	private String boardid;
	private int count;
	private int good;
	private Date regdate;
	private int readcnt;
	private int ref;
	private int reflevel;
	private int refstep;
	private int refcount;
	private String searchType;
	private String searchName;
	
	private MultipartFile f;
	
	public Board() {}

	public Board(int num, String writer, String pass, String subject, String content, String file1, String boardid,
			int count, int good, Date regdate, int readcnt, int ref, int reflevel, int refstep, int refcount,
			String searchType, String searchName, MultipartFile f) {
		super();
		this.num = num;
		this.writer = writer;
		this.pass = pass;
		this.subject = subject;
		this.content = content;
		this.file1 = file1;
		this.boardid = boardid;
		this.count = count;
		this.good = good;
		this.regdate = regdate;
		this.readcnt = readcnt;
		this.ref = ref;
		this.reflevel = reflevel;
		this.refstep = refstep;
		this.refcount = refcount;
		this.searchType = searchType;
		this.searchName = searchName;
		this.f = f;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFile1() {
		return file1;
	}

	public void setFile1(String file1) {
		this.file1 = file1;
	}

	public String getBoardid() {
		return boardid;
	}

	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getReflevel() {
		return reflevel;
	}

	public void setReflevel(int reflevel) {
		this.reflevel = reflevel;
	}

	public int getRefstep() {
		return refstep;
	}

	public void setRefstep(int refstep) {
		this.refstep = refstep;
	}

	public int getRefcount() {
		return refcount;
	}

	public void setRefcount(int refcount) {
		this.refcount = refcount;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public MultipartFile getF() {
		return f;
	}

	public void setF(MultipartFile f) {
		this.f = f;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", writer=" + writer + ", pass=" + pass + ", subject=" + subject + ", content="
				+ content + ", file1=" + file1 + ", boardid=" + boardid + ", count=" + count + ", good=" + good
				+ ", regdate=" + regdate + ", readcnt=" + readcnt + ", ref=" + ref + ", reflevel=" + reflevel
				+ ", refstep=" + refstep + ", refcount=" + refcount + ", searchType=" + searchType + ", searchName="
				+ searchName + ", f=" + f + "]";
	}
	
	

	
	

	
	
	

	
	
	
} //end class
