package org.cc.service;

import java.util.List;

import org.cc.domain.PaymentVO;
import org.cc.mapper.PaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PaymentServiceImpl implements PaymentService {

	@Setter(onMethod=@__({@Autowired})) //전체 생성자 초기화하면 사용x
	private PaymentMapper mapper;
	
	@Override
	public List<PaymentVO> getList(String userId) {
		return mapper.getList("conan");
	}

	@Override
	public void insert(PaymentVO pay) {
		mapper.insert(pay);
	}

}
