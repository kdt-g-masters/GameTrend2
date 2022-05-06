package edu.kdt.gametrend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.game.GameService;


@Controller
public class MainController {
	
	// 메인 화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView start() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}
}
