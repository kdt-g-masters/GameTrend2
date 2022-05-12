package edu.kdt.gametrend.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("loginUser")
public class MemberController {

	@Autowired
	@Qualifier("MemberServiceImpl")
	MemberService service;
	
	// 로그인 페이지
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginform() {	
	}
	
	// 로그인 시도
	@RequestMapping(value="/login", method=RequestMethod.POST , produces = {"application/json;charset=utf-8"} )
	@ResponseBody
	public String loginAction(HttpServletRequest request, MemberDTO dto) throws Exception {
		MemberDTO loginUserDTO = service.loginMember(dto);
		
	if(loginUserDTO != null) {
		// 세션
		HttpSession session = request.getSession();
		
		//로그인 상태로 설정
		session.setAttribute("isLogOn", true);
		
		session.setAttribute("sessionid", loginUserDTO.getId());
		session.setAttribute("memberInfo", loginUserDTO.getId());
		
			return "1";	
		}
		else {
			return "2";		
		}
		
	}
	
	// 로그아웃
	/*
	@RequestMapping(value="/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("isLogOn", false);
		session.removeAttribute("memberInfo");
		mv.setViewName("redirect:/");
		return mv;
	}
	*/
	
	
	// 아이디 / 비밀번호 찾기 페이지
	@RequestMapping(value="/login2", method=RequestMethod.GET)
	public void loginfind() {	
	}
		
	// 회원가입 페이지
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joininsert() {	
	}
			
	// 회원가입
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView joinAction(MemberDTO dto) {
		int row = service.joinMember(dto);			
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", row);
		mv.setViewName("joinResult");
		return mv;
	}
	
	// 회원가입 아이디 중복확인 ajax 
	@RequestMapping(value="/join/checkid", method=RequestMethod.POST, produces={"application/json; charset=utf-8"})
	@ResponseBody
	public String checkId(String id) {
		boolean result = service.checkId(id);
		if (result == true) {
			return "{\"result\": \"사용 가능한 아이디 입니다.\", \"state\": \"available\"}";
		}
		else {			
			return "{\"result\": \"이미 존재하는 아이디 입니다. 다시 입력해주세요.\", \"state\": \"notAvailable\"}";
		}
	}
	
	@RequestMapping(value="/joinResult", method=RequestMethod.GET)
	public void joinResult() {	
	}
	
	
		
	
	
	//아이디 찾기 페이지
	/*@RequestMapping(value="/login2", method=RequestMethod.GET)
	public String findIdView() {
		return "";
	}*/
	
    // 아이디 찾기 
	/*@RequestMapping(value="/login2", method=RequestMethod.GET , produces = {"application/json;charset=utf-8"} )
	public String findIdAction(UserDTO dto) {
		UserDTO findId = service.findId(dto);
		
		if(findId == null) { 
			return "1";
		} else { 
			return "2";
			
		}
		
	}*/
	
    /* // 비밀번호 찾기 페이지 이동
	@RequestMapping(value="find_password_form")
	public String findPasswordView() {
		return "member/findPassword";
	} */
	
	
	//주석처리 안했던 곳
	/*@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String temp = (String) session.getAttribute("sessionid");
		if (temp != null) {
			System.out.println("세션에 저장된 아이디: " + temp);
		}
		return "index";
	}
	
	@RequestMapping("/join")
	public String joinForm() {
		return "join";
	} 여기까지*/
	
	
	
	
	/*
	@RequestMapping("/join/insertuser")
	public ModelAndView joinInsertUser(MemberDTO dto) {
		int row = service.joinInsertUser(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", row);
		mv.setViewName("joinResult");
		return mv;
	}
	*/
	
	/*
	// 회원가입 아이디 중복확인 ajax
	@RequestMapping(value="/join/checkid", method=RequestMethod.POST, produces={"application/json; charset=utf-8"})
	@ResponseBody
	public String checkId(String id) {
		boolean result = service.checkId(id);
		if (result == true) {
			return "{\"result\": \"사용 가능한 아이디 입니다.\", \"state\": \"available\"}";
		}
		else {			
			return "{\"result\": \""이미 존재하는 아이디 입니다. 다시 입력해주세요.\", \"state\": \"notAvailable\"}";
		}
	}
	*/
}
