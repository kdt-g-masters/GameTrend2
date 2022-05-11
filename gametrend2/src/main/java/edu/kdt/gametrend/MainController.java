package edu.kdt.gametrend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.game.GameService;


@Controller
public class MainController {
	@Autowired
	@Qualifier("gameservice")
	GameService service;
	
	// 메인 화면
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public ModelAndView
	 * start() { ModelAndView mv = new ModelAndView(); mv.setViewName("index");
	 * return mv; }
	 */
	@RequestMapping(value ="/", method = RequestMethod.GET) 
	public ModelAndView toptenList() {
		ModelAndView mv = new ModelAndView();
		List<GameDTO> pcTopten = service.toptenList("pc");
		List<GameDTO> psTopten = service.toptenList("PlayStation");
		List<GameDTO> xboxTopten = service.toptenList("Xbox");
		List<GameDTO> switchTopten = service.toptenList("switch");
		mv.addObject("pcTopten", pcTopten);
		mv.addObject("psTopten", psTopten);
		mv.addObject("xboxTopten", xboxTopten);
		mv.addObject("switchTopten", switchTopten);
		mv.setViewName("index");//VIEW
		return mv;
	}
	
	/*
	 * @RequestMapping("/") public ModelAndView toptenList() { ModelAndView mv = new
	 * ModelAndView(); List<GameDTO> toptenlist = service.toptenList();
	 * mv.addObject("toptenlist",toptenlist); mv.setViewName("index"); return mv; }
	 */
}
