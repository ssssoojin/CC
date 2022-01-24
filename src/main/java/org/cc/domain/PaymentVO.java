package org.cc.domain;

import lombok.Data;

@Data
public class PaymentVO {
	private String payNo;
	private String userId;
	private String payDate;
	private int price;
	private String images;
	private String Recipient;
	private String phone;
	private String address;
	private String detailAddress;
	private String deliveryMemo;
}
