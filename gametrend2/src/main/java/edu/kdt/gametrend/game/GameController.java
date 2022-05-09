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
	
	/*
	 * @RequestMapping("/list") public ModelAndView gamelist(@RequestParam(required
	 * = false) Integer page) { if(page == null) page = 1; ModelAndView mv = new
	 * ModelAndView(); List<GameDTO> list = service.gamelist(page);
	 * mv.addObject("paginglist",list); mv.addObject("name", "페이징처리리스트");
	 * mv.setViewName("index"); return mv; }
	 */
	
	//게임 상세 페이지
	@RequestMapping("/gamedetail")
	public ModelAndView gameDetail(int no) {
		ModelAndView mv = new ModelAndView();
		GameDTO gamedetail = service.gameDetail(no);
		mv.addObject("gamedetail", gamedetail);
		mv.setViewName("gamedetail");
		return mv;
	}
	
	//@RequestMapping(value="/{platform}")

}
