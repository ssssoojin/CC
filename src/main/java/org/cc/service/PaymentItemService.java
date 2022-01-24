package org.cc.service;

import java.util.List;

import org.cc.domain.PaymentItemVO;

public interface PaymentItemService {
	public List<PaymentItemVO> getList(String userId);
	public void insertList(List<PaymentItemVO> items);
}
