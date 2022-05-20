package edu.kdt.gametrend.wishlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("wishlistservice")
public class WishlistServiceImpl implements WishlistService {
	
	@Autowired
	@Qualifier("wishlistDAO")
	WishlistDAO dao;
	
	// 위시리스트 조회
	@Override
	public List<WishlistGameDTO> joinWishlistGame(String member_id, int[] limit) {
		return dao.joinWishlistGame(member_id, limit);
	}
	
	//위시리스트에 동일 게임 있는지 확인
	@Override
	public int wishlistCheck(WishlistDTO dto) {
		return dao.wishlistCheck(dto);
	}
	
	//게임 위시리스트 추가
	@Override
	public int insertWishlist(WishlistDTO dto) {
		return dao.insertWishlist(dto);
	}

	//위시리스트 게임 삭제
	@Override
	public int deleteWishlist(WishlistDTO dto) {
		return dao.deleteWishlist(dto);
	}

	/*-------------------- 챗봇 --------------------*/
	//해당 아이디의 위시리스트 조회 
	@Override
	public List<WishlistDTO> wishlist(String member_id) {
		return dao.wishlist(member_id);
	}
	
}
