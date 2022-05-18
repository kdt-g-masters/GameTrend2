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
	
	//한 게임의 리뷰 갯수
	@RequestMapping(value = "/countreviewgameno", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int countReviewgameNo(int game_no) {
		int countreview = service.countReviewgameNo(game_no);
		return countreview;
	}
	
	//한 게임의 리뷰
	@RequestMapping(value = "/reviewgameno", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<ReviewDTO> selectgameNo(int game_no) {
		List<ReviewDTO> list = service.selectReviewgameNo(game_no);
		return list;
	}
	
	//리뷰 작성 & 리뷰 여부 확인
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String insertReview(ReviewDTO dto) {
		int check = service.reviewCheck(dto);
		if(check == 0) {
			int result = service.insertReview(dto);
			if(result == 1) { 
				return "{\"check\":\"리뷰 작성 완료\"}"; 
			}
			else {
				return "{\"check\":\"리뷰 작성 실패\"}";
			}
		}
		else {
			return "no";
		}
	}
	
	//리뷰 확인 & 수정,삭제 버튼
	@RequestMapping(value = "/reviewcheck", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public int reviewCheck(ReviewDTO dto) {
		int check = service.reviewCheck(dto);
		return check;
	}
	
	//리뷰 수정
	@RequestMapping(value = "/updatereview", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String updateReview(ReviewDTO dto) {
		int result = service.updateReview(dto);
		if(result == 1) {
			return "{\"check\":\"리뷰 수정 완료\"}";
		}
		else {
			return "{\"check\":\"리뷰 수정 실패\"}";
		}
	}
	
	//리뷰 삭제
	@RequestMapping(value = "/deletereview", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String deleteReview(ReviewDTO dto) {
		int result = service.deleteReview(dto);
		if(result == 1) {
			return "{\"check\":\"리뷰 삭제 완료\"}";
		}
		else {
			return "{\"check\":\"리뷰 삭제 실패\"}";
		}
	}
	
	//리뷰 작성 내용
	@RequestMapping(value = "/reviewmembergame", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public ReviewDTO reviewMemberGame(ReviewDTO dto) {
		ReviewDTO review = service.reviewMemberGame(dto);
		return review;
	}
	
}
