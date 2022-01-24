package org.cc.service;

import java.util.List;

import org.cc.domain.PaymentItemVO;
import org.cc.mapper.PaymentItemMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentItemServiceImpl implements PaymentItemService {

	@Setter(onMethod=@__({@Autowired})) //전체 생성자 초기화하면 사용x
	private PaymentItemMapper mapper;
	
	@Override
	public List<PaymentItemVO> getList(String userId) {
		log.info("paymentItemService....");
		return mapper.getList(userId);
	}

	@Override
	public void insertList(List<PaymentItemVO> items) {
		for(PaymentItemVO item : items) {
			mapper.insert(item);
		}
	}

}
