package edu.kdt.gametrend.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.promotion.PromotionDTO;

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
}
