package edu.kdt.gametrend.review;

import java.util.List;

public interface ReviewService {
	public List<ReviewDTO> selectAllReview();
	public int selectCountReview();
	public int countReviewgameNo(int gameNo);
	public List<ReviewDTO> selectReviewgameNo(int gameNo);
	
	public int insertReview(ReviewDTO dto);
}
