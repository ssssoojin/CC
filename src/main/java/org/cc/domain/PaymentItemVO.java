package org.cc.domain;

import lombok.Data;

@Data
public class PaymentItemVO {
	private String payNo;
	private String userId;
	private int category;
	private String image;
	private String size;
	private String color;
}
