package org.cc.service;

import java.util.List;

import org.cc.domain.PaymentVO;

public interface PaymentService {
	public List<PaymentVO> getList(String userId);
	public void insert(PaymentVO pay);
}
