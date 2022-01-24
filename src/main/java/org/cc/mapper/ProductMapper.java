package org.cc.mapper;

import java.util.List;

import org.cc.domain.ProductVO;

public interface ProductMapper {
	public ProductVO getProduct(int itemNo); // itemNo로 itemName, price, image를 가져오기 위해
	public List<ProductVO> getSales1(); // 모자
	public List<ProductVO> getSales2(); // 액세서리
}
