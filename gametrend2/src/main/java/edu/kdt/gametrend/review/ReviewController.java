package edu.kdt.gametrend.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	@Autowired
	@Qualifier("reviewservice")
	ReviewService service;
	
	@RequestMapping(value = "/countreviewgameno", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int countReviewgameNo(int game_no) {
		int countreview = service.countReviewgameNo(game_no);
		return countreview;
	}
	
	@RequestMapping(value = "/reviewgameno", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<ReviewDTO> selectgameNo(int game_no) {
		List<ReviewDTO> list = service.selectReviewgameNo(game_no);
		return list;
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody 
	public String insertReview(ReviewDTO dto) {
		int result = service.insertReview(dto);
		if(result == 1) { 
			return "{\"check\":\"리뷰 작성 완료\"}"; 
		}
		else {
			return "{\"check\":\"리뷰 작성 실패\"}"; } 
	}
	
}
