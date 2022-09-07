package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import vo.TestGuestBookVO;

public interface GuestbookService {

	// 방명록 리스트 출력
	public ArrayList<TestGuestBookVO> gbList(HttpServletRequest request);
	
	// 방명록 작성
	public int gbWrite(HttpServletRequest request);
	
	// 방명록 삭제
	public int gbDelete(HttpServletRequest request);
	
}