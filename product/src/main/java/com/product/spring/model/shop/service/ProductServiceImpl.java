package com.product.spring.model.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.product.spring.model.shop.dao.ProductDAO;
import com.product.spring.model.shop.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO pDao;

	@Override
	public List<ProductDTO> listProduct() {
		return pDao.listProduct();
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		// TODO Auto-generated method stub
		return pDao.detailProduct(product_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		pDao.updateProduct(dto);
	}

	@Override
	public void deleteProduct(int product_id) {
		pDao.deleteProduct(product_id);
	}

	@Override
	public void insertProduct(ProductDTO dto) {
		pDao.insertProduct(dto);

	}

	@Override
	public String fileInfo(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}

}
