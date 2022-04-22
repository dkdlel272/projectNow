package dto;

import java.util.Date;

public class Leave {

		private String id;
		private String pass;
		private String name;
		private int gender;
		private String tel;
		private String email;
		private String black;
		private Date leave_date;

		public Leave(){}

		public Leave(String id, String pass, String name, int gender, String tel, String email, String black, Date leave_date) {
			super();
			this.id = id;
			this.pass = pass;
			this.name = name;
			this.gender = gender;
			this.tel = tel;
			this.email = email;
			this.black = black;
			this.leave_date = leave_date;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getGender() {
			return gender;
		}
		public void setGender(int gender) {
			this.gender = gender;
		}
		public String getTel() {
			return tel;
		}
		public void setTel(String tel) {
			this.tel = tel;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getBlack() {
			return black;
		}
		public void setBlack(String black) {
			this.black = black;
		}

		public Date getLeave_date() {
			return leave_date;
		}

		public void setLeave_date(Date leave_date) {
			this.leave_date = leave_date;
		}

		@Override
		public String toString() {
			return "Leave [id=" + id + ", pass=" + pass + ", name=" + name + ", gender=" + gender + ", tel=" + tel
					+ ", email=" + email + ", black=" + black + ", leave_date=" + leave_date + "]";
		}


		



}
