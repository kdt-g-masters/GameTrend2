package edu.kdt.gametrend.member;

public interface MemberService {
	//로그인
	public MemberDTO loginMember(MemberDTO dto);
	
	//회원 가입
	public int joinMember(MemberDTO dto);
	
	//회원가입 아이디 중복 확인
	public boolean checkId(String id);
	
	//public UserDTO findId(UserDTO dto);
	
	//UserDTO findPassword(UserDTO dto);
	
	//public boolean checkId(String id);
	
	//public int joinInsertUser(MemberDTO dto);
}
