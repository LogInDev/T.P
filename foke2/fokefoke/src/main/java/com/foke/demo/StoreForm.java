package com.foke.demo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StoreForm {
	private String storeName;
	
	private String storeTel;
	
	private String storeAddress;
	
	private String storeOpen;
	
	private String storeClose;
	
    private Double storeLat;

    private Double storeLng;
}
