package com.vedant.hotel.repo;

import java.util.Collection;
import java.util.List;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;

import com.vedant.hotel.model.Bookings;

public interface Booking_repo extends JpaRepository<Bookings,Integer>{

//	@Query("SELECT b FROM Bookings b WHERE b.cusername = :username ORDER BY b.from_date DESC")
//    List<Bookings> findByCusernameOrderByFrom_dateDesc(@Param("username") String username);
	List<Bookings> findByCusernameOrderByFromDateDesc(String cusername);

	List<Bookings> findByHdid(int hdid);
}
