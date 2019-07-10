package com.example.open_api.util;

import java.util.UUID;

public class CommonUtil {
	
	public static String getRandomString(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public static Float[] performGeoCoding(String location) {
		// TODO Auto-generated method stub
		return null;
	}
}
