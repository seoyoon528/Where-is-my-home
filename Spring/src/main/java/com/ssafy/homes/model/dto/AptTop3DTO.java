package com.ssafy.homes.model.dto;

public class AptTop3DTO {
	private long aptCode;
	private String apartmentName;
	private int count;
	
	public AptTop3DTO(long aptCode, String apartmentName, int count) {
		this.aptCode = aptCode;
		this.apartmentName = apartmentName;
		this.count = count;
	}

	public long getAptCode() {
		return aptCode;
	}

	public void setAptCode(long aptCode) {
		this.aptCode = aptCode;
	}

	public String getApartmentName() {
		return apartmentName;
	}

	public void setApartmentName(String apartmentName) {
		this.apartmentName = apartmentName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "AptTop3DTO [aptCode=" + aptCode + ", apartmentName=" + apartmentName + ", count=" + count + "]";
	}
}

