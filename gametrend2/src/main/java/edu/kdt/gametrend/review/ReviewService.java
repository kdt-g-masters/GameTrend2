package edu.kdt.gametrend.review;

import java.util.List;

public interface ReviewService {
	public int countReviewgameNo(int game_no);
	public List<ReviewDTO> selectReviewgameNo(int game_no);
	
	public int insertReview(ReviewDTO dto);
}
