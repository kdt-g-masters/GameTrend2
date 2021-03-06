package edu.kdt.gametrend.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import edu.kdt.gametrend.carousel.CarouselDTO;
import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.promotion.PromotionDTO;
import edu.kdt.gametrend.review.ReviewDTO;

@Mapper
@Repository("adminDAO")
public interface AdminDAO {

	// 관리자 로그인
	public AdminDTO loginAdmin(AdminDTO dto);
	
	// 최근 추가된 게임 목록
	public List<GameDTO> selectGameList(int[] limit);
	
	// 게임 추가
	public int insertGame(GameDTO dto);
	
	// 게임 삭제
	public int deleteGame(int no);
	
	// 게임 조회
	public GameDTO selectGame(int no);
	
	// 게임 수정
	public int updateGame(GameDTO dto);
	
	// 프로모션 리스트
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
	
	// 리뷰 승인
	public int updateReviewAppr(int no);
	
	// 리뷰 비승인
	public int updateReviewDisappr(int no, String disapprRsn);
	
	// 메인 이미지 리스트
	public List<CarouselDTO> selectMainImgs();
	
	// 메인 이미지 추가
	public int insertMainImg(CarouselDTO dto);
	
	// 메인 이미지 삭제
	public int deleteMainimg(int no);
	
	// 메인 이미지 조회
	public CarouselDTO selectMainimg(int no);
	
	// 메인 이미지 수정
	public int updateMainimg(CarouselDTO dto);
	
	/*----- 마이 페이지 - 나의 리뷰 -----*/
	// 승인 여부에 따른 사용자의 리뷰 리스트
	public List<ReviewGameDTO> selectReviewAppr(String member_id, int approve);
}
