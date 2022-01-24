package org.cc.mapper;

import java.util.List;

import org.cc.domain.PaymentVO;

public interface PaymentMapper {
	public List<PaymentVO> getList(String userId);
	public void insert(PaymentVO pay);
}
