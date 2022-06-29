package vo;

public class GuestBook {

	private int id;	// 방명록 글 번호
	private String guestName; // 작성자
	private String password; // 비밀번호
	private String message; // 메세지
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	@Override
	public String toString() {
		return "GuestBook [id=" + id + ", guestName=" + guestName + ", password=" + password + ", message=" + message
				+ "]";
	}

	public GuestBook(int id, String guestName, String password, String message) {
		this.id = id;
		this.guestName = guestName;
		this.password = password;
		this.message = message;
	}

	public GuestBook() {}
}