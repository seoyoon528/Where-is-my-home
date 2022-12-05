package com.ssafy.homes.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.homes.model.dto.DongCodeDTO;
import com.ssafy.homes.model.dto.HouseDealDTO;
import com.ssafy.homes.model.dto.HouseInfoDTO;
import com.ssafy.homes.model.service.HouseService;

@RestController
@RequestMapping("/house")
public class HouseController {
	
	@Autowired
	private HouseService service;
	
	@GetMapping("/sido")
	public ResponseEntity<Map<String, Object>> sido() throws SQLException {
			return new ResponseEntity(service.getSido(), HttpStatus.ACCEPTED);
	}
	
	@GetMapping("/gugun")
	public ResponseEntity<Map<String, Object>> gugun(@RequestParam String sido) throws SQLException {
			return new ResponseEntity(service.getGugun(sido), HttpStatus.ACCEPTED);
	}
	
	@GetMapping("/dong")
	public ResponseEntity<Map<String, Object>> dong(@RequestParam String sido, @RequestParam String gugun) throws SQLException {
			return new ResponseEntity(service.getDong(sido, gugun), HttpStatus.ACCEPTED);
	}
	
	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> list(@RequestParam String sido, @RequestParam String gugun, @RequestParam String dong) throws SQLException {
		String code = service.getCode(sido, gugun, dong);
		return new ResponseEntity(service.getApts(code), HttpStatus.ACCEPTED);
	}
	@GetMapping("/dongCode")
	public ResponseEntity<Map<String, Object>> dongCode(@RequestParam String sido, @RequestParam String gugun, @RequestParam String dong) throws SQLException {
		
		return new ResponseEntity(service.getCode(sido, gugun, dong), HttpStatus.ACCEPTED);
	}
	
	@GetMapping("/detail")
	public ResponseEntity<Map<String, Object>> readDetail(@RequestParam long aptcode) throws SQLException {
		DongCodeDTO dongCode = service.getDongCode(aptcode);
		List<HouseDealDTO> dealList = service.getDeals(aptcode);
		HouseInfoDTO houseInfo = service.getApt(aptcode);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("dongCode", dongCode);
		resultMap.put("dealList", dealList);
		resultMap.put("houseInfo", houseInfo);

		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.ACCEPTED);
	}
	
	@GetMapping("/totalDongAptCount")
	public ResponseEntity<Map<String, Object>> totalDongAptCount(@RequestParam String dongCode) throws SQLException {
		return new ResponseEntity(service.getTotalDongAptCount(dongCode), HttpStatus.ACCEPTED);
	}
	
	@GetMapping("/top3AptList")
	public ResponseEntity<Map<String, Object>> top3AptList(@RequestParam String dongCode) throws SQLException {
		return new ResponseEntity(service.getTop3AptList(dongCode), HttpStatus.ACCEPTED);
	}
}
