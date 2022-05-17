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
	
	/*
	@Override
	public List<WishlistDTO> selectPagingWishlist(int[] limit) {
		return dao.selectPagingWishlist(limit);
	}
	*/
	
//	@Override
//	public List<WishlistGameDTO> joinWishlistGame(String userId, int[] limit) {
//		return dao.joinWishlistGame(userId, limit);
//		/*
//		 * try { System.out.println("���� �Դٰ�");
//		 * 
//		 * } catch (Exception e) { System.out.println("���� �Դٰ�2"); }
//		 * System.out.println("���� �Դٰ�3"); return null;
//		 */
//	}

	/*
	@Override
	public List<WishlistDTO> selectAll() {
		return dao.selectAll();
	}
	*/
	
	@Override
	public int wishlistCheck(WishlistDTO dto) {
		return dao.wishlistCheck(dto);
	}
	
	@Override
	public int insertWishlist(WishlistDTO dto) {
		return dao.insertWishlist(dto);
	}

	@Override
	public int deleteWishlist(WishlistDTO dto) {
		return dao.deleteWishlist(dto);
	}

	@Override
	public List<WishlistDTO> wishlist(String member_id) {
		return dao.wishlist(member_id);
	}

	
	
}
