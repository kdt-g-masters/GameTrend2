package edu.kdt.gametrend.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("MailServiceImpl")
public class MailServiceImpl implements MailService {

	@Autowired
	private JavaMailSender javaMailSender;
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	@Autowired
	@Qualifier("MemberServiceImpl")
	MemberService memberService;

	// 인증번호 보내기
    @Override
    public int send(String strTo, String authKey) {
    	// 받는사람을 담을 변수 선언
    			String to = strTo;
    			String key = authKey;
    			 //flag = 0 실패
    			 //flag = 1 성공
    			 
    			int flag = 0;	
    			
    			try {
    				// 텍스트로 구성된 메일을 생성할때
    				SimpleMailMessage simpleMessage = new SimpleMailMessage();
    				
    				// 인증키 6자리 랜덤으로 생성 후 초기화
    				//String authKey = Integer.toString( ThreadLocalRandom.current().nextInt(100000, 1000000) );
    				
    				// 받는사람 설정
    				simpleMessage.setTo( to );
    				
    				// 제목
    				simpleMessage.setSubject("GameTrend에서 인증번호를 보냈습니다.");
    				
    				// 메일 내용
    				simpleMessage.setText("인증번호는 " + key  + " 입니다.\n 이용해주셔서 감사합니다."); // authKey 
    				
    				System.out.println(javaMailSender);
    				// 메일 발송
    				javaMailSender.send(simpleMessage);
    				flag = 1;
    			} catch (MailException e) {
    				
    				e.printStackTrace();
    			}
    			return flag;
    	    }
   
   
    //비밀번호 보내기
    @Override
    public String sendpw(String strTo, MemberDTO dto) {
    	String to = strTo;
    	String pw = "";
    	String flag = "";
    	//flag = 0 실패
		//flag = 1 성공
    	
    	flag = null;
    	
		MemberDTO pwdto = memberService.sendpw_(dto);
   		if(pwdto != null && pwdto.getEmail() != null && pwdto.getId() != null) {
   			System.out.println(pwdto.getPassword());
   			pw = pwdto.getPassword();
   		}else {
   			System.out.println("아이디와 비밀번호 불일치");
   			return "0";
   		}
		
		try {
			// 텍스트로 구성된 메일을 생성할때
			SimpleMailMessage simpleMessage = new SimpleMailMessage();		
			// 메일 내용
			simpleMessage.setText(pwdto.getId()+ " " + "님의 비밀번호는" + " " +pw + " " + "입니다. \n\n이용해 주셔서 감사합니다");
			// 받는사람 설정
			simpleMessage.setTo(to);			
			// 제목
			simpleMessage.setSubject("GameTrend에서 비밀번호를 보냈습니다.");
			System.out.println(javaMailSender);
			// 메일 발송
			javaMailSender.send(simpleMessage);
			flag = "1";
		
		} catch (MailException e) {
			
			e.printStackTrace();
			flag = "0";
		}
		return flag;		
    }
    
  //아이디 보내기
    @Override
    public String sendid(String to, MemberDTO dto) {
    	String strTo = to;
    	String id = "";
    	String flag = "";
    	//flag = 0 실패
		//flag = 1 성공
    	
    	flag = null;
    	
    	dto = memberService.sendid_(dto);
   		if(dto != null && dto.getEmail() != null && dto.getName() != null) {
   			System.out.println(dto.getId());
   			id = dto.getId();
   		}else {
   			System.out.println("이름과 이메일 불일치");
   			
   			
   			return "0";
   		}
   		 			
   		try {
			// 텍스트로 구성된 메일을 생성할때
			SimpleMailMessage simpleMessage = new SimpleMailMessage();		
			// 메일 내용
			simpleMessage.setText("귀하께서 찾으시는 아이디는 " + " " + id + " " + "입니다. \n\n이용해 주셔서 감사합니다");
			// 받는사람 설정
			simpleMessage.setTo(strTo);			
			// 제목
			simpleMessage.setSubject("GameTrend에서 아이디를 보냈습니다.");
			System.out.println(javaMailSender);
			// 메일 발송
			javaMailSender.send(simpleMessage);
			flag = "1";
		
		} catch (MailException e) {
			
			e.printStackTrace();
			flag = "0";
		}
		return flag;		
    }
}
