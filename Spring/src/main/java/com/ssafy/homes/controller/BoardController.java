package com.ssafy.homes.controller;

import java.io.IOException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.homes.model.dto.BoardDTO;
import com.ssafy.homes.model.dto.CommentDTO;
import com.ssafy.homes.model.service.BoardService;

@CrossOrigin
@RestController
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;
	
	@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> list(@RequestParam(value = "page", defaultValue = "1")int page, @RequestParam(value="boardType") String boardType) {
		return new ResponseEntity<Map<String, Object>>(service.makePage(page, boardType), HttpStatus.ACCEPTED);
	}
	
	@PostMapping
	public ResponseEntity<String> write(@RequestBody BoardDTO board) throws IllegalStateException, IOException {
		System.out.println("넘어왔슈");
		// 글 쓰기
		boolean writeResult = service.write(board);		// 일단 글이 DB에 들어가야 글 번호를 File upload에 넣을 수 있음
		System.out.println(writeResult);
		System.out.println("after write : "+board);
	
		// 현재 rest 컨트롤러이기 때문에 화면이 아니라 데이터로 응답함
		if (writeResult == true) {			
			return new ResponseEntity<String>("success", HttpStatus.ACCEPTED);

		} else {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);		
		}
	}
	
	@GetMapping("/read")
	public ResponseEntity<Map<String, Object>> read(@RequestParam("bno") int bno) {
		return new ResponseEntity(service.read(bno), HttpStatus.ACCEPTED);
	}
	
	@PutMapping
	public ResponseEntity<String> boardUpdate(@RequestBody BoardDTO board){
		if(service.boardUpdate(board)) {
			return new ResponseEntity<String>("success", HttpStatus.ACCEPTED);
		}
		else {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
	}
	
	@DeleteMapping
	public ResponseEntity<String> boardDelete(@RequestParam("boardno") int boardno){
		if(service.boardDelete(boardno)) {
			return new ResponseEntity<String>("success", HttpStatus.ACCEPTED);
		}
		else {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
	}
	
	// 댓글 기능 //
	@GetMapping("/comment")
	public ResponseEntity<Map<String, Object>> readComments(@RequestParam(value="bno")int bno) {
		return new ResponseEntity(service.getComments(bno), HttpStatus.ACCEPTED);
	}
	
	@PostMapping("/comment")
	public ResponseEntity<String> writeComment(@RequestBody CommentDTO comment) throws IllegalStateException, IOException {
		System.out.println("댓글 넘어왔슈");
		System.out.println(comment.toString());
		// 글 쓰기
		boolean writeResult = service.writeComment(comment);		// 일단 글이 DB에 들어가야 글 번호를 File upload에 넣을 수 있음
		System.out.println(writeResult);
		System.out.println("after comment write : "+writeResult);
	
		// 현재 rest 컨트롤러이기 때문에 화면이 아니라 데이터로 응답함
		if (writeResult == true) {			
			return new ResponseEntity<String>("success", HttpStatus.ACCEPTED);

		} else {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);		
		}
	}
	
	//댓글 삭제
	@DeleteMapping("/comment")
	public ResponseEntity<String> deleteComment(@RequestParam int commentno){
		if(service.deleteComment(commentno)) {
			return new ResponseEntity<String>("success", HttpStatus.ACCEPTED);
		}
		else {
			return new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
	}
}
