package org.cc.test;

import org.cc.domain.FeedVO;
import org.cc.mapper.FeedMapper;
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
public class FeedMapperTest {
	@Setter(onMethod=@__({ @Autowired }))
	private FeedMapper mapper;
	
	@Test
	public void testGetList() {
		log.info("List 출력~~~");
		mapper.getList().forEach(feed -> log.info(feed));
	}
	
	@Test
	public void testGet() {
		FeedVO feed = mapper.get(3L);
		log.info("하나만 출력~~"+feed);
	}
	
	@Test
	public void testCustomImg() {
		log.info("커스텀한 이미지 출력");
		mapper.customImg().forEach(feed -> log.info(feed));
	}
	
	@Test
	public void testGetAll() {
		log.info("----------다출력--------------");
		mapper.getAll().forEach(all -> log.info(all));
	}
}
