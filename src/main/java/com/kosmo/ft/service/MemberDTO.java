package com.kosmo.ft.service;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birth;
	private String phone;
	private String email;
	private String profile;
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", gender=" + gender + ", birth=" + birth
				+ ", phone=" + phone + ", email=" + email + ", profile=" + profile + "]";
	}
	
	
	
	}
	
	

	
	
	

