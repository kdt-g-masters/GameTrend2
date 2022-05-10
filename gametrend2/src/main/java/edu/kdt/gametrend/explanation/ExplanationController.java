package edu.kdt.gametrend.explanation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExplanationController {
	
	@Autowired
	@Qualifier("ExplanationServiceImpl")
	ExplanationService service;
	
	// 소개 페이지 호출 
	@RequestMapping(value="/explanation", method=RequestMethod.GET)
		public String explanationAction1() { 
			return "explanation";
	}
	
	// 소개 페이지 호출 기본 
	@RequestMapping(value="/explanation1a", method=RequestMethod.POST)
		public ModelAndView explanationAction2(ExplanationDTO dto) { 
		
		// 플랫폼 소개 로딩 
		ExplanationDTO explanationdata = service.loadExplanation(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", explanationdata);
		mv.setViewName("explanation"); 
		return mv;
		
	}
	
	// 테스트 페이지 호출 
	@RequestMapping(value="/Testpage", method=RequestMethod.GET)
		public String explanationAction3() { 
			return "Testpage";
	}	

}
