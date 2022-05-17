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
		
		// 게임 데이터 전체 로딩 
		List<CalendarDTO> gamedata = service.loadGamedata();
		
		// PC 게임 데이터 정렬 로딩 테스트 
		List<CalendarDTO> OrderedGamedataPCTest = service.loadOrderedGamedataPCTest(); 
		
		// 2015 PC 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPC2015 = service.loadOrderedGamedataPC2015();	
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("Data", gamedata);
		mv.addObject("DataPCTest", OrderedGamedataPCTest);
		mv.addObject("DataPC2015", OrderedGamedataPC2015);
		mv.setViewName("calendar");
		return mv; 
		
	}

}

