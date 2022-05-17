package edu.kdt.gametrend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.gametrend.carousel.CarouselDTO;
import edu.kdt.gametrend.carousel.CarouselService;
import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.game.GameService;
import edu.kdt.gametrend.game.GenreDTO;


@Controller
public class MainController {
	@Autowired
	@Qualifier("gameservice")
	GameService game;
	
	@Autowired
	@Qualifier("carouselservice")
	CarouselService carousel;
	// 메인 화면
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public ModelAndView
	 * start() { ModelAndView mv = new ModelAndView(); mv.setViewName("index");
	 * return mv; }
	 */
	@RequestMapping(value ="/", method = RequestMethod.GET) 
	public ModelAndView toptenList() {
		ModelAndView mv = new ModelAndView();
		List<CarouselDTO> carousellist = carousel.carousellist();
		mv.addObject("carousellist", carousellist);
		
		List<GameDTO> pcTopten = game.toptenList("pc");
		List<GenreDTO> pcGenreTopten = game.genreToptenList("pc");
		List<GameDTO> psTopten = game.toptenList("PlayStation");
		List<GenreDTO> psGenreTopten = game.genreToptenList("PlayStation");
		List<GameDTO> xboxTopten = game.toptenList("Xbox");
		List<GenreDTO> xboxGenreTopten = game.genreToptenList("Xbox");
		List<GameDTO> switchTopten = game.toptenList("Switch");
		List<GenreDTO> switchGenreTopten = game.genreToptenList("Switch");
		
		mv.addObject("pcTopten", pcTopten);
		mv.addObject("pcGenreTopten", pcGenreTopten);
		mv.addObject("psTopten", psTopten);
		mv.addObject("psGenreTopten", psGenreTopten);
		mv.addObject("xboxTopten", xboxTopten);
		mv.addObject("xboxGenreTopten", xboxGenreTopten);
		mv.addObject("switchTopten", switchTopten);
		mv.addObject("switchGenreTopten", switchGenreTopten);
		mv.setViewName("index");//VIEW
		return mv;
	}
	
}
