package edu.kdt.gametrend.admin;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import edu.kdt.gametrend.game.GameDTO;

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
}
