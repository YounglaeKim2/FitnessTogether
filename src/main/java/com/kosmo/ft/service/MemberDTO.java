package com.kosmo.ft.service;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
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
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", gender=" + gender + ", age=" + age + ", address=" + address + ", KAKAOLOGIN=" + KAKAOLOGIN
				+ ", tel=" + tel + ", inter=" + inter + ", adminck=" + adminck + ", pro=" + pro + ", email=" + email
				+ ", admin=" + admin + "]";
	}
	
	

	
	
	
}
