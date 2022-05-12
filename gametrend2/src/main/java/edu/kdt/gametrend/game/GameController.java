package edu.kdt.gametrend.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	@Autowired
	@Qualifier("gameservice")
	GameService service;
	
	//인기게임순위 페이지
	@RequestMapping("/gamelist") 
	public ModelAndView gamelist(@RequestParam(required = false) String platform) { 
		if(platform == null) platform = "pc"; 
		ModelAndView mv = new ModelAndView(); 
		List<GameDTO> list = service.gameList(platform);
		List<GenreDTO> genre = service.genreList(platform);
		//int totalcnt = service.getGameListCnt(platform);
		//System.out.println(totalcnt);
	    mv.addObject("gamelist",list); 
	    mv.addObject("genrelist",genre); 
	    mv.setViewName("gamelist"); 
	    return mv;
	}
	//페이지네이션
/*	@RequestMapping("/gamelist") 
	public ModelAndView gamelist(@RequestParam(required = false) String platform) { 
		if(platform == null) platform = "pc"; 
		ModelAndView mv = new ModelAndView(); 
		List<GameDTO> list = service.gameList(platform);
		List<GenreDTO> genre = service.genreList(platform);
		//int totalcnt = service.getGameListCnt(platform);
		System.out.println(totalcnt);
	    mv.addObject("gamelist",list); 
	    mv.addObject("genrelist",genre); 
	    mv.setViewName("gamelist"); 
	    return mv;
	}
*/ 
/*	@RequestMapping("/gamelist") 
	public ModelAndView gamelist(@RequestParam(required = false) String platform, @RequestParam(required = false) Integer page) { 
		if(platform == null) platform = "pc";
		if(page == null) page = 1;
		int [] limit = new int[] {(page-1)*9, 9};
		ModelAndView mv = new ModelAndView(); 
		List<GameDTO> list = service.gameList(platform, limit);
	    mv.addObject("gamelist",list); 
	    mv.setViewName("gamelist"); 
	    return mv;
	}
*/ 
	
	//게임 상세 페이지
	@RequestMapping("/gamedetail")
	public ModelAndView gameDetail(int no) {
		ModelAndView mv = new ModelAndView();
		
		//게임 상세 페이지
		GameDTO gamedetail = service.gameDetail(no);
		mv.addObject("gamedetail", gamedetail);
		
		//게임 장르
		List<GenreDTO> list = service.gameGenreView(no);
		mv.addObject("gamegenre", list);
		
		mv.setViewName("gamedetail");
		return mv;
	}
	
	//@RequestMapping(value="/{platform}")

}
