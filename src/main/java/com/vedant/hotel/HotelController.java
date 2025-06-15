package com.vedant.hotel;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vedant.hotel.model.Bookings;
import com.vedant.hotel.model.Clogin;
import com.vedant.hotel.model.Hdata;
import com.vedant.hotel.model.Hlogin;
import com.vedant.hotel.model.Rooms;
import com.vedant.hotel.repo.Booking_repo;
import com.vedant.hotel.repo.Clogin_repo;
import com.vedant.hotel.repo.Hdata_repo;
import com.vedant.hotel.repo.Hlogin_repo;
import com.vedant.hotel.repo.Room_repo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HotelController {
	
	@Autowired
	Hlogin_repo hrepo;
	
	@Autowired
	Hdata_repo hrepo2;
	
	@Autowired
	Clogin_repo crepo;
	
	@Autowired 
	Room_repo room_repo;
	
	@Autowired
	Booking_repo bookingRepo;
	
	 private boolean isLoggedIn(HttpServletRequest request, String userType) {
	        HttpSession session = request.getSession(false);
	        return session != null && session.getAttribute(userType) != null;
	    }
	
	@GetMapping("/")
	public String home() {
		return "index";
	}

	@GetMapping("/hotel")
	public String hotel() {
		return "hotel_login";
	}
	
	@GetMapping("/cust")
	public String custo() {
		return "cust_login";
	}
	
	@PostMapping("/hotel_login")
	public String hotel_login(@RequestParam("husername") String husername,
								@RequestParam("hpassword") String hpassword,ModelMap m
								,HttpServletRequest request) {

		Optional<Hlogin> h=hrepo.findById(husername);
		if(h.isPresent()) {
			Hlogin user=h.get();
			if(user.getHpassword().equals(hpassword)) {
				System.out.println("called");
				m.addAttribute("husername",husername);
				m.addAttribute("hpassword",hpassword);
				request.getSession().setAttribute("hotelUser", husername);
				return "redirect:/hotel_home/" + husername;
			}
			else {
	            m.addAttribute("error", "Invalid password");
	            return "hotel_login";
	        }
			
		}
		 else {
		        m.addAttribute("error", "User not found");
		        return "hotel_login";
		 }
	}
	
	@PostMapping("/hotel_signup")
	public String hotel_signup(@RequestParam("husername") String husername,
								@RequestParam("hemail") String hemail,
								@RequestParam("hpassword") String hpassword,ModelMap m) {
		Optional<Hlogin> exist = hrepo.findById(husername);

	    if (exist.isPresent()) {
	        m.addAttribute("error", "User already exists. Please log in.");
	        return "hotel_login";
	    } else {
	        Hlogin newH = new Hlogin();
	        newH.setHusername(husername);
	        newH.setHemail(hemail);
	        newH.setHpassword(hpassword);

	        hrepo.save(newH);
	        m.addAttribute("husername", husername);
	        return "redirect:/hotel_home/" + husername;
	    }
	}
	
	@GetMapping("/hotel_home/{husername}")
	public String hotelHome(@PathVariable String husername, ModelMap m,HttpServletRequest request) {
		 if (!isLoggedIn(request, "hotelUser")) {
	            return "redirect:/";
	        }
		 
		List<Hdata> hdata=hrepo2.findByHusername(husername);
		m.addAttribute("hdata", hdata);
	    m.addAttribute("husername", husername);
	    return "hotel_home";
	}
	
	
	@PostMapping("/hotel_login/{husername}/add_hdata")
	public String addHdata(@PathVariable String husername,
	                       @RequestParam("hname") String hname,
	                       @RequestParam("hcity") String hcity,
	                       @RequestParam("hlocation") String hlocation,
	                       @RequestParam("p_ac") int p_ac,
	                       @RequestParam("p_nac") int p_nac,
	                       ModelMap m,
	                       HttpServletRequest request) {
		

		Hdata h=new Hdata();
		h.setHusername(husername);
		h.setHname(hname);
		h.setHcity(hcity);
		h.setHlocation(hlocation);
		h.setP_ac(p_ac);
		h.setP_nac(p_nac);
		hrepo2.save(h);
		
		return "redirect:/hotel_home/" + husername;
	}
	
	@PostMapping("/hotel_login/{husername}/{hdid}/add_room")
	public String addRoom(@PathVariable String husername,
						   @PathVariable int hdid,
	                       @RequestParam("room_name") String room_name,
	                       @RequestParam("room_type") String room_type,
	                       ModelMap m,
	                       HttpServletRequest request) {
		

		 
		String avl="available";
		Rooms r=new Rooms();
		r.setHdid(hdid);
		r.setRoom_name(room_name);
		r.setRoom_type(room_type);
		r.setAvail(avl);
		room_repo.save(r);
		
		if (room_type.equalsIgnoreCase("ac")) {
	        hrepo2.incrementAC(hdid);
	    } else {
	        hrepo2.incrementNonAC(hdid);
	    }
		
		return "redirect:/hotel_home/" + husername;
	}
	
	@GetMapping("/hotel_home/{husername}/bookings")
	public String viewHotelBookings(@PathVariable String husername, ModelMap m,HttpServletRequest request) {
		
		 if (!isLoggedIn(request, "hotelUser")) {
	            return "redirect:/";
	        }
	    // Get all hotels for this manager
	    List<Hdata> hotels = hrepo2.findByHusername(husername);
	    
	    // Get bookings for all hotels of this manager
	    List<Bookings> bookings = new ArrayList<>();
	    for (Hdata hotel : hotels) {
	        List<Bookings> hotelBookings = bookingRepo.findByHdid(hotel.getHdid());
	        for (Bookings booking : hotelBookings) {
	            // Set the hotel for each booking
	            booking.setHotel(hotel);
	            bookings.add(booking);
	        }
	    }
	    
	    // Fetch customer and room details for each booking
	    for (Bookings booking : bookings) {
	        Optional<Rooms> room = room_repo.findById(booking.getRoom_id());
	        Optional<Clogin> customer = crepo.findById(booking.getCusername());
	        
	        if (room.isPresent()) {
	            booking.setRoom(room.get());
	        }
	        if (customer.isPresent()) {
	            booking.setCustomer(customer.get());
	        }
	    }
	    
	    m.addAttribute("bookings", bookings);
	    m.addAttribute("husername", husername);
	    return "hotel_bookings";
	}
	@PostMapping("/cust_login")
	public String cust_login(@RequestParam("cusername") String cusername,
								@RequestParam("cpassword") String cpassword,ModelMap m
								,HttpServletRequest request) {

		Optional<Clogin> c=crepo.findById(cusername);
		if(c.isPresent()) {
			Clogin user=c.get();
			if(user.getCpassword().equals(cpassword)) {
				System.out.println("called");
				m.addAttribute("cusername",cusername);
				m.addAttribute("cpassword",cpassword);
				request.getSession().setAttribute("custUser", cusername);
				return "redirect:/cust_home/" + cusername;
			}
			else {
	            m.addAttribute("error", "Invalid password");
	            return "cust_login";
	        }
			
		}
		 else {
		        m.addAttribute("error", "User not found");
		        return "cust_login";
		 }
	}
	
	@PostMapping("cust_signup")
	public String cust_signup(@RequestParam("cusername") String cusername,
								@RequestParam("cemail") String cemail,
								@RequestParam("cpassword") String cpassword,ModelMap m) {
		
		Optional<Clogin> exist = crepo.findById(cusername);

	    if (exist.isPresent()) {
	        m.addAttribute("error", "User already exists. Please log in.");
	        return "cust_login";
	    } else {
	        Clogin newC = new Clogin();
	        newC.setCusername(cusername);
	        newC.setCemail(cemail);
	        newC.setCpassword(cpassword);

	        crepo.save(newC);
	        m.addAttribute("cusername", cusername);
	        return "redirect:/cust_home/" + cusername;
	    }
	}
	

	@GetMapping("/cust_home/{cusername}")
	public String custHome(@PathVariable String cusername, 
	                      @RequestParam(required = false) String city, 
	                      ModelMap m,
	                      HttpServletRequest request) {
		
		if (!isLoggedIn(request, "custUser")) {
            return "redirect:/";
        }
		
	    List<Hdata> hdata;

	    if (city != null && !city.isEmpty()) {
	        hdata = hrepo2.findByHcityIgnoreCaseContaining(city);
	    } else {
	        hdata = hrepo2.findAll();
	    }

	    // Calculate available rooms for each hotel
	    for (Hdata hotel : hdata) {
	        int availableAc = hrepo2.countAvailableAcRooms(hotel.getHdid());
	        int availableNonAc = hrepo2.countAvailableNonAcRooms(hotel.getHdid());
	        hotel.setAvailableAcRooms(availableAc);
	        hotel.setAvailableNonAcRooms(availableNonAc);
	    }

	    m.addAttribute("hdata", hdata);
	    m.addAttribute("cusername", cusername);
	    return "cust_home";
	}
	
	
	@GetMapping("/cust_home/{cusername}/{hdid}")
	public String showBookingForm(@PathVariable String cusername, 
	                            @PathVariable int hdid, 
	                            ModelMap m,
	                            HttpServletRequest request) {
		
		if (!isLoggedIn(request, "custUser")) {
            return "redirect:/";
        }
	    Optional<Hdata> hotel = hrepo2.findById(hdid);
	    if(hotel.isPresent()) {
	        m.addAttribute("hdata", hotel.get());
	        m.addAttribute("cusername", cusername);
	        return "book"; // This will show the booking form
	    }
	    return "redirect:/cust_home/" + cusername + "?error=Hotel not found";
	}

	@PostMapping("/cust_home/{cusername}/{hdid}/processBooking")
	public String processBooking(@PathVariable String cusername,
	                           @PathVariable int hdid,
	                           @RequestParam String roomType,
	                           @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
	                           @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate,
	                           @RequestParam int guests,
	                           ModelMap m,
	                           HttpServletRequest request) {

	    
	    if(fromDate.isAfter(toDate) || fromDate.isBefore(LocalDate.now())) {
	        m.addAttribute("error", "Invalid date selection");
	        return "redirect:/cust_home/" + cusername + "/" + hdid;
	    }
	    
	    
	    long nights = ChronoUnit.DAYS.between(fromDate, toDate);
	    int pricePerNight = roomType.equals("ac") ? hrepo2.findById(hdid).get().getP_ac() : 
	                                              hrepo2.findById(hdid).get().getP_nac();
	    
	    double totalPrice = nights * pricePerNight;
	    
	    try {
	        List<Rooms> availableRooms = room_repo.findAvailableRooms(hdid, 
	            roomType.equals("ac") ? "ac" : "nonac", "available");
	        
	        if(availableRooms.isEmpty()) {
	            m.addAttribute("error", "No " + roomType + " rooms available");
	            return "redirect:/cust_home/" + cusername + "/" + hdid;
	        }
	        
	        Rooms room = availableRooms.get(0);
	        
	        Bookings booking = new Bookings();
	        booking.setCusername(cusername);
	        booking.setHdid(hdid);
	        booking.setRoom_id(room.getRoom_id());
	        booking.setFromDate(fromDate);
	        booking.setTo_date(toDate);
	        booking.setPrice(totalPrice);
	        booking.setStatus("confirmed");
	        bookingRepo.save(booking);
	        
	        room.setAvail("booked");
	        room_repo.save(room);
	        
	        return "redirect:/cust_home/" + cusername + "?bookingSuccess=true";
	        
	    } catch(Exception e) {
	        m.addAttribute("error", "Booking failed: " + e.getMessage());
	        return "redirect:/cust_home/" + cusername + "/" + hdid;
	    }
	}
	
	@GetMapping("/cust_home/{cusername}/bookings")
	public String viewBookings(@PathVariable String cusername, ModelMap m,HttpServletRequest request) {
		
		if (!isLoggedIn(request, "custUser")) {
            return "redirect:/";
        }
	    List<Bookings> bookings = bookingRepo.findByCusernameOrderByFromDateDesc(cusername);
	    
	    // Fetch hotel and room details for each booking
	    for (Bookings booking : bookings) {
	        Optional<Hdata> hotel = hrepo2.findById(booking.getHdid());
	        Optional<Rooms> room = room_repo.findById(booking.getRoom_id());
	        
	        if (hotel.isPresent()) {
	            booking.setHotel(hotel.get());
	        }
	        if (room.isPresent()) {
	            booking.setRoom(room.get());
	        }
	    }
	    
	    m.addAttribute("bookings", bookings);
	    m.addAttribute("cusername", cusername);
	    return "your_bookings";
	}

	@PostMapping("/cust_home/{cusername}/bookings/{booking_id}/cancel")
	public String cancelBooking(@PathVariable String cusername,
	                          @PathVariable int booking_id,
	                          ModelMap m,
	                          HttpServletRequest request) {

	    Optional<Bookings> bookingOpt = bookingRepo.findById(booking_id);
	    
	    if (bookingOpt.isPresent()) {
	        Bookings booking = bookingOpt.get();
	        booking.setStatus("cancelled");
	        bookingRepo.save(booking);
	        
	        // Update room availability
	        Optional<Rooms> room = room_repo.findById(booking.getRoom_id());
	        if (room.isPresent()) {
	            Rooms r = room.get();
	            r.setAvail("available");
	            room_repo.save(r);
	        }
	        
	        return "redirect:/cust_home/" + cusername + "/bookings?cancelSuccess=true";
	    }
	    
	    return "redirect:/cust_home/" + cusername + "/bookings?error=Booking not found";
	}
	
	@PostMapping("/hotel_login/{husername}/{hdid}/update_hdata")
	public String updateHdata(@PathVariable String husername,
	                        @PathVariable int hdid,
	                        @RequestParam String hname,
	                        @RequestParam String hcity,
	                        @RequestParam String hlocation,
	                        @RequestParam int p_ac,
	                        @RequestParam int p_nac,
	                        ModelMap m,
	                        HttpServletRequest request) {

	    Optional<Hdata> existingHdata = hrepo2.findById(hdid);
	    
	    if (existingHdata.isPresent()) {
	        Hdata hdata = existingHdata.get();
	        hdata.setHname(hname);
	        hdata.setHcity(hcity);
	        hdata.setHlocation(hlocation);
	        hdata.setP_ac(p_ac);
	        hdata.setP_nac(p_nac);
	        
	        hrepo2.save(hdata);
	        return "redirect:/hotel_home/" + husername + "?updateSuccess=true";
	    }
	    
	    return "redirect:/hotel_home/" + husername + "?error=Hotel not found";
	}
	
	 @GetMapping("/logout")
	    public String logout(HttpServletRequest request) {
	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.removeAttribute("hotelUser");
	            session.removeAttribute("custUser");
	            session.invalidate();
	        }
	        return "redirect:/";
	    }

}
