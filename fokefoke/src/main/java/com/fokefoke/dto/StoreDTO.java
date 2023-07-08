package com.fokefoke.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class StoreDTO {
	int storeId;
	String storeName;
	String storeAddress;
	String storeTel;
	String storeOpen;
	String storeClose;
	double storeLat;
	double storeLng;

}
