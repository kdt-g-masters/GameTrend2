package edu.kdt.gametrend.promotion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PromotionController {
	@Autowired
	@Qualifier("promotionservice")
	PromotionService service;
	
	@RequestMapping(value="/promotion")
	public ModelAndView carouselist() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("promotion");
		return mv;
	}
}
