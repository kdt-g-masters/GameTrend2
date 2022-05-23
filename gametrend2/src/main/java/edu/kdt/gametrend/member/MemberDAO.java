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
	//아이디 찾기(alert로 찾기)
	//public String findId(String name, String phone);	
	
	//비밀번호 찾기
	public MemberDTO sendpw_(MemberDTO dto);
	//메일로 아이디 찾기
	public MemberDTO sendid_(MemberDTO dto);

}
