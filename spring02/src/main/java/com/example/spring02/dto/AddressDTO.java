package com.example.spring02.dto;

public class AddressDTO {
	private int seq;
	private String name;
	private String gender;
	private String birthday;
	private String phone;
	private String address;

	public AddressDTO() {
		super();
	}

	public AddressDTO(int seq, String name, String gender, String birthday, String phone, String address) {
		super();
		this.seq = seq;
		this.name = name;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "AddressDTO [seq=" + seq + ", name=" + name + ", gender=" + gender + ", birthday=" + birthday
				+ ", phone=" + phone + ", address=" + address + "]";
	}

}
