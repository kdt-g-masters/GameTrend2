package edu.kdt.gametrend.promotion;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("promotiondao")
public class PromotionDAO {
	public List<PromotionDTO> promotionlist(String platform);

}
