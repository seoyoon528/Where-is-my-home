package com.ssafy.homes.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.homes.model.dao.BoardMapper;
import com.ssafy.homes.model.dto.BoardDTO;
import com.ssafy.homes.model.dto.CommentDTO;

@Service
public class BoardService {
	
	private static final int COUNT_PER_PAGE=10;
	
	@Autowired
	private BoardMapper dao;
	
	public Map<String, Object> makePage(int page, String boardType){
		int totalCount = dao.selectTotalCount(boardType);
		int totalPage = totalCount / COUNT_PER_PAGE;
		if(totalCount%COUNT_PER_PAGE>0) {
			totalPage++;
		}
		
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+9;
		
		if(endPage>totalPage) {
			endPage=totalPage;
		}
		
		if(page>totalPage) {
			page=1;
		}
		
		int startRow = (page-1)*COUNT_PER_PAGE;
		List<BoardDTO> boardList = dao.selectList(startRow, COUNT_PER_PAGE, boardType);			
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("startPage", startPage);
		result.put("endPage", endPage);
		result.put("currPage", page);
		result.put("totalPage", totalPage);
		result.put("boardList", boardList);
		
		return result;
	}
	
	public boolean write(BoardDTO board) {
		if (board == null || board.getBoardtitle() == null || board.getBoardtitle().length() == 0 || 
			board.getBoardwriter() == null || board.getBoardwriter().length() == 0) {
			return false;
		}
		if (dao.insert(board) == 1) {
			return true;			
		}
		return false;
	}
	
	public BoardDTO read(int bno) {		
		return dao.selectOne(bno);
	}
	
	public List<CommentDTO> getComments(int boardno) {
		return dao.getComments(boardno);
	}
	
	public boolean writeComment(CommentDTO comment) {
		if (comment == null || comment.getCommentcontent() == null) return false;
		if (dao.insertComment(comment) == 1) {
			return true;
		}
		return false;
	}
	
	public boolean boardDelete(int boardno) {
		if(dao.boardDelete(boardno)==1)
			return true;
		return false;
	}
	
	public boolean boardUpdate(BoardDTO board) {
		if(dao.boardUpdate(board)==1) {
			return true;
		}
		return false;
	}
	
	public boolean deleteComment(int commentno) {
		if(dao.deleteComment(commentno)==1) {
			return true;
		}
		return false;
	}
}
