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

		// 2016 PC 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPC2016 = service.loadOrderedGamedataPC2016();	

		// 2017 PC 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPC2017 = service.loadOrderedGamedataPC2017();	

		// 2018 PC 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPC2018 = service.loadOrderedGamedataPC2018();	

		// 2019 PC 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPC2019 = service.loadOrderedGamedataPC2019();	

		// 2020 PC 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPC2020 = service.loadOrderedGamedataPC2020();	

		// 2021 PC 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPC2021 = service.loadOrderedGamedataPC2021();	
		
		
		// 2015 PS 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPS2015 = service.loadOrderedGamedataPS2015();	

		// 2016 PS 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPS2016 = service.loadOrderedGamedataPS2016();	

		// 2017 PS 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPS2017 = service.loadOrderedGamedataPS2017();	

		// 2018 PS 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPS2018 = service.loadOrderedGamedataPS2018();	

		// 2019 PS 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPS2019 = service.loadOrderedGamedataPS2019();	

		// 2020 PS 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPS2020 = service.loadOrderedGamedataPS2020();	

		// 2021 PS 게임 데이터 정렬 로딩 
		List<CalendarDTO> OrderedGamedataPS2021 = service.loadOrderedGamedataPS2021();	

		
		ModelAndView mv = new ModelAndView();
		mv.addObject("Data", gamedata);
		mv.addObject("DataPCTest", OrderedGamedataPCTest);
		
		mv.addObject("DataPC2015", OrderedGamedataPC2015);
		mv.addObject("DataPC2016", OrderedGamedataPC2016);
		mv.addObject("DataPC2017", OrderedGamedataPC2017);
		mv.addObject("DataPC2018", OrderedGamedataPC2018);
		mv.addObject("DataPC2019", OrderedGamedataPC2019);
		mv.addObject("DataPC2020", OrderedGamedataPC2020);
		mv.addObject("DataPC2021", OrderedGamedataPC2021);	
		
		mv.addObject("DataPS2015", OrderedGamedataPS2015);
		mv.addObject("DataPS2016", OrderedGamedataPS2016);
		mv.addObject("DataPS2017", OrderedGamedataPS2017);
		mv.addObject("DataPS2018", OrderedGamedataPS2018);
		mv.addObject("DataPS2019", OrderedGamedataPS2019);
		mv.addObject("DataPS2020", OrderedGamedataPS2020);
		mv.addObject("DataPS2021", OrderedGamedataPS2021);
		
		
		mv.setViewName("calendar");
		return mv; 
		
	}

}

