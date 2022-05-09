package edu.kdt.gametrend.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.kdt.gametrend.member.MemberDAO;
import edu.kdt.gametrend.member.MemberDTO;

@Service("adminservice")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	@Qualifier("adminDAO")
	AdminDAO dao;

	// 관리자 로그인
	@Override
	public AdminDTO loginAdmin(AdminDTO dto) {		
		return dao.loginAdmin(dto);
	}
	
}
