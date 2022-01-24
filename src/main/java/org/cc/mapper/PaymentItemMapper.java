package org.cc.mapper;

import java.util.List;

import org.cc.domain.PaymentItemVO;

public interface PaymentItemMapper {
	public List<PaymentItemVO> getList(String userId);
	public void insert(PaymentItemVO item);
}
