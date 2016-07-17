package bean;

public class ThanhVien {
	private int idGroup;
	private String nickname;
	private String fullname;
	private String diachi;
	private String dienthoai;
	private String congviec;
	private String hinhanh;
	private String email;
	private String link;

	public int getIdGroup() {
		return idGroup;
	}

	public void setIdGroup(int idGroup) {
		this.idGroup = idGroup;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getDiachi() {
		return diachi;
	}

	public ThanhVien(int idGroup, String nickname, String fullname,
			String diachi, String dienthoai, String congviec, String hinhanh,
			String email, String link) {
		super();
		this.idGroup = idGroup;
		this.nickname = nickname;
		this.fullname = fullname;
		this.diachi = diachi;
		this.dienthoai = dienthoai;
		this.congviec = congviec;
		this.hinhanh = hinhanh;
		this.email = email;
		this.link = link;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getDienthoai() {
		return dienthoai;
	}

	public void setDienthoai(String dienthoai) {
		this.dienthoai = dienthoai;
	}

	public String getCongviec() {
		return congviec;
	}

	public void setCongviec(String congviec) {
		this.congviec = congviec;
	}

	public String getHinhanh() {
		return hinhanh;
	}

	public void setHinhanh(String hinhanh) {
		this.hinhanh = hinhanh;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public ThanhVien() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ThanhVien [idGroup=" + idGroup + ", nickname=" + nickname
				+ ", fullname=" + fullname + ", diachi=" + diachi
				+ ", dienthoai=" + dienthoai + ", congviec=" + congviec
				+ ", hinhanh=" + hinhanh + ", email=" + email + ", link="
				+ link + "]";
	}

}
