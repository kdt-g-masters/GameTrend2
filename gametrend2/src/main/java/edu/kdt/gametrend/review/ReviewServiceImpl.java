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
	
	@Override
	public int insertReview(ReviewDTO dto) {
		return dao.insertReview(dto);
	}

	@Override
	public List<ReviewDTO> selectReviewgameNo(int game_no) {
		return dao.selectReviewgameNo(game_no);
	}

	@Override
	public int countReviewgameNo(int game_no) {
		return dao.countReviewgameNo(game_no);
	}
	
}
