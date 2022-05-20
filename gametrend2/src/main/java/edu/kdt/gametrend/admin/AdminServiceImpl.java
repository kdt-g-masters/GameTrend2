package edu.kdt.gametrend.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kdt.gametrend.carousel.CarouselDTO;
import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.member.MemberDAO;
import edu.kdt.gametrend.member.MemberDTO;
import edu.kdt.gametrend.promotion.PromotionDTO;
import edu.kdt.gametrend.review.ReviewDTO;

@Service("adminservice")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	@Qualifier("adminDAO")
	AdminDAO dao;

	// 관리자 로그인
	@Override
	public AdminDTO loginAdmin(AdminDTO dto) {		
		return dao.loginAdmin(dto);
	}

	// 최근 추가된 게임 목록
	@Override
	public List<GameDTO> selectGameList(int[] limit) {
		return dao.selectGameList(limit);
	}

	// 게임 추가
	@Override
	public int insertGame(GameDTO dto) {
		return dao.insertGame(dto);
	}

	// 게임 삭제
	@Override
	public int deleteGame(int no) {
		return dao.deleteGame(no);
	}

	// 게임 조회
	@Override
	public GameDTO selectGame(int no) {
		return dao.selectGame(no);
	}

	// 게임 수정
	@Override
	public int updateGame(GameDTO dto) {		
		return dao.updateGame(dto);
	}

	// 프로모션 목록
	@Override
	public List<PromotionDTO> selectPromotionList() {
		return dao.selectPromotionList();
	}

	// 프로모션 추가
	@Override
	public int insertPromotion(PromotionDTO dto) {
		return dao.insertPromotion(dto);
	}

	// 프로모션 삭제
	@Override
	public int deletePromotion(String platform) {
		return dao.deletePromotion(platform);
	}

	// 프로모션 조회
	@Override
	public PromotionDTO selectPromotion(String platform) {
		return dao.selectPromotion(platform);
	}

	// 프로모션 수정
	@Override
	public int updatePromotion(PromotionDTO dto) {
		return dao.updatePromotion(dto);
	}

	// 리뷰 조회
	@Override
	public List<ReviewGameDTO> selectReviewList() {
		return dao.selectReviewList();
	}
	
	// 리뷰 승인
	@Override
	public int updateReviewAppr(int no) {
		return dao.updateReviewAppr(no);
	}
	
	// 리뷰 비승인
	@Override
	public int updateReviewDisappr(int no, String disapprRsn) {
		return dao.updateReviewDisappr(no, disapprRsn);
	}

	// 메인 이미지 조회
	@Override
	public List<CarouselDTO> selectMainImgs() {
		return dao.selectMainImgs();
	}

	// 메인 이미지 추가
	@Override
	public int insertMainImg(CarouselDTO dto) {
		return dao.insertMainImg(dto);
	}

	// 메인 이미지 삭제
	@Override
	public int deleteMainimg(int no) {
		return dao.deleteMainimg(no);
	}

	// 메인 이미지 조회
	@Override
	public CarouselDTO selectMainimg(int no) {
		return dao.selectMainimg(no);
	}

	// 메인 이미지 수정
	@Override
	public int updateMainimg(CarouselDTO dto) {
		return dao.updateMainimg(dto);
	}
	
	/*----- 마이 페이지 - 나의 리뷰 -----*/
	// 승인 여부에 따른 사용자의 리뷰 리스트
	@Override
	public List<ReviewGameDTO> selectReviewAppr(String member_id, int approve) {
		return dao.selectReviewAppr(member_id, approve);
	}

}
