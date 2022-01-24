package org.cc.domain;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo;
	private String userId;
	private String itemName;
	private String color;
	private String size;
	private int quantity;
	private int price;
	private int category;
	private String image;
}
