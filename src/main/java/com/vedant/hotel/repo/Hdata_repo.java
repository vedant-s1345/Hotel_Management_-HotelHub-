package com.vedant.hotel.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.vedant.hotel.model.Hdata;

import jakarta.transaction.Transactional;

public interface Hdata_repo extends JpaRepository<Hdata, Integer> {
    
    List<Hdata> findByHusername(String husername);

    List<Hdata> findByHcityIgnoreCaseContaining(String city);

    @Modifying
    @Transactional
    @Query("UPDATE Hdata h SET h.no_of_ac = h.no_of_ac + 1 WHERE h.hdid = :hdid")
    void incrementAC(@Param("hdid") Integer hdid);

    @Modifying
    @Transactional
    @Query("UPDATE Hdata h SET h.no_of_nonac = h.no_of_nonac + 1 WHERE h.hdid = :hdid")
    void incrementNonAC(@Param("hdid") Integer hdid);
    
    @Query("SELECT COUNT(r) FROM Rooms r WHERE r.hdid = :hdid AND r.room_type = 'ac' AND r.avail = 'available'")
    int countAvailableAcRooms(@Param("hdid") int hdid);

    @Query("SELECT COUNT(r) FROM Rooms r WHERE r.hdid = :hdid AND r.room_type = 'nonac' AND r.avail = 'available'")
    int countAvailableNonAcRooms(@Param("hdid") int hdid);
}