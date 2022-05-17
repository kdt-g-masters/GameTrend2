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

	@Override
	public List<CalendarDTO> loadOrderedGamedataPC2017() { 
		return dao.loadOrderedGamedataPC2017();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPC2018() { 
		return dao.loadOrderedGamedataPC2018();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPC2019() { 
		return dao.loadOrderedGamedataPC2019();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPC2020() { 
		return dao.loadOrderedGamedataPC2020();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPC2021() { 
		return dao.loadOrderedGamedataPC2021();
	}

	
	@Override
	public List<CalendarDTO> loadOrderedGamedataPS2015() { 
		return dao.loadOrderedGamedataPS2015();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPS2016() { 
		return dao.loadOrderedGamedataPS2016();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPS2017() { 
		return dao.loadOrderedGamedataPS2017();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPS2018() { 
		return dao.loadOrderedGamedataPS2018();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPS2019() { 
		return dao.loadOrderedGamedataPS2019();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPS2020() { 
		return dao.loadOrderedGamedataPS2020();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataPS2021() { 
		return dao.loadOrderedGamedataPS2021();
	}
	
	
	@Override
	public List<CalendarDTO> loadOrderedGamedataXbox2015() { 
		return dao.loadOrderedGamedataXbox2015();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataXbox2016() { 
		return dao.loadOrderedGamedataXbox2016();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataXbox2017() { 
		return dao.loadOrderedGamedataXbox2017();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataXbox2018() { 
		return dao.loadOrderedGamedataXbox2018();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataXbox2019() { 
		return dao.loadOrderedGamedataXbox2019();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataXbox2020() { 
		return dao.loadOrderedGamedataXbox2020();
	}

	@Override
	public List<CalendarDTO> loadOrderedGamedataXbox2021() { 
		return dao.loadOrderedGamedataXbox2021();
	}


}
