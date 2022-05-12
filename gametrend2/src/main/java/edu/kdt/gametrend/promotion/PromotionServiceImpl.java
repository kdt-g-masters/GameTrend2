package edu.kdt.gametrend.promotion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("PromotionServiceImpl")
public class PromotionServiceImpl implements PromotionService {
	
	@Autowired
	@Qualifier("PromotionDAO")
	PromotionDAO dao;
	
	@Override
	public List<PromotionDTO> loadPromotionEvent() {
		return dao.loadPromotionEvent();
	}
	
}
