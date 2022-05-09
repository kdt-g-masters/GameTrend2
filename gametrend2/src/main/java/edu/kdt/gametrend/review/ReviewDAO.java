package edu.kdt.gametrend.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("reviewdao")
public interface ReviewDAO {
	
	public List<ReviewDTO> selectAllReview();
	
	public int selectCountReview();
	
	public int countReviewgameNo(int gameNo);
	
	public List<ReviewDTO> selectReviewgameNo(int gameNo);
	
	public int insertReview(ReviewDTO dto);
	
}
