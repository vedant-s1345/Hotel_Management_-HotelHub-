package com.vedant.hotel.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Hlogin {

	@Id
	String husername;
	String hemail;
	String hpassword;
	
	public String getHusername() {
		return husername;
	}
	public void setHusername(String husername) {
		this.husername = husername;
	}
	public String getHemail() {
		return hemail;
	}
	public void setHemail(String hemail) {
		this.hemail = hemail;
	}
	public String getHpassword() {
		return hpassword;
	}
	public void setHpassword(String hpassword) {
		this.hpassword = hpassword;
	}
	@Override
	public String toString() {
		return "hlogin [husername=" + husername + ", hemail=" + hemail + ", hpassword=" + hpassword + "]";
	}
	
	
}
