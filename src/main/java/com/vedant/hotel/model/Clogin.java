package com.vedant.hotel.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Clogin {
	@Id
	String cusername;
	String cemail;
	String cpassword;
	
	public String getCusername() {
		return cusername;
	}
	public void setCusername(String cusername) {
		this.cusername = cusername;
	}
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	public String getCpassword() {
		return cpassword;
	}
	public void setCpassword(String cpassword) {
		this.cpassword = cpassword;
	}
	
	
}
