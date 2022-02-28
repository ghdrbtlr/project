package my.dto;

import java.util.Date;

public class MyMemberDTO {
	private String userid;
	private String passwd; 
	private String name; 
	private String email; 
	private Date join_date;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public MyMemberDTO() {
		
	}
	@Override
	public String toString() {
		return "MyMember [userid=" + userid + ", passwd=" + passwd + ", name=" + name + ", email=" + email
				+ ", join_date=" + join_date + "]";
	}
	public MyMemberDTO(String userid, String passwd, String name, String email, Date join_date) {
		
		this.userid = userid;
		this.passwd = passwd;
		this.name = name;
		this.email = email;
		this.join_date = join_date;
	} 
	

}
