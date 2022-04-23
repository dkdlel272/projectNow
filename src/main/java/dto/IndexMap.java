package dto;

public class IndexMap {
	
	String co1;
	String co2;
	public String getCo1() {
		return co1;
	}
	public void setCo1(String co1) {
		this.co1 = co1;
	}
	public String getCo2() {
		return co2;
	}
	public void setCo2(String co2) {
		this.co2 = co2;
	}
	@Override
	public String toString() {
		return "{\"co1\":\"" + co1 + "\", \"co2\":\"" + co2 + "\"}";
	}
	
	
	

}
