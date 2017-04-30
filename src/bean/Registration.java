package bean;

public class Registration {
	
	String login_email;
	String login_name;
	String login_pwd;
	String phone;
	String role;
	public Registration(String login_email, String login_name, String login_pwd, String phone, String role) {
		super();
		this.login_email = login_email;
		this.login_name = login_name;
		this.login_pwd = login_pwd;
		this.phone = phone;
		this.role = role;
	}
	public String getLogin_email() {
		return login_email;
	}
	public void setLogin_email(String login_email) {
		this.login_email = login_email;
	}
	public String getLogin_name() {
		return login_name;
	}
	public void setLogin_name(String login_name) {
		this.login_name = login_name;
	}
	public String getLogin_pwd() {
		return login_pwd;
	}
	public void setLogin_pwd(String login_pwd) {
		this.login_pwd = login_pwd;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	
	
}
