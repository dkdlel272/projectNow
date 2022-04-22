package dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Sale {

	private int saleidx;
	private String condition;
	private String writer;
	private String password;
	private String subject;
	private String content;
	private int price;
	private String location;
	private String image1;
	private String image2;
	private int good;
	private Date regdate;
	private int readcnt;
	
	private MultipartFile f;
	
	
	public Sale() {}


	public Sale(int saleidx, String condition, String writer, String password, String subject, String content,
			int price, String location, String image1, String image2, int good, Date regdate, int readcnt,
			MultipartFile f) {
		super();
		this.saleidx = saleidx;
		this.condition = condition;
		this.writer = writer;
		this.password = password;
		this.subject = subject;
		this.content = content;
		this.price = price;
		this.location = location;
		this.image1 = image1;
		this.image2 = image2;
		this.good = good;
		this.regdate = regdate;
		this.readcnt = readcnt;
		this.f = f;
	}


	public int getSaleidx() {
		return saleidx;
	}


	public void setSaleidx(int saleidx) {
		this.saleidx = saleidx;
	}


	public String getCondition() {
		return condition;
	}


	public void setCondition(String condition) {
		this.condition = condition;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
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


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getImage1() {
		return image1;
	}


	public void setImage1(String image1) {
		this.image1 = image1;
	}


	public String getImage2() {
		return image2;
	}


	public void setImage2(String image2) {
		this.image2 = image2;
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


	public MultipartFile getF() {
		return f;
	}


	public void setF(MultipartFile f) {
		this.f = f;
	}


	@Override
	public String toString() {
		return "Sale [saleidx=" + saleidx + ", condition=" + condition + ", writer=" + writer + ", password=" + password
				+ ", subject=" + subject + ", content=" + content + ", price=" + price + ", location=" + location
				+ ", image1=" + image1 + ", image2=" + image2 + ", good=" + good + ", regdate=" + regdate + ", readcnt="
				+ readcnt + ", f=" + f + "]";
	}

	
}
