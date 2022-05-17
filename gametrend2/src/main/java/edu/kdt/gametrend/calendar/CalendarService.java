package edu.kdt.gametrend.calendar;

import java.util.List;

public interface CalendarService {
	
	// 게임 데이터 전체 로딩 
	public List<CalendarDTO> loadGamedata();
	
	// PC 게임 데이터 정렬 로딩
	public List<CalendarDTO> loadOrderedGamedataPCTest(); 

}
