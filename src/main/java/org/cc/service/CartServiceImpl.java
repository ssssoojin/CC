package org.cc.service;

import java.util.ArrayList;
import java.util.List;

import org.cc.domain.CartVO;
import org.cc.mapper.CartMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {

	private CartMapper mapper;
	
	@Override
	public List<CartVO> getList(String userId) {
		
		return mapper.getList(userId);
	}

	@Override
	public void cartDelete(int cartNo) {
		mapper.cartDelete(cartNo);
	}

	@Override
	public List<CartVO> getListId(int[] selectItem) {
		List<CartVO> list = new ArrayList<CartVO>();
		for(int i=0;i<selectItem.length;i++) {
			log.info("item : "+ selectItem[i]+", i : "+i);
			list.add(mapper.getListId(selectItem[i]));
		}
		list.forEach(item->log.info(item));
		return list;
	}
	
	@Override
	public void addCart(CartVO vo) {
		mapper.addCart(vo);
	}

	@Override
	public CartVO getLastItem() {
		return mapper.getLastItem();
	}

}
