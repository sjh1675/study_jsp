package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import repositories.GuestbookDAO;
import repositories.GuestbookDAOImpl;
import utils.PageMaker;
import vo.TestGuestBookVO;

public class GuestbookServiceImpl implements GuestbookService {

	GuestbookDAO dao = new GuestbookDAOImpl();
	
	@Override
	public ArrayList<TestGuestBookVO> gbList(HttpServletRequest request) {		
		ArrayList<TestGuestBookVO> list = null;
		
		int defaultPage = 1;
		String page = request.getParameter("page");
		if (page != null) {
			defaultPage = Integer.parseInt(page);
		}
		
		PageMaker pm = new PageMaker();
		pm.getCri().setPage(defaultPage);
		pm.getCri().setPerPageNum(5);
		pm.setDisplayPageNum(5);
		
		int totalCount = dao.gbTotalCount();
		pm.setTotalCount(totalCount);
		
		request.setAttribute("pm", pm);
				
		list = dao.gbList(pm.getCri());
		return list;
	}

	@Override
	public int gbWrite(HttpServletRequest request) {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String content = request.getParameter("content");
		
		if (name.trim().equals("")) name = null;
		if (password.trim().equals("")) password = null;
		if (content.trim().equals("")) content = null;
		
		return dao.gbWrite(name, password, content);
	}

	@Override
	public int gbDelete(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		
		return dao.gbDelete(id, password);
	}
	
}
