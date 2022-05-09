package edu.kdt.gametrend.explanation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExplanationController {
	
	// 소개 페이지 호출 
	@RequestMapping(value="/explanation", method=RequestMethod.GET)
		public String explanationAction1() { 
			return "explanation";
	}

}
