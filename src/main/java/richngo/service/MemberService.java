package richngo.service;

import static richngo.common.JdbcTemplate.*;
import java.sql.Connection;
import java.util.List;

import richngo.dao.MemberDao;
import richngo.member.dto.MemberDto;
import richngo.member.dto.MemberInfoDto;
import richngo.member.dto.MemberLoginDto;


public class MemberService {
	private MemberDao dao = new MemberDao(); 
	
	
	// select Login get Info
	public MemberInfoDto loginGetInfo(MemberLoginDto dto) {
		MemberInfoDto result = null;
		Connection conn = getConnection(false);
		result = dao.loginGetInfo(conn, dto);
		close(conn);
		return result;
	}
	// select Login
	public int login(MemberLoginDto dto) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.login(conn, dto);
		close(conn);
		return result;
	}
	
	// select checkEmail
	public int selectCheckEmail(String memEmail) {
		int result = 0;
		Connection conn = getConnection(false);
		result = dao.selectCheckEmail(conn, memEmail);
		close(conn);
		return result;
	}

	
	// select list - all
	public List<MemberDto> selectAllList() {
		List<MemberDto> result = null;
		Connection conn = getConnection(false);
		result = dao.selectAllList(conn);
		close(conn);
		return result;
	}
	// select one
	public MemberDto selectOne(String memId) {
		MemberDto result = null;
		Connection conn = getConnection(false);
		result = dao.selectOne(conn, memId);
		close(conn);
		return result;
	}
//	// insert
//	public int insert(MemberDto dto) {
//		int result = 0;
//		Connection conn = getSemiConnection(false);
//		result = dao.insert(conn, dto);
//		close(conn);
//		return result;
//	}
//	// update
//	public int update(MemberDto dto) {
//		int result = 0;
//		Connection conn = getSemiConnection(false);
//		result = dao.update(conn, dto);
//		close(conn);
//		return result;
//	}
//	// delete
//	public int delete(String memId) {
//		int result = 0;
//		Connection conn = null;
//		result = dao.delete(conn, memId);
//		close(conn);
//		return result;
//	}
}
