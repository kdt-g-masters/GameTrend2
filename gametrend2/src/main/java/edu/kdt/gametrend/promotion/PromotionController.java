package edu.kdt.gametrend.promotion;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PromotionController {
	
	@Autowired
	@Qualifier("PromotionServiceImpl")
	PromotionService service;
	
	// 할인 페이지 호출  
	@RequestMapping(value="/promotion", method=RequestMethod.GET) 
		public String promotionAction1() {
			return "promotion"; 
		}
	
	@RequestMapping(value="/promotion", method=RequestMethod.POST)
	public ModelAndView promotionAction2() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("promotion");
		return mv;
	}
	
}
