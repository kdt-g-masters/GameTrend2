package edu.kdt.gametrend.admin;

import java.util.List;

import edu.kdt.gametrend.carousel.CarouselDTO;
import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.member.MemberDTO;
import edu.kdt.gametrend.promotion.PromotionDTO;
import edu.kdt.gametrend.review.ReviewDTO;

public interface AdminService {
	// 관리자 로그인
	public AdminDTO loginAdmin(AdminDTO dto);
	
	// 최근 추가된 게임 목록 확인
	public List<GameDTO> selectGameList(int[] limit);
	
	// 게임 추가
	public int insertGame(GameDTO dto);
	
	// 게임 삭제
	public int deleteGame(int no);
	
	// 번호로 게임 조회
	public GameDTO selectGame(int no);
	
	// 게임 수정
	public int updateGame(GameDTO dto);
	
	// 프로모션 목록
	public List<PromotionDTO> selectPromotionList();
	
	// 프로모션 추가
	public int insertPromotion(PromotionDTO dto);
	
	// 프로모션 삭제
	public int deletePromotion(String platform);
	
	// 프로모션 조회
	public PromotionDTO selectPromotion(String platform);
	
	// 프로모션 수정
	public int updatePromotion(PromotionDTO dto);
	
	// 리뷰 조회
	public List<ReviewGameDTO> selectReviewList();
	
	// 메인 이미지 조회
	public List<CarouselDTO> selectMainImgs();
	
	// 메인 이미지 추가
	public int insertMainImg(CarouselDTO dto);
	
	// 메인 이미지 삭제
	public int deleteMainimg(int no);
	
	// 메인 이미지 조회
	public CarouselDTO selectMainimg(int no);
	
	// 메인 이미지 수정
	public int updateMainimg(CarouselDTO dto);
}
