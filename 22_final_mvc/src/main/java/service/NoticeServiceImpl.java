package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import beans.NoticeVO;
import repositories.NoticeDAO;
import repositories.NoticeDAOImpl;
import utils.PageMaker;

public class NoticeServiceImpl implements NoticeService {

	NoticeDAO dao = new NoticeDAOImpl();
	
	@Override
	public boolean noticeWrite(HttpServletRequest request) {
		boolean writeCheck = false;
		
		String category = request.getParameter("notice_category");
		String author = request.getParameter("notice_author");
		String title = request.getParameter("notice_title");
		String content = request.getParameter("notice_content");
		
		NoticeVO n = new NoticeVO(category, author, title, content);
		
		writeCheck = dao.noticeWrite(n);
		
		return writeCheck;
	}

	@Override
	public void noticeList(HttpServletRequest request) {
		
		int defaultPage = 1;
		String page = request.getParameter("page");
		if (page != null) {
			defaultPage = Integer.parseInt(page);
		}
		
		PageMaker pm = new PageMaker();
		pm.getCri().setPage(defaultPage);
		pm.setDisplayPageNum(5);
		
		int totalCount = dao.getTotalCount();
		pm.setTotalCount(totalCount);
		
		ArrayList<NoticeVO> noticeList = dao.noticeList(pm.getCri().getStartRow(), pm.getCri().getPerPageNum());
		request.setAttribute("pm", pm);
		request.setAttribute("noticeList", noticeList);
	}

	@Override
	public void noticeDetail(HttpServletRequest request) {
		
		String numStr = request.getParameter("notice_num");
		int num = Integer.parseInt(numStr);
		NoticeVO notice = dao.noticeDetail(num);
		System.out.println(notice.toString());
		request.setAttribute("notice", notice);
	}

	@Override
	public boolean noticeUpdate(HttpServletRequest request) {
		boolean updateCheck = false;
		
		String numStr = request.getParameter("notice_num");
		System.out.println("numStr : " + numStr);
		String category = request.getParameter("notice_category");
		System.out.println("category : " + category);
		String author = request.getParameter("notice_author");
		String title = request.getParameter("notice_title");
		String content = request.getParameter("notice_content");
		int num = Integer.parseInt(numStr);
		
		NoticeVO notice = new NoticeVO(num, category, author, title, content, null);
		updateCheck = dao.noticeUpdate(notice);
		
		return updateCheck;
	}

	@Override
	public boolean noticeDelete(HttpServletRequest request) {
		boolean deleteCheck = false;
		
		String numStr = request.getParameter("notice_num");
		int num = Integer.parseInt(numStr);
		
		deleteCheck = dao.noticeDelete(num);
		
		return deleteCheck;
	}

}
