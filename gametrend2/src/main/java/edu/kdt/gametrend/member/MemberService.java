package edu.kdt.gametrend.member;

public interface MemberService {
	//로그인
	public MemberDTO loginMember(MemberDTO dto);
	
	//회원 가입
	public int joinMember(MemberDTO dto);
	
	//회원가입 아이디 중복 확인
	public boolean checkId(String id);
	
	//아이디 찾기(alert로 찾기)
	//public String findId(String name, String phone);

	//비밀번호 메일로 찾기
	public MemberDTO sendpw_(MemberDTO dto);

	//아이디 메일로 찾기
	public MemberDTO sendid_(MemberDTO dto);
	
<<<<<<< HEAD
	// 회원 정보 수정
	public int updateMember(MemberDTO dto);
=======
	//회원 가입 테스트
	//public int joinMember_(MemberDTO dto);
>>>>>>> devHH

}
