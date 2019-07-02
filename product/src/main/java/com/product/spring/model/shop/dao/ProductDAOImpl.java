package com.product.spring.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.product.spring.model.shop.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductDTO> listProduct() {
		return sqlSession.selectList("product.list_product");
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return sqlSession.selectOne("product.viewProduct", product_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("product.updateProduct", dto);

	}

	@Override
	public void deleteProduct(int product_id) {
		sqlSession.delete("product.deleteProduct", product_id);

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		sqlSession.insert("product.insertProduct", dto);
		
	}

	@Override
	public String fileInfo(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
