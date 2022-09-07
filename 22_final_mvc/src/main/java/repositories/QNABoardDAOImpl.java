package repositories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import beans.BoardVO;
import utils.Criteria;
import utils.DBCPUtil;

public class QNABoardDAOImpl implements QNABoardDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	@Override
	public int getListCount() {
				
		String sql = "SELECT count(*) FROM question_answer";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {		
			DBCPUtil.close(rs, pstmt, conn);			
		}
		return 0;
	}

	@Override
	public ArrayList<BoardVO> getBoardList(Criteria cri) {
		ArrayList<BoardVO> list = new ArrayList<>();
		String sql = "SELECT Q.*, M.name AS qna_name FROM question_answer AS Q, mvc_member AS M WHERE Q.qna_writer_num = M.num ORDER BY Q.qna_re_ref DESC, Q.qna_re_seq ASC limit ?, ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getStartRow());
			pstmt.setInt(2, cri.getPerPageNum());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVO board = getBoardVO(rs);
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		
		return list;
	}

	private BoardVO getBoardVO(ResultSet rs) throws SQLException {
		BoardVO board = new BoardVO();
		board.setQna_num(rs.getInt("qna_num"));
		board.setQna_title(rs.getString("qna_title"));
		board.setQna_content(rs.getString("qna_content"));
		board.setQna_re_ref(rs.getInt("qna_re_ref"));
		board.setQna_re_lev(rs.getInt("qna_re_lev"));
		board.setQna_re_seq(rs.getInt("qna_re_seq"));
		board.setQna_num(rs.getInt("qna_num"));
		board.setQna_writer_num(rs.getInt("qna_writer_num"));
		board.setQna_readcount(rs.getInt("qna_readcount"));
		board.setQna_delete(rs.getString("qna_delete").charAt(0));
		board.setQna_date(rs.getTimestamp("qna_date"));
		board.setQna_name(rs.getString("qna_name"));
		return board;
	}

	@Override
	public void boardWrite(BoardVO board) {
		String sql = "INSERT INTO question_answer VALUES(null, ?, ?, 0, 0, 0, ?, 0, 'N', now())";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			conn.setAutoCommit(false);		// 트랜잭션 만드는 법 : 오토커밋 해제
			pstmt.setString(1, board.getQna_title());
			pstmt.setString(2, board.getQna_content());
			pstmt.setInt(3, board.getQna_writer_num());
			pstmt.executeUpdate();
			
			sql = "SELECT LAST_INSERT_ID()";	// 가장 최근에 등록된 게시글 번호
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			int qna_num = 0;
			if (rs.next()) {
				qna_num = rs.getInt(1);
			}
			System.out.println("삽입된 원본글 번호 : " + qna_num);
			
			sql = "UPDATE question_answer SET qna_re_ref = ? WHERE qna_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			pstmt.setInt(2, qna_num);
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {}
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {}
			DBCPUtil.close(rs, pstmt, conn);
		}
	}

	@Override
	public BoardVO getBoardVO(int board_num) {		
		BoardVO board = null;
		
		String sql = "SELECT Q.*, M.name AS qna_name FROM question_answer AS Q, mvc_member AS M WHERE Q.qna_writer_num = M.num AND qna_num = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = getBoardVO(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(rs, pstmt, conn);
		}
		
		return board;
	}

	@Override
	public void updateReadCount(int board_num) {
		
		String sql = "UPDATE question_answer SET qna_readcount = qna_readcount + 1 WHERE qna_num  = ?";
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		
		
	}

	@Override
	public void boardReplySubmit(BoardVO board) {
		int ref = board.getQna_re_ref();
		int lev = board.getQna_re_lev();
		int seq = board.getQna_re_seq();
		
		String sql = "UPDATE question_answer SET qna_re_seq = qna_re_seq + 1 WHERE qna_re_seq > ? AND qna_re_ref = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			conn.setAutoCommit(false);
		} catch (SQLException e2) {
			e2.printStackTrace();
		}
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			pstmt.setInt(2, ref);
			pstmt.executeUpdate();
			
			sql = "INSERT INTO question_answer VALUES(null, ?, ?, ?, ?, ?, ?, 0, 'N', now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getQna_title());
			pstmt.setString(2, board.getQna_content());
			pstmt.setInt(3, ref);
			pstmt.setInt(4, lev + 1);
			pstmt.setInt(5, seq + 1);
			pstmt.setInt(6, board.getQna_writer_num());
			pstmt.executeUpdate();
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {e1.printStackTrace();}
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {e.printStackTrace();}
			DBCPUtil.close(pstmt, conn);
		}
		
	}

	@Override
	public void boardUpdate(BoardVO board) {
		
		String sql = "UPDATE question_answer SET qna_title = ?, qna_content = ? WHERE qna_num = ? AND qna_writer_num = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getQna_title());
			pstmt.setString(2, board.getQna_content());
			pstmt.setInt(3, board.getQna_num());
			pstmt.setInt(4, board.getQna_writer_num());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		
	}

	@Override
	public boolean boardDelete(int board_num, int qna_writer_num) {
		
		String sql = "UPDATE question_answer SET qna_delete = 'Y' WHERE qna_num = ? AND qna_writer_num = ?";
		
		conn = DBCPUtil.getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setInt(2, qna_writer_num);
			int result = pstmt.executeUpdate();
			if (result > 0) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCPUtil.close(pstmt, conn);
		}
		
		return false;
	}

}
