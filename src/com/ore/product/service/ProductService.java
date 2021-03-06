package com.ore.product.service;

import java.util.List;

import com.ore.product.vo.ProductVO;

public interface ProductService {
	// 리스트, 한건조회, 입력, 수정, 삭제
	List<ProductVO> selectProductList(String cate, String sort);
	ProductVO selectProduct(ProductVO vo);
	int insertProduct(ProductVO vo);
	int updateProduct(ProductVO vo);
	int deleteProduct(ProductVO vo);
	
	public List<ProductVO> productListPaging(int page, String category, String sort);

}
