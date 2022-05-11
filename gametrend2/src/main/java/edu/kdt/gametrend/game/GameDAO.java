package edu.kdt.gametrend.game;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("gamedao")
public interface GameDAO {
	
	//메인 - 플랫폼별 게임 Top10 리스트
	public List<GameDTO> toptenList(String platform);
	
	//게임리스트 페이징 조회
	public List<GameDTO> gameList(String platform, int [] limit);	
	
	//게임 상세 페이지
	public GameDTO gameDetail(int no);
	
	//게임 상세 페이지 장르 보여주기
	public List<GenreDTO> gameGenreView(int no);
	
//	public int totalcount() {
//		return session.selectOne("totalgamecnt");
//	}
//	
//	public int totalcount(String platform) {
//		return session.selectOne("platformtotal");
//	}
	//	//�÷����� ���ӷ�ŷ ��ȸ
//	public List<GameDTO> gamelist(String platform){
//		return session.selectList("platformgamesearch", platform);
//	}

	//�����߰�
//	public int insertgame(GameDTO dto) {
//		return session.insert("insertgame", dto);
//	}
//	//�������� ����
//	public int updategame(GameDTO dto) {
//		return session.update("updategame", dto);
//	}
//	//���� ����
//	public int deletegame(int gameNo) {
//		return session.delete("deletegame", gameNo);
//	}


}
