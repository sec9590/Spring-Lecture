package com.example.spring02.service;

import java.util.List;

import com.example.spring02.dto.AddressDTO;

public interface AddressService {
	public List<AddressDTO> AddressList();
	public void insertAddress(AddressDTO vo);
	public AddressDTO viewAddress(String name);
	public void deleteAddress(String name);
	public void updateAddress(AddressDTO vo);
}
