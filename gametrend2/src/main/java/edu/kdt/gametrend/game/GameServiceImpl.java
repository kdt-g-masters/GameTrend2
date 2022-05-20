package edu.kdt.gametrend.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("gameservice")
public class GameServiceImpl implements GameService {
	
	@Autowired
	@Qualifier("gamedao")
	GameDAO dao;
	
	@Override
	public List<GameDTO> toptenList(String platform){
		return dao.toptenList(platform);
	}
	
	@Override
	public List<GenreDTO> genreToptenList(String platform) {
		return dao.genreToptenList(platform);
	}
    
	@Override
	public int getGameListCnt(Criteria cri){
		return dao.getGameListCnt(cri);
	}

	@Override
	public List<GameDTO> gameList(String platform) {
		return dao.gameList(platform);
	}
	
	@Override
	public List<GenreDTO> genreList(String platform) {
		return dao.genreList(platform);
	}

	@Override 
	public List<GameDTO> pagingGameList(Criteria cri) {
		return dao.pagingGameList(cri); 
	}
	
	@Override 
	public List<GenreDTO> pagingGenreList(Criteria cri)  {
		return dao.pagingGenreList(cri);
	}
	
	@Override
	public GameDTO gameDetail(int no) {
		return dao.gameDetail(no);
	}
	
	@Override
	public int gameReviewCount(GameDTO dto) {
		return dao.gameReviewCount(dto);
	}

	@Override
	public List<GenreDTO> gameGenreView(int no) {
		return dao.gameGenreView(no);
	}
	
	@Override
	public List<GenreDTO> genreOfWishlist(String member_id) {
		return dao.genreOfWishlist(member_id);
	}

	@Override
	public List<GenreDTO> genreOfReviewlist(String member_id) {
		return dao.genreOfReviewlist(member_id);
	}

	@Override
	public List<GameDTO> gameRecommend(String genre) {
		return dao.gameRecommend(genre);
	}

	public List<GameDTO> platformList() {
		return dao.platformList();
	}

	@Override
	public List<GenreDTO> allGenreList() {
		return dao.allGenreList();
	}

	@Override
	public List<GenreDTO> platformGenreList(String platform) {
		return dao.platformGenreList(platform);
	}


	@Override
	public List<GameDTO> recommendGameList3(String platform, String genre) {
		return dao.recommendGameList3(platform, genre);
	}

	@Override
	public List<GameDTO> recommendGameList(String genre) {
		return dao.recommendGameList(genre);
	}
	
}
