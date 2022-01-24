package org.cc.service;

import java.util.List;

import org.cc.domain.CartVO;

public interface CartService {
	public List<CartVO> getList(String userId);
	public void cartDelete(int cartNo);
	public List<CartVO> getListId(int[] selectItem);
	public void addCart(CartVO vo);
	public CartVO getLastItem();
}
