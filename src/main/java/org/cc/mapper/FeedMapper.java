package org.cc.mapper;

import java.util.List;

import org.cc.domain.FeedVO;

public interface FeedMapper {
	//@Select("select * from feed")
	public List<FeedVO> getList();
	public List<FeedVO> customImg();
	public FeedVO ClickImg();
	
	public FeedVO get(long l);	
	public List<FeedVO> getAll();
	
	
	public int feedLikeCountInfo(Long l);
	public int saveHeart(Long l);
	public int removeHeart(Long l);
	public int insert(FeedVO feed);
	public List<FeedVO> getListTop2();
}
