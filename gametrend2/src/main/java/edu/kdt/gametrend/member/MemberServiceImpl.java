package edu.kdt.gametrend.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {

	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	// 로그인
	@Override
	public MemberDTO loginMember(MemberDTO dto) {
		return dao.loginMember(dto);
	}
	
	//회원가입
	@Override
	public int joinMember(MemberDTO dto) {
		return dao.joinMember(dto);
	}
	
	//회원가입 아이디 중복 체크
	@Override
	public boolean checkId(String id) {
		String result = dao.checkId(id);
		System.out.println(result);
		if(result == null) {
			return true;
		}
		else {
			return false;
		}
	}
	
	
	/*@Override
	public UserDTO findId(UserDTO dto) {
		return dao.findId(dto);
	}*/

	/*@Override
	public UserDTO findPassword(UserDTO dto) {
		return dao.findPassword(dto);
	}*/
	
	/*
	@Override
	public boolean checkId(String id) {
		String result = dao.checkId(id);
		System.out.println(result);
		if (result == null) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public int joinInsertUser(MemberDTO dto) {
		return dao.joinInsertUser(dto);
	}
	*/
	
}
