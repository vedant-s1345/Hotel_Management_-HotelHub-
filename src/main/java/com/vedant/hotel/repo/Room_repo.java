package com.vedant.hotel.repo;


import java.util.List;

import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vedant.hotel.model.Rooms;

import jakarta.transaction.Transactional;

public interface Room_repo extends JpaRepository<Rooms,Integer>{

	@Modifying
	@Transactional
	@Query(value = "INSERT INTO rooms (room_name,hdid,room_type) VALUES(:room_name,:hdid,:room_type)", nativeQuery = true)
    void insertRoom(@Param("room_name") String room_name,@Param("hdid") Integer hdid,@Param("room_type") String room_type);

	@Query("SELECT r FROM Rooms r WHERE r.hdid = :hdid AND r.room_type = :roomType AND r.avail = :avail")
    List<Rooms> findAvailableRooms(@Param("hdid") int hdid, 
                                 @Param("roomType") String roomType, 
                                 @Param("avail") String avail);
	
}
