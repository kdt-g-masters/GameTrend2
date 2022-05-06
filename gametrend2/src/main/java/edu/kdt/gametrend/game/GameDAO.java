package edu.kdt.gametrend.game;

<<<<<<< HEAD
public interface GameDAO {
=======
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("gamedao")
public class GameDAO {
	@Autowired
	SqlSession session;
	
	//���Ӹ���Ʈ ����¡ ��ȸ
	public List<GameDTO> gamelist(int page){
		int [] limit = new int[] {(page-1)*9, 9};
		List<GameDTO> list = session.selectList("paginglist",limit);
		return list;
	}
	
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
	
>>>>>>> devSH

}
