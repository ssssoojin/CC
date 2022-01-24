package org.cc.test;

import org.cc.mapper.PaymentMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PaymentMapperTest {

	@Setter(onMethod=@__({ @Autowired }))
	private PaymentMapper mapper;
	
	@Test
	public void testGetList() {
		log.info("List 출력~~~");
		mapper.getList("conan").forEach(feed -> log.info(feed));
	}

}
