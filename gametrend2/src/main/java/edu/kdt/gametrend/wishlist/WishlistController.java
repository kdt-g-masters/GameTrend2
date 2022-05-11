package edu.kdt.gametrend.wishlist;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WishlistController {
	
	@Autowired
	@Qualifier("wishlistservice")
	WishlistService service;
	
	/*
	@RequestMapping("/wishlisttest")
	public String wishlisttest() {
		return "wishlist";
	}
	
	//@RequestMapping("/wishlist")
	public ModelAndView wishlist() {
		ModelAndView mv = new ModelAndView();
		List<WishlistDTO> list = service.selectAll();
		mv.addObject("list", list);
		mv.setViewName("test");
		return mv;
	}
	
	@RequestMapping("/wishlist/paginglist")
	public ModelAndView selectPagingMember(int page) {
		int[] limit = new int[2];
		limit[0] = (page - 1) * 6;
		limit[1] = 6;
		ModelAndView mv = new ModelAndView();
		List<WishlistDTO> list = service.selectPagingWishlist(limit);
		mv.addObject("paingList", list);
		mv.setViewName("wishlist");
		return mv;
	}
	
	// ajax
	@RequestMapping(value="/wishlist/paging", produces={"application/json; charset=utf-8"})
	@ResponseBody
	public List<WishlistGameDTO> myWishlist(String userId, int page) {
		int[] limit = new int[2];
		limit[0] = (page - 1) * 6;
		limit[1] = 6;
		List<WishlistGameDTO> list = service.joinWishlistGame(userId, limit);
		return list;
	}
	
	@RequestMapping("/wishlist")
	public ModelAndView myWishlist2(HttpServletRequest request, int page) throws Exception {
		int[] limit = new int[2];
		limit[0] = (page - 1) * 6;
		limit[1] = 6;
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		String temp = (String) session.getAttribute("sessionid");
		List<WishlistGameDTO> list = service.joinWishlistGame(temp, limit);
		System.out.println(list);
		mv.addObject("wishlist", list);
		mv.setViewName("wishlist");
		return mv;
	}
	*/
	
	//위시리스트 기능
	@RequestMapping(value = "/gamewishlist", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int gameWishlist(WishlistDTO dto) throws Exception {
		//위시리스트 중복 확인
		int wishlistcheck = service.wishlistCheck(dto);
		System.out.println(wishlistcheck);
		if(wishlistcheck == 0) {
			service.insertWishlist(dto);
		}
		else if(wishlistcheck == 1) {
			service.deleteWishlist(dto);
		}
		return wishlistcheck;
	}
	
	//게임 상세 페이지에서 위시리스트 확인
	@RequestMapping(value = "/gamewishlistview", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int gameWishlistView(WishlistDTO dto) {
		int wishlistcheck = service.wishlistCheck(dto);
		return wishlistcheck;
	}
	
}
