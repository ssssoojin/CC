package org.cc.domain;

import lombok.Data;

@Data
public class ProductVO {
	private int itemNo;
	private int category;
	private String itemName;
	private int price;
	private String image;
	private String detail;
}
