package com.ssafy.homes.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.homes.model.dto.UserDTO;
import com.ssafy.homes.model.service.JwtService;
import com.ssafy.homes.model.service.UserService;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

@CrossOrigin
@RestController
@RequestMapping("/user")
public class UserController {

	public static final Logger logger = LoggerFactory.getLogger(UserController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private UserService uService;

	@Autowired
	private JwtService jwtService;

	// 회원가입
	@PostMapping("/signup")
	public ResponseEntity<String> signup(@RequestBody UserDTO user) throws Exception {
		System.out.println(user);
		logger.debug("signup - 호출");
		
		if(uService.signup(user)) {
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		
	}

	//////////////////// 로그인
	@ApiOperation(value = "로그인", notes = "Access-token과 로그인 결과 메세지를 반환한다.", response = Map.class)
	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(@RequestParam String uid,@RequestParam String upw) {
		System.out.println(uid + " " + upw);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;
		try {
			UserDTO loginUser = uService.login(uid, upw);
			System.out.println(loginUser);
			if(loginUser != null) {
				String accessToken = jwtService.createAccessToken("uid", loginUser.getUid());// key, data
				String refreshToken = jwtService.createRefreshToken("uid", loginUser.getUid());// key, data
				uService.saveRefreshToken(uid, refreshToken);
				logger.debug("로그인 accessToken 정보 : {}", accessToken);
				logger.debug("로그인 refreshToken 정보 : {}", refreshToken);
				resultMap.put("access-token", accessToken);
				resultMap.put("refresh-token", refreshToken);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
				
				//session.setAttribute("loginUser", loginUser);
				//model.addAttribute("msg", "로그인 성공");
				//return "success";
			}
			else {
				resultMap.put("message", FAIL);
				status = HttpStatus.ACCEPTED;
				//model.addAttribute("msg", "로그인 실패 ID 또는 PW를 확인하세요.");
			}
		}catch(Exception e) {
				logger.error("로그인 실패 : {}", e);
				resultMap.put("message", e.getMessage());
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
			
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
		}

	////////// 로그아웃
	@ApiOperation(value = "로그아웃", notes = "회원 정보를 담은 Token을 제거한다.", response = Map.class)
	@GetMapping("/logout/{uid}")
	public ResponseEntity<?> logout(@PathVariable("uid") String uid, Model model, HttpSession session) {
		//session.invalidate();
		//model.addAttribute("msg", "로그아웃 완료");
		//return "success";
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		try {
			uService.deleRefreshToken(uid);
			resultMap.put("message", SUCCESS);
			status = HttpStatus.ACCEPTED;
		} catch (Exception e) {
			logger.error("로그아웃 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
		
	}

	// 회원정보 가져오기
	@ApiOperation(value = "회원인증", notes = "회원 정보를 담은 Token을 반환한다.", response = Map.class)
	@GetMapping("/userinfo")
	public ResponseEntity<?> getUserInfo(@RequestParam String uid, HttpServletRequest request) {

		System.out.println(uid);
		logger.debug("uid : {} ", uid);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.UNAUTHORIZED;
		if (jwtService.checkToken(request.getHeader("access-token"))) {
			logger.info("사용 가능한 토큰!!!");
			try {
//				로그인 사용자 정보.
				UserDTO userDto = uService.getUserInfo(uid);
				resultMap.put("userInfo", userDto);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} catch (Exception e) {
				logger.error("정보조회 실패 : {}", e);
				resultMap.put("message", e.getMessage());
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
		} else {
			logger.error("사용 불가능 토큰!!!");
			resultMap.put("message", FAIL);
			status = HttpStatus.UNAUTHORIZED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	// 회원정보 수정하기
	@PutMapping("/modify")
	public ResponseEntity<String> userModify(@RequestBody UserDTO user, Model model) throws Exception {

		System.out.println(user);
		logger.info("userModify - 호출", user);
		
		if(uService.userModify(user)) {
			System.out.println("성공!!!!!!");
			return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		}
		System.out.println("실패!!!!");
		return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
		

	}
	
	@ApiOperation(value = "Access Token 재발급", notes = "만료된 access token을 재발급받는다.", response = Map.class)
	@PostMapping("/refresh")
	public ResponseEntity<?> refreshToken(@RequestBody UserDTO user, HttpServletRequest request)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		String token = request.getHeader("refresh-token");
		logger.debug("utoken : {}, UserDTO : {}", token, user);
		if (jwtService.checkToken(token)) {
			if (token.equals(uService.getRefreshToken(user.getUid()))) {
				String accessToken = jwtService.createAccessToken("uid", user.getUid());
				logger.debug("utoken : {}", accessToken);
				logger.debug("정상적으로 액세스토큰 재발급!!!");
				resultMap.put("access-token", accessToken);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			}
		} else {
			logger.debug("리프레쉬토큰도 사용불!!!!!!!");
			status = HttpStatus.UNAUTHORIZED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}

}
