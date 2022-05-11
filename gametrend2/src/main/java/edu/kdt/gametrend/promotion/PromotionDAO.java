package edu.kdt.gametrend.promotion;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("PromotionDAO")
public interface PromotionDAO {
	
	public List<PromotionDTO> loadPromotionEvent(); 

}
