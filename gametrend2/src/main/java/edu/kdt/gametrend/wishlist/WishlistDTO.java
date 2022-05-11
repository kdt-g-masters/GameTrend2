package edu.kdt.gametrend.wishlist;

import org.springframework.stereotype.Component;

@Component
public class WishlistDTO {
	String member_id;
	int game_no;
	
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
	
}
