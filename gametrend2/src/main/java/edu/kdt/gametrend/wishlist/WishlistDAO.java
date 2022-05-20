package edu.kdt.gametrend.wishlist;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("wishlistDAO")
public interface WishlistDAO {
	
	// 위시리스트 조회
	public List<WishlistGameDTO> joinWishlistGame(String member_id, int[] limit);
	
	//위시리스트에 동일 게임 있는지 확인
	public int wishlistCheck(WishlistDTO dto);
	
	//위시리스트 게임 추가
	public int insertWishlist(WishlistDTO dto);
	
	//위시리스트 게임 삭제
	public int deleteWishlist(WishlistDTO dto);
	
	//해당 아이디의 위시리스트 조회 
	public List<WishlistDTO> wishlist(String member_id);

}
