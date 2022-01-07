package com.kosmo.ft.service;

public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private int height;
	private int weight;
	private String gender;
	private int age;
	private String address;
	private String KAKAOLOGIN;
	private String tel;
	private String inter;
	private String adminck;
	private String pro;
	private String email;
	private String admin;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getKAKAOLOGIN() {
		return KAKAOLOGIN;
	}
	public void setKAKAOLOGIN(String kAKAOLOGIN) {
		KAKAOLOGIN = kAKAOLOGIN;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getInter() {
		return inter;
	}
	public void setInter(String inter) {
		this.inter = inter;
	}
	public String getAdminck() {
		return adminck;
	}
	public void setAdminck(String adminck) {
		this.adminck = adminck;
	}
	public String getPro() {
		return pro;
	}
	public void setPro(String pro) {
		this.pro = pro;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", height=" + height + ", weight=" + weight
				+ ", gender=" + gender + ", age=" + age + ", address=" + address + ", KAKAOLOGIN=" + KAKAOLOGIN
				+ ", tel=" + tel + ", inter=" + inter + ", adminck=" + adminck + ", pro=" + pro + ", email=" + email
				+ ", admin=" + admin + "]";
	}
	
	

	
	
	
}
