package com.example.spring02.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring02.dao.AddressDAO;
import com.example.spring02.dto.AddressDTO;

@Service
public class AddressServiceImpl implements AddressService {

	@Inject
	AddressDAO aDao;
	
	@Override
	public List<AddressDTO> AddressList() {
		// TODO Auto-generated method stub
		return aDao.AddressList();
	}

	@Override
	public void insertAddress(AddressDTO vo) {
		aDao.insertAddress(vo);

	}

	@Override
	public AddressDTO viewAddress(String name) {
		return aDao.viewAddress(name);
	}

	@Override
	public void deleteAddress(String name) {
		aDao.deleteAddress(name);
	}

	@Override
	public void updateAddress(AddressDTO vo) {
		aDao.updateAddress(vo);
	}

}
