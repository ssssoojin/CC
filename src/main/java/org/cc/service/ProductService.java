package org.cc.service;

import java.util.List;

import org.cc.domain.ProductVO;

public interface ProductService {
	public ProductVO getProduct(int itemNo);
	public List<ProductVO> getSales1();
	public List<ProductVO> getSales2();
}
