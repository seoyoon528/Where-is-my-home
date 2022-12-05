package com.ssafy.homes.model.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.homes.model.dao.HouseMapper;
import com.ssafy.homes.model.dto.AptTop3DTO;
import com.ssafy.homes.model.dto.DongCodeDTO;
import com.ssafy.homes.model.dto.HouseDealDTO;
import com.ssafy.homes.model.dto.HouseInfoDTO;

@Service
public class HouseService {
	
	@Autowired
	private HouseMapper dao;

	public List<DongCodeDTO> getSido() throws SQLException {
		return dao.getSido();
	}

	public List<DongCodeDTO> getGugun(String sido) throws SQLException {
		return dao.getGugun(sido);
	}

	public List<DongCodeDTO> getDong(@Param("sido")String sido, @Param("gugun")String gugun) throws SQLException {
		return dao.getDong(sido, gugun);
	}

	public String getCode(@Param("sido")String sido, @Param("gugun")String gugun, @Param("dong")String dong) throws SQLException {
		return dao.getCode(sido, gugun, dong);
	}

	public DongCodeDTO getDongCode(@Param("aptcode")long aptCode) throws SQLException {
		return dao.getDongCode(aptCode);
	}

	public List<HouseInfoDTO> getApts(@Param("code")String code) throws SQLException {
		return dao.getApts(code);
	}

	public List<HouseDealDTO> getDeals(@Param("aptcode")long aptCode) throws SQLException {
		return dao.getDeals(aptCode);
	}

	public HouseInfoDTO getApt(@Param("aptcode")long aptCode) throws SQLException {
		return dao.getApt(aptCode);
	}
	
	public int getTotalDongAptCount(@Param("dongCode")String dongCode) {
		return dao.getTotalDongAptCount(dongCode);
	}

	public List<AptTop3DTO> getTop3AptList(String dongCode) {
		return dao.getTop3AptList(dongCode);
	}
}
