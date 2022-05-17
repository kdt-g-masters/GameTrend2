package edu.kdt.gametrend.game;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameController {
	@Autowired
	@Qualifier("gameservice")
	GameService service;
	
	//페이지네이션
	@RequestMapping(value="/gamelist", method=RequestMethod.GET) 
	public ModelAndView gamelist(Criteria cri, HttpServletResponse response) throws Exception { 
		ModelAndView mv = new ModelAndView();
		List<GameDTO> gamelist = service.pagingGameList(cri);
		List<GenreDTO> genrelist = service.pagingGenreList(cri);
		mv.addObject("gamelist", gamelist);
		mv.addObject("genrelist", genrelist);
		
		//페이징 인터페이스
		int total = service.getGameListCnt(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		mv.addObject("pageMaker", pageMake);
	 
		//뒤로가기 버튼으로 목록 페이지 이동 시 조회수 반영
		response.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
		response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
		response.addHeader("Cache-Control", "post-check=0, pre-check=0"); 
		response.setHeader("Pragma", "no-cache");
		
	    mv.setViewName("gamelist"); 
	    return mv;
	}


	
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
