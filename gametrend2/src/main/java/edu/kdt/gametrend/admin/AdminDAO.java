package edu.kdt.gametrend.admin;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("adminDAO")
public interface AdminDAO {

	// 관리자 로그인
	public AdminDTO loginAdmin(AdminDTO dto);
}
