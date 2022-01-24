package org.cc.service;

import java.util.List;

import org.cc.domain.FeedVO;
import org.cc.mapper.FeedMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class FeedServiceImpl implements FeedService {
	private FeedMapper mapper;
	
	@Override
	public List<FeedVO> getList() {
		log.info("feed 게시글 불러오기~~");
		return mapper.getList();
	}
	@Override
	public List<FeedVO> getListTop2() {
		log.info("feed 게시글 Top2 불러오기~~");
		return mapper.getListTop2();
	}

	@Override
	public FeedVO get(Long feedNo) {
		log.info("feed 게시글 하나만 출력하기~");
		return mapper.get(feedNo);
	}

	@Override
	public List<FeedVO> customImg() {
		log.info("feed게시판에 사진만 출력");
		return mapper.customImg();
	}

	@Override
	public List<FeedVO> getAll() {
		log.info("---------다 출력------------");
		return mapper.getAll();
	}

	@Override
	public int feedLikeCountInfo(Long feedNo) {
		return mapper.feedLikeCountInfo(feedNo);
	}

	@Override
	public int saveHeart(Long feedNo) {
		return mapper.saveHeart(feedNo);
	}

	@Override
	public int removeHeart(Long feedNo) {
		return mapper.removeHeart(feedNo);
	}

	@Override
	public void insert(FeedVO feed) {
		log.info("insert Feed...."+feed);
		mapper.insert(feed);
	}

}
