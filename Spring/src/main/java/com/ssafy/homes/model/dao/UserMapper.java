package com.ssafy.homes.model.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssafy.homes.model.dto.UserDTO;

@Repository
public interface UserMapper {
	
	public int insert(UserDTO user); //회원가입
	public UserDTO selectOne(@Param("uid")String uid, @Param("upw")String upw); //로그인
	public int update(UserDTO user); // 회원정보 수정
	public UserDTO getUser(String uid); //회원정보 조회
	public void saveRefreshToken(Map<String, String> map);
	public Object getRefreshToken(String uid);
	public void deleteRefreshToken(Map<String, String> map);

}
