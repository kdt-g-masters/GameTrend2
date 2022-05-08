package edu.kdt.gametrend.calendar;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("CalendarDAO")
public interface CalendarDAO {
	
	public List<CalendarDTO> calendarlist();

}
