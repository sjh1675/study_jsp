package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import utils.Criteria;
import utils.DBCPUtil;
import vo.TestGuestBookVO;

public class GuestbookDAOImpl implements GuestbookDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	@Override
	public ArrayList<TestGuestBookVO> gbList(Criteria cri) {
		ArrayList<TestGuestBookVO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM test_guestbook ORDER BY id DESC limit ?, ?";
		
		conn = DBCPUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getStartRow());
			pstmt.setInt(2, cri.getPerPageNum());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				TestGuestBookVO gb = new TestGuestBookVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(gb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
				
		return list;
	}

	@Override
	public int gbTotalCount() {
		
		String sql = "SELECT count(*) FROM test_guestbook";
		int totalCount = 0;
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		return totalCount;
	}

	@Override
	public int gbWrite(String name, String password, String content) {
		int result = 0;
		
		String sql = "INSERT INTO test_guestbook VALUES(null, ?, ?, ?)";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, content);		
			
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		
		return result;
	}

	@Override
	public int gbDelete(int id, String password) {
		int result = 0;
		
		String sql = "DELETE FROM test_guestbook WHERE id = ? AND password = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setString(2, password);

			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		
		return result;
	}

}
