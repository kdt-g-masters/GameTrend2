package edu.kdt.gametrend.review;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("reviewdao")
public interface ReviewDAO {
	//한 게임의 리뷰 갯수
	public int countReviewgameNo(int game_no);
	
	//한 게임의 리뷰
	public List<ReviewDTO> selectReviewgameNo(int game_no);
	
	//리뷰 작성 여부 확인
	public int reviewCheck(ReviewDTO dto);
	
	//리뷰 작성 내용
	public ReviewDTO reviewMemberGame(ReviewDTO dto);
	
	//리뷰 작성
	public int insertReview(ReviewDTO dto);
	
	//리뷰 수정
	public int updateReview(ReviewDTO dto);
	
	//리뷰 삭제
	public int deleteReview(ReviewDTO dto);
	
	/*-------------------- 챗봇 --------------------*/
	//로그인한 회원의 리뷰리스트 조회
	public List<ReviewDTO> myReviewList(String member_id);
}
