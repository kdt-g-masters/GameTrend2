package edu.kdt.gametrend.wishlist;

import java.util.List;

public interface WishlistService {
//	public List<WishlistDTO> selectPagingWishlist(int[] limit);
//	public List<WishlistGameDTO> joinWishlistGame(String userId, int[] limit);
//	public List<WishlistDTO> selectAll();
	
	//위시리스트에 동일 게임 있는지 확인
	public int wishlistCheck(WishlistDTO dto);
	
	//게임 위시리스트 추가
	public int insertWishlist(WishlistDTO dto);
	
	//위시리스트 게임 삭제
	public int deleteWishlist(WishlistDTO dto);
}
