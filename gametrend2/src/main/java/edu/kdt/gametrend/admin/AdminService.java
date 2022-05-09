package edu.kdt.gametrend.admin;

import edu.kdt.gametrend.member.MemberDTO;

public interface AdminService {
	// 관리자 로그인
	public AdminDTO loginAdmin(AdminDTO dto);
}
