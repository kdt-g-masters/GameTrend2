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
	public int totalcnt(String platform) {
		return dao.totalcnt(platform);
	}

	@Override
	public List<GameDTO> gameList(String platform) {
		return dao.gameList(platform);
	}
	
	@Override
	public List<GenreDTO> genreList(String platform) {
		return dao.genreList(platform);
	}

	/*
	 * @Override public List<GameDTO> gameList(String platform, int [] limit) {
	 * return dao.gameList(platform, limit); }
	 */
	
	
	@Override
	public GameDTO gameDetail(int no) {
		return dao.gameDetail(no);
	}

	@Override
	public List<GenreDTO> gameGenreView(int no) {
		return dao.gameGenreView(no);
	}
	
}
