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
	public List<GameDTO> gameList(String platform, int [] limit) {
		return dao.gameList(platform, limit);
	}
	
	@Override
	public GameDTO gameDetail(int no) {
		return dao.gameDetail(no);
	}	
}
