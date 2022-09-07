package repositories;

import java.util.ArrayList;

import utils.Criteria;
import vo.TestGuestBookVO;

public interface GuestbookDAO {

	public ArrayList<TestGuestBookVO> gbList(Criteria cri);
	
	public int gbTotalCount();
	
	public int gbWrite(String name, String password, String content);
	
	public int gbDelete(int id, String password);
	
}