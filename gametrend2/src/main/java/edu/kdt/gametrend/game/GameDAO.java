package edu.kdt.gametrend.game;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("gamedao")
public interface GameDAO {
	
	//���Ӹ���Ʈ ����¡ ��ȸ
//	public List<GameDTO> gamelist(int page) {
//		int [] limit = new int[] {(page-1)*9, 9};
//		List<GameDTO> list = session.selectList("paginglist",limit);
//		return list;
//	}
	
	//게임 상세 페이지
	public GameDTO gameDetail(int gameNo);
	
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
	
	//	//�� ���� ���ý� �Ѱ��� �� ���� ��ȸ
//	public GameDTO game(int gameNo){
//		return session.selectOne("game", gameNo);
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
