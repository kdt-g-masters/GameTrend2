package edu.kdt.gametrend.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("CalendarDAO")
public interface CalendarDAO {
	
	public List<CalendarDTO> loadGamedata(); 
	
	public List<CalendarDTO> loadOrderedGamedataPCTest(); 
	
	public List<CalendarDTO> loadOrderedGamedataPC2015();
	
	public List<CalendarDTO> loadOrderedGamedataPC2016();

}
