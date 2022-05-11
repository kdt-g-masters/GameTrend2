package edu.kdt.gametrend.game;

import java.util.List;

public interface GameService {
	
	//메인 - 플랫폼별 게임 Top10 리스트
	public List<GameDTO> toptenList(String platform);
	
	//메인 게임 리스트
	public List<GameDTO> gameList(String platform, int [] limit);	
	
	//게임 상세 페이지
	public GameDTO gameDetail(int no);
	
	
	
}
