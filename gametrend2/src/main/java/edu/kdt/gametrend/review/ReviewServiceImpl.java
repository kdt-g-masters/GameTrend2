package edu.kdt.gametrend.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("reviewservice")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	@Qualifier("reviewdao")
	ReviewDAO dao;
	
	//리뷰 작성
	@Override
	public int insertReview(ReviewDTO dto) {
		return dao.insertReview(dto);
	}
	
	//리뷰 수정
	@Override
	public int updateReview(ReviewDTO dto) {
		return dao.updateReview(dto);
	}
	
	//리뷰 삭제
	@Override
	public int deleteReview(ReviewDTO dto) {
		return dao.deleteReview(dto);
	}

	//한 게임의 리뷰
	@Override
	public List<ReviewDTO> selectReviewgameNo(int game_no) {
		return dao.selectReviewgameNo(game_no);
	}
	
	//리뷰 작성 여부 확인
	@Override
	public int reviewCheck(ReviewDTO dto) {
		return dao.reviewCheck(dto);
	}
	
	//리뷰 작성 내용
	@Override
	public ReviewDTO reviewMemberGame(ReviewDTO dto) {
		return dao.reviewMemberGame(dto);
	}

	//한 게임의 리뷰 갯수
	@Override
	public int countReviewgameNo(int game_no) {
		return dao.countReviewgameNo(game_no);
	}
	
	//리뷰수 게임 테이블 반영
	@Override
	public int gameReviewCount(GameReviewsDTO dto) {
		return dao.gameReviewCount(dto);
	}
	
	/*-------------------- 챗봇 --------------------*/
	//로그인한 회원의 리뷰리스트 조회
	@Override
	public List<ReviewDTO> myReviewList(String member_id) {
		return dao.myReviewList(member_id);
	}
	
}
