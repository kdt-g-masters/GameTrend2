package edu.kdt.gametrend.calendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("CalendarServiceImpl")
public class CalendarServiceImpl implements CalendarService {
	
	@Autowired
	@Qualifier("CalendarDAO")
	CalendarDAO dao;
	
	@Override
	public List<CalendarDTO> loadGamedata() { 
		return dao.loadGamedata();
	}
	
	@Override
	public List<CalendarDTO> loadOrderedGamedataPCTest() { 
		return dao.loadOrderedGamedataPCTest(); 
	} 
	
	@Override
	public List<CalendarDTO> loadOrderedGamedataPC2015() { 
		return dao.loadOrderedGamedataPC2015();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPC2016() { 
		return dao.loadOrderedGamedataPC2016();
	}

}
