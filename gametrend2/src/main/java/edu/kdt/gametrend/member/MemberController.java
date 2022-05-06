package edu.kdt.gametrend.member;

import javax.servlet.http.HttpServletRequest;
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
	@Qualifier("userService")
	MemberService service;
	
	// �α��� ������
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginform() {	
	}
	
    // �α��� �õ�
	@RequestMapping(value="/login", method=RequestMethod.POST , produces = {"application/json;charset=utf-8"} )
	@ResponseBody
	public String loginAction(HttpServletRequest request, MemberDTO dto) throws Exception {
		MemberDTO loginUser = service.loginUser(dto);
		
	if(loginUser != null) {
		// ���� ���̵� ��������
		HttpSession session = request.getSession();
		session.setAttribute("sessionid", loginUser.getId());
		return "1";//{\"process\":\"����α���\" , \"role\":\"user\"}";	
		}
		else {
		return "2";//"{\"process\":\"������α���\" , \"role\":\"admin\"}";		
		}
		
	}
	
	//���̵� ã�� ������ �̵�
	/*@RequestMapping(value="/login2", method=RequestMethod.GET)
	public String findIdView() {
		return "";
	}*/
	
    // ���̵� ã�� ����
	/*@RequestMapping(value="/login2", method=RequestMethod.GET , produces = {"application/json;charset=utf-8"} )
	public String findIdAction(UserDTO dto) {
		UserDTO findId = service.findId(dto);
		
		if(findId == null) { 
			return "1";
		} else { 
			return "2";
			
		}
		
	}*/
	
    /* // ��й�ȣ ã�� �������� �̵�
	@RequestMapping(value="find_password_form")
	public String findPasswordView() {
		return "member/findPassword";
	} */
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String temp = (String) session.getAttribute("sessionid");
		if (temp != null) {
			System.out.println("���ǿ� ����� ���̵�: " + temp);
		}
		return "index";
	}
	
	@RequestMapping("/join")
	public String joinForm() {
		return "join";
	}
	
	@RequestMapping("/join/insertuser")
	public ModelAndView joinInsertUser(MemberDTO dto) {
		int row = service.joinInsertUser(dto);
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("result", row);
		mv.setViewName("joinResult");
		return mv;
	}
	
	
	// ȸ������ ���̵� �ߺ�Ȯ�� ajax
	@RequestMapping(value="/join/checkid", method=RequestMethod.POST, produces={"application/json; charset=utf-8"})
	@ResponseBody
	public String checkId(String id) {
		boolean result = service.checkId(id);
		if (result == true) {
			return "{\"result\": \"��� ������ ���̵��Դϴ�.\", \"state\": \"available\"}";
		}
		else {			
			return "{\"result\": \"�̹� �����ϴ� ���̵� �Դϴ�. �ٽ� �Է����ּ���.\", \"state\": \"notAvailable\"}";
		}
	}
}
