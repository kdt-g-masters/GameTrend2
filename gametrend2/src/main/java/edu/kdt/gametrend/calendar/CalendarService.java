package edu.kdt.gametrend.calendar;

import java.util.List;

public interface CalendarService {
	
	// 게임 데이터 전체 로딩 
	public List<CalendarDTO> loadGamedata();

	
	// PC 게임 데이터 정렬 로딩 테스트 
	public List<CalendarDTO> loadOrderedGamedataPCTest();
	
	
	// 2015 PC 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPC2015();

	// 2016 PC 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPC2016();

	// 2017 PC 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPC2017();

	// 2018 PC 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPC2018();

	// 2019 PC 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPC2019();

	// 2020 PC 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPC2020();

	// 2021 PC 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPC2021();

	
	// 2015 PS 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPS2015();

	// 2016 PS 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPS2016();

	// 2017 PS 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPS2017();

	// 2018 PS 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPS2018();

	// 2019 PS 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPS2019();

	// 2020 PS 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPS2020();

	// 2021 PS 게임 데이터 정렬 로딩 
	public List<CalendarDTO> loadOrderedGamedataPS2021();

}
