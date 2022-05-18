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
	
	/*-------------------- 챗봇 --------------------*/
	//로그인한 회원의 리뷰리스트 조회
	public List<ReviewDTO> myReviewList(String member_id);
}
