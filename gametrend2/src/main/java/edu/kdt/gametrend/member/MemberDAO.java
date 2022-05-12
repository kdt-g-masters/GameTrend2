package edu.kdt.gametrend.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	//로그인
	public MemberDTO loginMember(MemberDTO dto); 
	//회원가입
	public int joinMember(MemberDTO dto); 
	// 회원가입 아이디 중복 체크
	public String checkId(String id);
	
}

	
	
	
	
//public MemberDTO loginUser(MemberDTO dto) {
//System.out.println("==> Mybatis�� loginUser() ��� ó��");
//return session.selectOne("loginUser", dto);
//}

	/*public UserDTO findId(UserDTO dto) {
		System.out.println("==> Mybatis�� findId() ��� ó��");
		return session.selectOne("findId", dto);
	}*/

	/* public UserDTO findPassword(UserDTO dto) {
		System.out.println("==> Mybatis�� findPassword() ��� ó��");
		return session.selectOne("UserDAO.findPassword", dto);
	}*/

	/*
	// ���̵� �ߺ�Ȯ��
	public String checkId(String id) {
		System.out.println("dao Ŭ���� " + session.selectOne("checkId", id));
		return session.selectOne("checkId", id);
	}
	
	public int joinInsertUser(MemberDTO dto) {
		int row = session.insert("joinInsertUser", dto);
		return row;
	}
	*/
