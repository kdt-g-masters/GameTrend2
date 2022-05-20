package edu.kdt.gametrend.member;

public interface MailService {
	
	//인증번호 보내기
	public int send(String strTo, String authKey); 
	
	// 비밀번호 메일로 보내기
	public String sendpw(String strTo, MemberDTO dto);
    
	// 아이디 메일로 보내기
	public String sendid(String to, MemberDTO dto);
		
}
