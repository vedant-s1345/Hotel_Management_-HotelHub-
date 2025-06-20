package com.vedant.hotel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@EnableAspectJAutoProxy
public class HotelManagementApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(HotelManagementApplication.class, args);
		
	}
	

}
