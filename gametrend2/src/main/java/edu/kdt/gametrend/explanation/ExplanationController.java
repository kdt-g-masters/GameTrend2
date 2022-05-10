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
	
	
	
	// 소개 페이지 호출 기본 (PC) 
	@RequestMapping(value="/explanation1a", method=RequestMethod.POST)
		public ModelAndView explanationAction2(ExplanationDTO dto) { 
		
		 
//		ExplanationDTO explanationdata = service.loadExplanation(dto);
		
		// 플랫폼 소개 로딩
		String delivery="PC";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", delivery);
		mv.setViewName("explanation"); 
		return mv;
		
	}

	// 소개 페이지 호출 (PS) 
	@RequestMapping(value="/explanation1b", method=RequestMethod.POST)
		public ModelAndView explanationAction3(ExplanationDTO dto) { 
			
		// 플랫폼 소개 로딩
		String delivery="PS";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", delivery);
		mv.setViewName("explanation"); 
		return mv;
		
	}

	// 소개 페이지 호출 (Xbox) 
	@RequestMapping(value="/explanation1c", method=RequestMethod.POST)
		public ModelAndView explanationAction4(ExplanationDTO dto) { 
		
		// 플랫폼 소개 로딩
		String delivery="Xbox";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", delivery);
		mv.setViewName("explanation"); 
		return mv;
		
	}

	// 소개 페이지 호출 (NS) 
	@RequestMapping(value="/explanation1d", method=RequestMethod.POST)
		public ModelAndView explanationAction5(ExplanationDTO dto) { 
	
		// 플랫폼 소개 로딩
		String delivery="NS";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", delivery);
		mv.setViewName("explanation"); 
		return mv;
		
	}

	
	
	// 테스트 페이지 호출 
	@RequestMapping(value="/Testpage", method=RequestMethod.GET)
		public String explanationAction3() { 
			return "Testpage";
	}	

}
