package edu.kdt.gametrend.explanation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	
	// 소개 페이지 호출 및 로딩 (PC) 
	@RequestMapping(value="/explanation1a")
	@ResponseBody
		public ModelAndView explanationAction2() { 
		
		 
//		ExplanationDTO explanationdata = service.loadExplanation(dto);
		
		// 플랫폼 소개 로딩
		String delivery="PC";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", delivery);
		mv.setViewName("explanation"); 
		return mv;
		
	}

	// 소개 페이지 호출 및 로딩 (PS) 
	@RequestMapping(value="/explanation1b")
	@ResponseBody
		public ModelAndView explanationAction3() { 
			
		// 플랫폼 소개 로딩
		String delivery="PS";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", delivery);
		mv.setViewName("explanation"); 
		return mv;
		
	}

	// 소개 페이지 호출 및 로딩 (Xbox) 
	@RequestMapping(value="/explanation1c")
	@ResponseBody
		public ModelAndView explanationAction4() { 
		
		// 플랫폼 소개 로딩
		String delivery="Xbox";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", delivery);
		mv.setViewName("explanation"); 
		return mv;
		
	}

	// 소개 페이지 호출 및 로딩 (NS) 
	@RequestMapping(value="/explanation1d")
	@ResponseBody
		public ModelAndView explanationAction5() { 
	
		// 플랫폼 소개 로딩
		String delivery="NS";
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("flatExpla", delivery);
		mv.setViewName("explanation"); 
		return mv;
		
	}

	
	
	// 테스트 페이지 호출 
	/*
	 * @RequestMapping(value="/Testpage", method=RequestMethod.GET) public String
	 * explanationAction3() { return "Testpage"; }
	 */	

}
