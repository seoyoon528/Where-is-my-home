package com.ssafy.homes.model.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.homes.model.dao.UserMapper;
import com.ssafy.homes.model.dto.UserDTO;

@Service
public class UserService {
	
	@Autowired
	private UserMapper dao;
	@Autowired
	private SqlSession sqlSession;
	
	//회원가입
	public boolean signup(UserDTO user) throws Exception{
		
		
		if(dao.insert(user)==1)
			return true;
			
		return false;
	}
	
	//로그인
	public UserDTO login(String uid, String upw) {
		return dao.selectOne(uid, upw);
	}
	
	//회원정보 가져오기
	public UserDTO getUserInfo(String uid) {
		return dao.getUser(uid);
	}
	
	//회원정보 수정하기
	public boolean userModify(UserDTO user) throws Exception{
		if(dao.update(user)==1)
			return true;
		return false;
	}
	
	public void saveRefreshToken(String uid, String refreshToken) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("uid", uid);
		map.put("token", refreshToken);
		sqlSession.getMapper(UserMapper.class).saveRefreshToken(map);
	}

	
	public Object getRefreshToken(String uid) throws Exception {
		return sqlSession.getMapper(UserMapper.class).getRefreshToken(uid);
	}

	
	public void deleRefreshToken(String uid) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("uid", uid);
		map.put("token", null);
		sqlSession.getMapper(UserMapper.class).deleteRefreshToken(map);
	}

}
