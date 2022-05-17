package edu.kdt.gametrend.chatbot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.game.GameService;
import edu.kdt.gametrend.game.GenreDTO;
import edu.kdt.gametrend.wishlist.WishlistDTO;
import edu.kdt.gametrend.wishlist.WishlistService;

@Controller
public class ChatbotContoller {
	@Autowired
	@Qualifier("chatbotservice")
	ChatbotService chatservice;
	
	@Autowired
	@Qualifier("gameservice")
	GameService gameservice;
	
	@Autowired
	@Qualifier("wishlistservice")
	WishlistService wishlistservice;
	
	
	@RequestMapping("/chatbottest")
	public String chatbottest() {
		return "chatbottest";
	}
	
	@RequestMapping("/chatbot")
	@ResponseBody
	public String chatbotajax(String request, String event) {
		System.out.println(event);
		
		String response = "";
		if(event.equals("입력")) {
			response = chatservice.test(request);
		}
		else if(event.equals("대화시작")) {
			response = chatservice.test(request, "open");
		}
		System.out.println("==> " + response);
		
		return response;
	}
	
	@RequestMapping("/chatmywishlist")
	@ResponseBody
	public List<WishlistDTO> existWishlist(String member_id) { 
		List<WishlistDTO> wishlist = wishlistservice.wishlist(member_id);
		System.out.println(wishlist);
		return wishlist;
	}
	
	@RequestMapping("/genreOfWishlist")
	@ResponseBody
	public List<GenreDTO> genreOfWishlist(String member_id) { 
		List<GenreDTO> genreofwishlist = gameservice.genreOfWishlist(member_id);
		System.out.println(genreofwishlist);
		return genreofwishlist;
	}
	
	@RequestMapping("/chatplatform")
	@ResponseBody
	public List<GameDTO> chatPlatform() {
		List<GameDTO> platformlist = gameservice.platformList();
		System.out.println(platformlist);
		return platformlist;
	}
	@RequestMapping("/chatgenre")
	@ResponseBody
	public List<GenreDTO> chatGenre() {
		List<GenreDTO> allgenrelist = gameservice.allGenreList();
		System.out.println(allgenrelist);
		return allgenrelist;
	}
	
	@RequestMapping("/selectplatform")
	@ResponseBody
	public List<GenreDTO> selectPlatform(String platform) {
		List<GenreDTO> platformgenrelist = gameservice.platformGenreList(platform);
		System.out.println(platformgenrelist);
		return platformgenrelist;
	}
	
	@RequestMapping("/recommendgame3")
	@ResponseBody
	public List<GameDTO> recommendGame3(String platform, String genre) {
		List<GameDTO> recommendgamelist = gameservice.recommendGameList3(platform, genre);
		System.out.println(recommendgamelist.toString());
		return recommendgamelist;
	}
	
	@RequestMapping("/recommendgame4")
	@ResponseBody
	public List<GameDTO> recommendGame4(String genre) {
		List<GameDTO> recommendgamelist = gameservice.recommendGameList(genre);
		System.out.println(recommendgamelist.toString());
		return recommendgamelist;
	}
	
}
