package member;

public class MemberDTO {
	/*
	 * 
	 * id mb_name mb_email mb_pw admin mb_address mb_tell mb_addressmore mb_post
	 * salt saltpw
	 */
	
	
	private int id, mb_post;
	private String mb_name, mb_email, mb_pw, admin, mb_address, mb_tell, salt,saltpw
	 ,mb_gender, mb_addressmore, mb_birth, ResidentNumber;
	
	
	
	public String getResidentNumber() {
		return ResidentNumber;
	}
	public void setResidentNumber(String residentNumber) {
		ResidentNumber = residentNumber;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMb_post() {
		return mb_post;
	}
	public void setMb_post(int mb_post) {
		this.mb_post = mb_post;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_email() {
		return mb_email;
	}
	public void setMb_email(String mb_email) {
		this.mb_email = mb_email;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getMb_address() {
		return mb_address;
	}
	public void setMb_address(String mb_address) {
		this.mb_address = mb_address;
	}
	public String getMb_tell() {
		return mb_tell;
	}
	public void setMb_tell(String mb_tell) {
		this.mb_tell = mb_tell;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public String getSaltpw() {
		return saltpw;
	}
	public void setSaltpw(String saltpw) {
		this.saltpw = saltpw;
	}
	public String getMb_gender() {
		return mb_gender;
	}
	public void setMb_gender(String mb_gender) {
		this.mb_gender = mb_gender;
	}
	public String getMb_addressmore() {
		return mb_addressmore;
	}
	public void setMb_addressmore(String mb_addressmore) {
		this.mb_addressmore = mb_addressmore;
	}
	public String getMb_birth() {
		return mb_birth;
	}
	public void setMb_birth(String mb_birth) {
		this.mb_birth = mb_birth;
	}
	
	
	
	
	
	
}
