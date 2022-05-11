package edu.kdt.gametrend.wishlist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("wishlistDAO")
public interface WishlistDAO {
	/*
	public List<WishlistDTO> selectPagingWishlist(int[] limit) {
		return session.selectList("pagingList", limit);
	}
	
	public List<WishlistGameDTO> joinWishlistGame(String id, int[] limit) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("limit", limit);
		return session.selectList("joinWishlistGame", map);
	}
	
	public List<WishlistDTO> selectAll() {
		return session.selectList("selectAllWishlist");
	}
	*/
	
	//위시리스트에 동일 게임 있는지 확인
	public int wishlistCheck(WishlistDTO dto);
	
	//위시리스트 게임 추가
	public int insertWishlist(WishlistDTO dto);
	
	//위시리스트 게임 삭제
	public int deleteWishlist(WishlistDTO dto);
}
