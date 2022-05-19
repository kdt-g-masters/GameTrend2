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
	
	
	public List<CalendarDTO> loadOrderedGamedataXbox2015();
	
	public List<CalendarDTO> loadOrderedGamedataXbox2016();
	
	public List<CalendarDTO> loadOrderedGamedataXbox2017();
	
	public List<CalendarDTO> loadOrderedGamedataXbox2018();
	
	public List<CalendarDTO> loadOrderedGamedataXbox2019();
	
	public List<CalendarDTO> loadOrderedGamedataXbox2020();
	
	public List<CalendarDTO> loadOrderedGamedataXbox2021();
	
	
	public List<CalendarDTO> loadOrderedGamedataNS2015();
	
	public List<CalendarDTO> loadOrderedGamedataNS2016();
	
	public List<CalendarDTO> loadOrderedGamedataNS2017();
	
	public List<CalendarDTO> loadOrderedGamedataNS2018();
	
	public List<CalendarDTO> loadOrderedGamedataNS2019();
	
	public List<CalendarDTO> loadOrderedGamedataNS2020();
	
	public List<CalendarDTO> loadOrderedGamedataNS2021();

	/* 최신출시순 게임데이터 테스트 */
	public List<CalendarDTO> allGamedata();

}
