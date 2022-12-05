package com.ssafy.homes.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.ssafy.homes.model.dto.AptTop3DTO;
import com.ssafy.homes.model.dto.DongCodeDTO;
import com.ssafy.homes.model.dto.HouseDealDTO;
import com.ssafy.homes.model.dto.HouseInfoDTO;

@Repository
public interface HouseMapper {

	
	public List<DongCodeDTO> getSido();
	
	public List<DongCodeDTO> getGugun(String sido);
	
	public List<DongCodeDTO> getDong(String sido, String gugun);
	
	public String getCode(String sido, String gugun, String dong);
	
	// 동 코드 객체를 만들어줌
	public DongCodeDTO getDongCode(long aptcode);
	
	// 동에 있는 아파트 리스트
	public List<HouseInfoDTO> getApts(String code);
	
	public HouseInfoDTO getApt(long aptCode);
	
	// 아파트 코드에 따른 거래 내역 리스트
	public List<HouseDealDTO> getDeals(long aptCode);
	
	public List<HouseDealDTO> getDealsMOrder(long aptCode);
	
	public int getTotalDongAptCount(String dongCode);

	public List<AptTop3DTO> getTop3AptList(String dongCode);
}
