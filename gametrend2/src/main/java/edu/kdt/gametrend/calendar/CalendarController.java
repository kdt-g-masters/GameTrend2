package edu.kdt.gametrend.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {
	
	@Autowired
	@Qualifier("CalendarServiceImpl")
	CalendarService service;
	
	// 달력 페이지 호출  
	@RequestMapping(value="/calendar", method=RequestMethod.GET) 
		public String calendarAction1() {
			return "calendar"; 
	}
	
	// 달력 내용 로딩 
	@RequestMapping(value="/calendar", method=RequestMethod.POST)
	public ModelAndView calendarAction2() { 
		
		List<CalendarDTO> gamedata = service.loadGamedata();
//		List<CalendarDTO> OrderedGamedata = service.loadOrderedGamedata(); 
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("Data", gamedata);
		mv.setViewName("calendar");
		return mv; 
		
	}

}

