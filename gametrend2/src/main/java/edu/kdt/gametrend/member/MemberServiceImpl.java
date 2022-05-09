package edu.kdt.gametrend.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service("userService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private
	@Qualifier("userDAO")
	MemberDAO dao;
	
	@Override
	public MemberDTO loginUser(MemberDTO dto) {
		return dao.loginUser(dto);
	}
	
	/*@Override
	public UserDTO findId(UserDTO dto) {
		return dao.findId(dto);
	}*/

	/*@Override
	public UserDTO findPassword(UserDTO dto) {
		return dao.findPassword(dto);
	}*/
	
	@Override
	public boolean checkId(String id) {
		String result = dao.checkId(id);
		System.out.println(result);
		if (result == null) {
			return true;
		}
		else {
			return false;
		}
	}

	@Override
	public int joinInsertUser(MemberDTO dto) {
		return dao.joinInsertUser(dto);
	}
	
}
