package com.sProject.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import java.util.TimeZone;

public class DateFmt {
	public static void main(String[] args) {
		Date writeDay;
		
		SimpleDateFormat dfg = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss z");
		System.out.println(dfg.getClass().getName());
		dfg.setTimeZone(TimeZone.getTimeZone("UTC"));
		
		//Loval Time Zone
		SimpleDateFormat dfl = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss z");
		
		//Time in GMT
		try {
			System.out.println(dfl.parse(dfg.format(new Date())));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		System.out.println(Instant.now().toString());
	}
}
