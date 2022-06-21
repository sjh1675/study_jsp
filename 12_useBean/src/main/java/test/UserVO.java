package test;

public class UserVO {

	String name;
	String addr;
	String email;
	
	public UserVO() {}
	
	public UserVO(String email) {
		this.email = email;
	}

	public UserVO(String name, String addr, String email) {
		this.name = name;
		this.addr = addr;
		this.email = email;
	}

	@Override
	public String toString() {
		return "UserVO [name=" + name + ", addr=" + addr + ", email=" + email + "]";
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}