package dto;

import java.util.Date;

public class SaleReply {

	private int replyidx;
	private int salenum;
	private String content;
	private String writer;
	private Date regdate;
	
	public SaleReply() {}

	public SaleReply(int replyidx, int salenum, String content, String writer, Date regdate) {
		super();
		this.replyidx = replyidx;
		this.salenum = salenum;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
	}

	public int getReplyidx() {
		return replyidx;
	}

	public void setReplyidx(int replyidx) {
		this.replyidx = replyidx;
	}

	public int getSalenum() {
		return salenum;
	}

	public void setSalenum(int salenum) {
		this.salenum = salenum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "SaleReply [replyidx=" + replyidx + ", salenum=" + salenum + ", content=" + content + ", writer="
				+ writer + ", regdate=" + regdate + "]";
	}
	
	
	
	
}
