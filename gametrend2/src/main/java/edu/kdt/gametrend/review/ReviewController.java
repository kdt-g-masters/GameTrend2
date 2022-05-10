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
	public int countReviewgameNo(int gameNo) {
		int countreview = service.countReviewgameNo(gameNo);
		return countreview;
	}
	
	@RequestMapping(value = "/reviewgameno", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<ReviewDTO> selectgameNo(int gameNo) {
		List<ReviewDTO> list = service.selectReviewgameNo(gameNo);
		return list;
	}
	
	
	/*
	@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	public String insertReviewform() {
		return "insert";
	}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST)
	public ModelAndView insertReview(ReviewDTO dto) { 
		int result = service.insertReview(dto);
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("sub");
		return mv;
		
	}
	*/
	
	
	//@RequestMapping(value = "/insertReview", method = RequestMethod.GET)
	//@ResponseBody 
	//public void insertReviewform() { 
	//}
	
	@RequestMapping(value = "/insertReview", method = RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody 
	public String insertReview(ReviewDTO dto) {
		System.out.println("����ǳ�");
		int result = service.insertReview(dto);
		if(result == 1) { 
			return "{\"check\":\"리뷰 작성 완료\"}"; 
		}
		else {
			return "{\"check\":\"리뷰 작성 실패\"}"; } 
	}
	
}
