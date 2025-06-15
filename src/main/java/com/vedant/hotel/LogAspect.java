package com.vedant.hotel;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LogAspect {
	private static final Logger LOGGER=LoggerFactory.getLogger(LogAspect.class);
	
	@Before("execution(* com.vedant.hotel.HotelController.hotel_login(...)")
	public void logBefore() {
		System.out.println("hotel login calleddd");
	}
}
