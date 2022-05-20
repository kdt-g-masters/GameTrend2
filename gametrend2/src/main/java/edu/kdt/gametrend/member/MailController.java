package edu.kdt.gametrend.member;

import java.util.concurrent.ThreadLocalRandom;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("mail")
public class MailController {
	
	@Autowired
	@Qualifier("MemberServiceImpl")
	MemberService memberService;
	
	@Autowired
	@Qualifier("MailServiceImpl")
	MailService mailService;
	

    // 메일에 인증번호 보내기
    @RequestMapping("/join.do")
    @ResponseBody
    	public String SendMail(String mail) {
    	String key = "";
    	key = Integer.toString( ThreadLocalRandom.current().nextInt(100000, 1000000) );
		mailService.send(mail, key);
		return key;
    	}
    

    // 비밀번호 찾기 
    @RequestMapping(value= "/mail_ok.do", method=RequestMethod.GET)
    @ResponseBody
    public ModelAndView mail_pw(HttpServletRequest req, MemberDTO dto) throws Exception {
   		//System.out.println( "mail 호출" );
   		String result = mailService.sendpw( req.getParameter("email"), dto);
   		ModelAndView modelAndView = new ModelAndView("mail_ok");
   		modelAndView.addObject("auth", result);
   		return modelAndView;
    	}
    
    // 아이디 찾기
    @RequestMapping(value= "/mail_ok2.do", method=RequestMethod.GET)
    @ResponseBody
    public ModelAndView mail_id(HttpServletRequest re, MemberDTO dto) throws Exception {
   		//System.out.println( "mail 호출" );
   		String findid = mailService.sendid(re.getParameter("email"), dto);
   		ModelAndView modelAndView = new ModelAndView("mail_ok2" );
   		modelAndView.addObject("result", findid );
   		return modelAndView;
    	}
 
}
