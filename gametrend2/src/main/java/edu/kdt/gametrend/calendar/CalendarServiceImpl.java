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

}
