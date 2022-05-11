package edu.kdt.gametrend.game;

import java.util.List;

public interface GameService {
	
	//메인 - 플랫폼별 Top10 게임리스트
	public List<GameDTO> toptenList(String platform);
	
	//메인 - 플랫폼별 Top10 게임장르
	public List<GenreDTO> genreToptenList(String platform);
	
	//게임리스트 플랫폼별 전체 갯수 조회
	public int totalcnt(String platform);
		
	//게임리스트 플랫폼별 조회
	public List<GameDTO> gameList(String platform);	
	
	//게임리스트 플랫폼별 장르 조회
	public List<GenreDTO> genreList(String platform);	
		
	//게임리스트 페이징 조회
	//public List<GameDTO> gameList(String platform, int [] limit);	
	
	//게임 상세 페이지
	public GameDTO gameDetail(int no);
	
	//게임 상세 페이지 장르 보여주기
	public List<GenreDTO> gameGenreView(int no);
	
}
