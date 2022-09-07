package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.NoticeVO;
import utils.DBCPUtil;

public class NoticeDAOImpl implements NoticeDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	@Override
	public boolean noticeWrite(NoticeVO vo) {
		boolean writeCheck = false;
		
		String sql = "INSERT INTO notice_board(n_category, n_author, n_title, n_content) VALUES(?, ?, ?, ?)";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNotice_category());
			pstmt.setString(2, vo.getNotice_author());
			pstmt.setString(3, vo.getNotice_title());
			pstmt.setString(4, vo.getNotice_content());
			
			int result = pstmt.executeUpdate();
			
			if (result > 0) {
				writeCheck = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		
		return writeCheck;
	}

	@Override
	public ArrayList<NoticeVO> noticeList(int startRow, int count) {

		ArrayList<NoticeVO> list = new ArrayList<>(); 		
		String sql = "SELECT * FROM notice_board ORDER BY n_num DESC limit ?, ?";
		
		conn = DBCPUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, count);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				NoticeVO n = new NoticeVO(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getTimestamp(6));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}

		return list;
	}

	@Override
	public int getTotalCount() {
		int totalCount = 0;
		
		String sql = "SELECT count(*) FROM notice_board";
		
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
	public NoticeVO noticeDetail(int notice_num) {
		NoticeVO notice = null;
		
		String sql = "SELECT * FROM notice_board WHERE n_num = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				notice = new NoticeVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getTimestamp(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return notice;
	}

	@Override
	public boolean noticeUpdate(NoticeVO vo) {
		boolean updateCheck = false;
		
		String sql = "UPDATE notice_board SET n_category = ?, n_author = ?, n_title = ?, n_content = ?, n_date = now() WHERE n_num = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNotice_category());
			pstmt.setString(2, vo.getNotice_author());
			pstmt.setString(3, vo.getNotice_title());
			pstmt.setString(4, vo.getNotice_content());
			pstmt.setInt(5, vo.getNotice_num());
			
			int result = pstmt.executeUpdate();
			
			if (result > 0) {
				updateCheck = true;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		
		return updateCheck;
	}

	@Override
	public boolean noticeDelete(int notice_num) {
		boolean deleteCheck = false;
		
		String sql = "DELETE FROM notice_board WHERE n_num = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_num);			
			
			int result = pstmt.executeUpdate();
			
			if (result > 0) {
				deleteCheck = true;
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		return deleteCheck;
	}

}
