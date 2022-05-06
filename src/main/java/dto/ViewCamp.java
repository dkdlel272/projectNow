package dto;

public class ViewCamp {
	
	int campidx;
	String chk;
	public ViewCamp(int campidx, String chk) {
		super();
		this.campidx = campidx;
		this.chk = chk;
	}
	public int getCampidx() {
		return campidx;
	}
	public void setCampidx(int campidx) {
		this.campidx = campidx;
	}
	public String getChk() {
		return chk;
	}
	public void setChk(String chk) {
		this.chk = chk;
	}
	@Override
	public String toString() {
		return "{\"campidx\":\"" + campidx + "\", \"chk\":\"" + chk + "\"}";
	}
	
	
	
	

}
