package edu.kdt.gametrend.calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

}


