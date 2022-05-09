package edu.kdt.gametrend.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kdt.gametrend.member.MemberDTO;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("adminservice")
	AdminService service;
	
	// 관리자 로그인
	@RequestMapping(value="/admin")
	public String adminLogin() {
		return "adminLogin";
	}
	
	// 관리자 로그인 시도
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String adminLogin(HttpServletRequest request, AdminDTO dto) throws Exception {
		AdminDTO admin = service.loginAdmin(dto);
		
		if(admin != null && admin.getId() != null) {
			// 세션
			HttpSession session = request.getSession();
			
			// 관리자 로그인 상태로 설정
			session.setAttribute("isAdmin", true);
			
			// 관리자 정보 세션에 저장
			session.setAttribute("admin", admin);
				
			return "1";	
		}
		else {
			return "2";	
		}
	}
	
	
}
