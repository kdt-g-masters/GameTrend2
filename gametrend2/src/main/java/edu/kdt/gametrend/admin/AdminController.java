package edu.kdt.gametrend.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("adminservice")
	AdminService service;
	
	// 관리자 로그인
	@RequestMapping(value="/admin")
	public void adminLogin() {}
	
}