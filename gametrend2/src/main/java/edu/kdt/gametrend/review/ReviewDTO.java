package edu.kdt.gametrend.review;

public class ReviewDTO {

	int no;
	String member_id;
	int game_no;
	String date;
	String contents;
	Double stars;
	String image;
	int approve;
	String disapprRsn;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getGame_no() {
		return game_no;
	}
	public void setGame_no(int game_no) {
		this.game_no = game_no;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Double getStars() {
		return stars;
	}
	public void setStars(Double stars) {
		this.stars = stars;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getApprove() {
		return approve;
	}
	public void setApprove(int approve) {
		this.approve = approve;
	}
	public String getDisapprRsn() {
		return disapprRsn;
	}
	public void setDisapprRsn(String disapprRsn) {
		this.disapprRsn = disapprRsn;
	}
	
}
