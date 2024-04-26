package richngo.dao;

import static richngo.common.JdbcTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import richngo.member.dto.MemberDto;
import richngo.member.dto.MemberInfoDto;
import richngo.member.dto.MemberLoginDto;

public class MemberDao {
	// select one login
	public MemberInfoDto loginGetInfo(Connection conn, MemberLoginDto dto) {

		MemberInfoDto result = null;
		String sql = "SELECT MEM_EMAIL FROM MEMBER WHERE MEM_EMAIL=? AND MEM_PWD=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setString(1, dto.getMemEmail());
			pstmt.setString(2, dto.getMemPwd());
			rs = pstmt.executeQuery();
			// ResetSet처리
			if(rs.next()) {
				result = new MemberInfoDto(rs.getString("MEM_EMAIL"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}
	
	// select one login
	public int login(Connection conn, MemberLoginDto dto) {
		int result = 0;
		String sql = "SELECT COUNT(*) c  FROM MEMBER WHERE MEM_EMAIL=? AND MEM_PWD=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setString(1, dto.getMemEmail());
			pstmt.setString(2, dto.getMemPwd());
			rs = pstmt.executeQuery();
			// ResetSet처리
			if(rs.next()) {
				result = rs.getInt("c");
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}
	
	
	
	// select one check email
	public int selectCheckEmail(Connection conn, String memEmail) {
		int result = 0;
		String sql = "SELECT COUNT(*) c  FROM MEMBER WHERE MEM_EMAIL=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setString(1, memEmail);
			rs = pstmt.executeQuery();
			// ResetSet처리
			if(rs.next()) {
				result = rs.getInt("c");
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}
	
	// select list - all
	public List<MemberDto> selectAllList(Connection conn) {
		System.out.println("MemberDao selectAllList");
		List<MemberDto> result = null;
		String sql = "SELECT MEM_CODE,MEM_EMAIL,MEM_PWD FROM MEMBER";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			rs = pstmt.executeQuery();
			// ResetSet처리
			if(rs.next()) {
				result = new ArrayList<MemberDto>();
				do {
					MemberDto dto = new MemberDto(rs.getString("MEM_CODE"), rs.getString("MEM_EMAIL"), rs.getString("MEM_PWD"));
					result.add(dto);
				}while (rs.next());
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		System.out.println("MemberDao selectAllList : "+ result);
		return result;
	}
	// select one
	public MemberDto selectOne(Connection conn, String memEmail) {
		MemberDto result = null;
		String sql = "SELECT MEM_CODE,MEM_EMAIL,MEM_PWD  FROM MEMBER WHERE MEM_EMAIL=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			// ? 처리
			pstmt.setString(1, memEmail);
			rs = pstmt.executeQuery();
			// ResetSet처리
			if(rs.next()) {
				result = new MemberDto(	rs.getString("MEM_CODE"),rs.getString("MEM_EMAIL"),rs.getString("MEM_PWD"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}
//	// insert
//	public int insert(Connection conn, MemberDto dto) {
//		int result = 0;
//		String sql = "INSERT INTO MEMBER (MEM_CODE,MEM_EMAIL,MEM_PWD) VALUES (?, ?, ?)";
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			// ? 처리
//			pstmt.setString(1, dto.getMemCode());
//			pstmt.setString(2, dto.getMemEmail());
//			pstmt.setString(3, dto.getMemPwd());
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		close(pstmt);
//		return result;
//	}
//	// update
//	public int update(Connection conn, MemberDto dto) {
//		int result = 0;
//		String sql = "";  
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			// ? 처리
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		close(pstmt);
//		return result;
//	}
//	// delete
//	public int delete(Connection conn, String memEmail) {
//		int result = 0;
//		String sql = "DELETE FROM MEMBER WHERE MEM_EMAIL=?";
//		PreparedStatement pstmt = null;
//		try {
//			pstmt = conn.prepareStatement(sql);
//			// ? 처리
//			pstmt.setString(1, memEmail);
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		close(pstmt);
//		return result;
//	}
	
}
