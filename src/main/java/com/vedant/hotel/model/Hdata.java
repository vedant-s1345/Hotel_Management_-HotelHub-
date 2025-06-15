package com.vedant.hotel.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Transient;

@Entity
public class Hdata {
	@Id
	int hdid;
	String husername;
	String hname;
	String hcity;
	String hlocation;
	int no_of_ac;
	int no_of_nonac;
	int p_ac;
	int p_nac;
	
	@Transient // This means it won't be persisted to the database
	private int availableAcRooms;

	@Transient
	private int availableNonAcRooms;
	
	
	public int getHdid() {
		return hdid;
	}
	public void setHdid(int hdid) {
		this.hdid = hdid;
	}
	public String getHusername() {
		return husername;
	}
	public void setHusername(String husername) {
		this.husername = husername;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public int getNo_of_ac() {
		return no_of_ac;
	}
	public void setNo_of_ac(int no_of_ac) {
		this.no_of_ac = no_of_ac;
	}
	public int getNo_of_nonac() {
		return no_of_nonac;
	}
	public void setNo_of_nonac(int no_of_nonac) {
		this.no_of_nonac = no_of_nonac;
	}
	public int getP_ac() {
		return p_ac;
	}
	public void setP_ac(int p_ac) {
		this.p_ac = p_ac;
	}
	public int getP_nac() {
		return p_nac;
	}
	public void setP_nac(int p_nac) {
		this.p_nac = p_nac;
	}
	public String getHcity() {
		return hcity;
	}
	public void setHcity(String hcity) {
		this.hcity = hcity;
	}
	public String getHlocation() {
		return hlocation;
	}
	public void setHlocation(String hlocation) {
		this.hlocation = hlocation;
	}
	


	public int getAvailableAcRooms() {
	    return availableAcRooms;
	}

	public void setAvailableAcRooms(int availableAcRooms) {
	    this.availableAcRooms = availableAcRooms;
	}

	public int getAvailableNonAcRooms() {
	    return availableNonAcRooms;
	}

	public void setAvailableNonAcRooms(int availableNonAcRooms) {
	    this.availableNonAcRooms = availableNonAcRooms;
	}
	
}
