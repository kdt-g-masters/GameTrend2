package edu.kdt.gametrend.review;

import java.util.List;

public interface ReviewService {
	//한 게임의 리뷰 갯수
	public int countReviewgameNo(int game_no);
	
	//한 게임의 리뷰
	public List<ReviewDTO> selectReviewgameNo(int game_no);
	
	//리뷰 작성 여부 확인
	public int reviewCheck(ReviewDTO dto);
	
	//리뷰 작성
	public int insertReview(ReviewDTO dto);
	
	/*-------------------- 챗봇 --------------------*/
	//로그인한 회원의 리뷰리스트 조회
	public List<ReviewDTO> myReviewList(String member_id);
}
