package edu.kdt.gametrend.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.member.MemberDAO;
import edu.kdt.gametrend.member.MemberDTO;
import edu.kdt.gametrend.promotion.PromotionDTO;

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
	
	
}
