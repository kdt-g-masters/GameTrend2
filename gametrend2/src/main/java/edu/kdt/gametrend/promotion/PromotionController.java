package edu.kdt.gametrend.promotion;

import java.util.List;

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
	
	// 할인 이벤트 로딩 
	@RequestMapping(value="/promotion", method=RequestMethod.POST)
	public ModelAndView promotionAction2() {
		
		List<PromotionDTO> promotiondata = service.loadPromotionEvent(); 
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("Event", promotiondata); 
		mv.setViewName("promotion");
		return mv;
		
	}
		
}
