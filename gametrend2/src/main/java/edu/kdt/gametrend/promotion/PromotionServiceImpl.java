package edu.kdt.gametrend.promotion;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("promotionservice")
public class PromotionServiceImpl implements PromotionService {
	@Autowired
	@Qualifier("promotiondao")
	PromotionDAO dao;
	
	@Override
	public List<PromotionDTO> promotionlist(String platform) {
		return dao.promotionlist(platform);
	}
}
