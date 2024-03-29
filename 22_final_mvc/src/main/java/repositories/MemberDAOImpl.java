package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import beans.MemberVO;
import utils.DBCPUtil;

public class MemberDAOImpl implements MemberDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	@Override
	public boolean memberJoin(MemberVO member) {
		
		conn = DBCPUtil.getConnection();
		String sql = "INSERT INTO mvc_member(id, pass, name, age, gender) VALUES(?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setInt(4, member.getAge());
			pstmt.setString(5, member.getGender());
			int result = pstmt.executeUpdate(); 
						
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		
		return false;
	}

	@Override
	public MemberVO memberLogin(String id, String pass) {
		MemberVO member = null;
		String sql = "SELECT * FROM mvc_member WHERE id = ? AND pass = ? AND joinYN != 'N'";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberVO(
						rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),
						rs.getString(7).charAt(0), rs.getTimestamp(8), rs.getTimestamp(9)
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
				
		return member;
	}

	@Override
	public boolean memberUpdate(MemberVO member) {
		
		String sql = "UPDATE mvc_member SET pass = ?, name = ?, age = ?, gender = ?, updatedate = now() WHERE num = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPass());
			pstmt.setString(2, member.getName());
			pstmt.setInt(3, member.getAge());
			pstmt.setString(4, member.getGender());
			pstmt.setInt(5, member.getNum());
			
			int result = pstmt.executeUpdate();
			
			if (result > 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}		
		return false;
	}

	@Override
	public MemberVO getMemberById(String id) {
		MemberVO member = null;
		conn = DBCPUtil.getConnection();
		String sql = "SELECT * FROM mvc_member WHERE id = ? AND joinYN != 'N'";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberVO(
						rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),
						rs.getString(7).charAt(0), rs.getTimestamp(8), rs.getTimestamp(9)
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		
		return member;
	}

	@Override
	public void withDrawMember(int num) {
		
		String sql = "UPDATE mvc_member SET joinYN = 'N' WHERE num = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			int result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
	}

	@Override
	public boolean checkMember(String id, String name) {
		boolean isCheck = false;
		String sql = "SELECT * FROM mvc_member WHERE id = ? AND name = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
				
		return isCheck;
	}

	@Override
	public void addPassCode(String id, String code) {
		// id가 이미 테이블에 등록되어 있다면 코드만 수정
		// 등록된 아이디가 없다면 삽입
		
		String sql = "SELECT * FROM test_code WHERE id = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				// 테이블 내 아이디 존재 --> update
				sql = "UPDATE test_code SET code = ? WHERE id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, code);
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			} else {
				// 아이디 없음 --> insert
				sql = "INSERT INTO test_code VALUES(?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, code);
				pstmt.executeUpdate();
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
	}

	@Override
	public boolean checkPassCode(String id, String code) {
		boolean isCheck = false;
		
		String sql = "SELECT * FROM test_code WHERE id = ? AND code = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, code);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				isCheck = true;
			}
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		
		return isCheck;
	}

	@Override
	public void changePass(String id, String pass) {
		String sql = "UPDATE mvc_member SET pass = ? WHERE id = ?";
		conn = DBCPUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			
			int result = pstmt.executeUpdate();
			if (result > 0) {
				sql = "DELETE FROM test_code WHERE id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
	}
	
}