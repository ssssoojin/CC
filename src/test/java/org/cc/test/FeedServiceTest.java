package org.cc.test;

import org.cc.domain.FeedVO;
import org.cc.mapper.FeedMapper;
import org.cc.service.FeedService;
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
public class FeedServiceTest {
	@Setter(onMethod=@__({ @Autowired }))
	private FeedService service;
	
	
	@Test
	public void testGetList() {
		service.getList().forEach(feed -> log.info(feed));
	}
	
	@Test
	public void testGet() {
		log.info(service.get(3L));
	}
	
	@Test
	public void testCustomImg() {
		service.customImg().forEach(customImg -> log.info(customImg));
	}
	
	@Test
	public void testCustomImgOneOne() {
		service.customImg().forEach(customImg -> log.info(customImg));
	}
	
	@Test
	public void testGetAll() {
		service.getAll().forEach(all -> log.info(all));
	}
}
