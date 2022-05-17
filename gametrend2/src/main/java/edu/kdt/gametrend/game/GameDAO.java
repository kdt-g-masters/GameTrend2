package edu.kdt.gametrend.game;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("gamedao")
public interface GameDAO {
	//메인 - 플랫폼별 Top10 게임 리스트
	public List<GameDTO> toptenList(String platform);
	
	//메인 - 플랫폼별 Top10 게임 장르
	public List<GenreDTO> genreToptenList(String platform);
	
	//게임리스트 플랫폼별 전체 갯수 조회
	public int getGameListCnt(Criteria cri);
	
	//게임리스트 플랫폼별 조회
	public List<GameDTO> gameList(String platform);
	
	//게임리스트 플랫폼별 장르 조회
	public List<GenreDTO> genreList(String platform);
		
	//게임리스트 페이징 조회
	public List<GameDTO> pagingGameList(Criteria cri);
	
	//게임리스트 장르 페이징 조회
	public List<GenreDTO> pagingGenreList(Criteria cri);
	
	/*----------------상세 페이지------------------*/
	//게임 상세 페이지
	public GameDTO gameDetail(int no);
	
	//게임 상세 페이지 장르 보여주기
	public List<GenreDTO> gameGenreView(int no);
	
	//추천 게임 보여주기
	public List<GameDTO> gameRecommend(String genre);

	/*-------------------- 챗봇 --------------------*/
	//플랫폼 종류
	public List<GameDTO> platformList();
	
	//게임 장르 전체 
	public List<GenreDTO> allGenreList();
	
	//선택한 플랫폼의 장르
	public List<GenreDTO> platformGenreList(String platform);
	
	//선택한 장르의 Top3게임 추천
	public List<GameDTO> recommendGameList(String genre);

}
