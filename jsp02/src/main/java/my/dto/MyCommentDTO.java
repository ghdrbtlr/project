package my.dto;

import java.util.Date;

public class MyCommentDTO {
	private int comment_num; 
	private int my_num; 
	private String writer;
	private Date reg_date;
	private String show;
	private String content;
	
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getMy_num() {
		return my_num;
	}
	public void setMy_num(int my_num) {
		this.my_num = my_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getShow() {
		return show;
	}
	public void setShow(String show) {
		this.show = show;
	}
	@Override
	public String toString() {
		return "MyCommentDTO [comment_num=" + comment_num + ", my_num=" + my_num + ", writer=" + writer + ", reg_date="
				+ reg_date + ", show=" + show + ", content=" + content + "]";
	} 
	
	

}
