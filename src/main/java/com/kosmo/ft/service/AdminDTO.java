package com.kosmo.ft.service;


public class AdminDTO {
	private String id;
	private String pwd;
	private int adminck;
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
	public int getAdminck() {
		return adminck;
	}
	public void setAdminck(int adminck) {
		this.adminck = adminck;
	}
	@Override
	public String toString() {
		return "AdminDTO [id=" + id + ", pwd=" + pwd + ", adminck=" + adminck + "]";
	}
	
}
