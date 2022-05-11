package edu.kdt.gametrend.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("reviewdao")
public interface ReviewDAO {
	
	public int countReviewgameNo(int game_no);
	
	public List<ReviewDTO> selectReviewgameNo(int game_no);
	
	public int insertReview(ReviewDTO dto);
	
}
