package edu.kdt.gametrend.review;

import java.util.List;

public interface ReviewService {
	public int countReviewgameNo(int game_no);
	public List<ReviewDTO> selectReviewgameNo(int game_no);
	
	public int insertReview(ReviewDTO dto);
	
	/*-------------------- 챗봇 --------------------*/
	//로그인한 회원의 리뷰리스트 조회
	public List<ReviewDTO> myReviewList(String member_id);
}
