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

	public List<CalendarDTO> loadOrderedGamedataPC2017();

	public List<CalendarDTO> loadOrderedGamedataPC2018();

	public List<CalendarDTO> loadOrderedGamedataPC2019();

	public List<CalendarDTO> loadOrderedGamedataPC2020();

	public List<CalendarDTO> loadOrderedGamedataPC2021();

	
	public List<CalendarDTO> loadOrderedGamedataPS2015();
	
	public List<CalendarDTO> loadOrderedGamedataPS2016();
	
	public List<CalendarDTO> loadOrderedGamedataPS2017();
	
	public List<CalendarDTO> loadOrderedGamedataPS2018();
	
	public List<CalendarDTO> loadOrderedGamedataPS2019();
	
	public List<CalendarDTO> loadOrderedGamedataPS2020();
	
	public List<CalendarDTO> loadOrderedGamedataPS2021();

}
