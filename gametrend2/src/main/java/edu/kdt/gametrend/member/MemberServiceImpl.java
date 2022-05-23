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
		//System.out.println(result);
		if(result == null) {
			return true;
		}
		else {
			return false;
		}
	}
	/*
	//아이디 찾기(alert로 찾기)
	@Override
	public String findId(String name, String phone) {
		String result = "";
		try {
			result = dao.findId(name, phone);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}
	*/
	
	// 비밀번호 찾기
	@Override
	public MemberDTO sendpw_(MemberDTO dto) {
		return dao.sendpw_(dto);
	}
	
	// 메일로 아이디 찾기
	@Override
	public MemberDTO sendid_(MemberDTO dto) {
		return dao.sendid_(dto);
	}

}
