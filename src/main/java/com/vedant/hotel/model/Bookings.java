package com.vedant.hotel.model;


import java.time.LocalDate;
import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Transient;

@Entity
public class Bookings {
	@Id
	int booking_id;
	String cusername;
	int hdid;
	int room_id;
	
	@Column(name = "from_date")
	private LocalDate fromDate;
	
	LocalDate to_date;
	int price;
	Date booking_date;
	String status = "confirmed";
	

	@Transient
	private Hdata hotel;

	@Transient
	private Rooms room;

	@Transient
	private Clogin customer;

	public Clogin getCustomer() {
	    return customer;
	}

	public void setCustomer(Clogin customer) {
	    this.customer = customer;
	}
	
	public Hdata getHotel() {
	    return hotel;
	}
	public void setHotel(Hdata hotel) {
	    this.hotel = hotel;
	}
	public Rooms getRoom() {
	    return room;
	}
	public void setRoom(Rooms room) {
	    this.room = room;
	}

	public int getBooking_id() {
		return booking_id;
	}
	public void setBooking_id(int booking_id) {
		this.booking_id = booking_id;
	}
	public String getCusername() {
		return cusername;
	}
	public void setCusername(String cusername) {
		this.cusername = cusername;
	}
	public int getHdid() {
		return hdid;
	}
	public void setHdid(int hdid) {
		this.hdid = hdid;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	
	public LocalDate getFromDate() {
		return fromDate;
	}
	public void setFromDate(LocalDate fromDate) {
		this.fromDate = fromDate;
	}
	public LocalDate getTo_date() {
		return to_date;
	}
	public void setTo_date(LocalDate to_date) {
		this.to_date = to_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(double totalPrice) {
		this.price = (int) totalPrice;
	}
	public Date getBooking_date() {
		return booking_date;
	}
	public void setBooking_date(Date booking_date) {
		this.booking_date = booking_date;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
}
