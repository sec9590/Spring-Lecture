package com.example.spring02.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.dto.AddressDTO;

@Repository
public class AddressDAOImpl implements AddressDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<AddressDTO> AddressList() {
		return sqlSession.selectList("address.addressList");
	}

	@Override
	public void insertAddress(AddressDTO vo) {
		sqlSession.insert("address.insertAddress", vo);
	}

	@Override
	public AddressDTO viewAddress(String name) {
		return sqlSession.selectOne("address.viewAddress", name);
	}

	@Override
	public void deleteAddress(String name) {
		sqlSession.selectOne("address.deleteAddress", name);

	}

	@Override
	public void updateAddress(AddressDTO vo) {
		sqlSession.selectOne("address.updateAddress", vo);

	}

}
