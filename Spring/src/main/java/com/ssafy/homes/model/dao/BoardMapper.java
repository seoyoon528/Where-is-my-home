package com.ssafy.homes.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ssafy.homes.model.dto.BoardDTO;
import com.ssafy.homes.model.dto.CommentDTO;

@Repository
public interface BoardMapper {
	
	public int insert(BoardDTO board);
	
	public List<BoardDTO> selectList(@Param("start")int startRow, @Param("cnt")int count, @Param("boardType")String boardType);
	
	public int selectTotalCount(String boardType);

	public BoardDTO selectOne(int bno);
	
	// 댓글 가져오기  //
	public List<CommentDTO> getComments(int bno);
	
	//댓글 작성
	public int insertComment(CommentDTO comment);
	
	//게시글 수정
	public int boardUpdate(BoardDTO board);
	
	//게시글 삭제
	public int boardDelete(int boardno);
	
	//댓글삭제
	public int deleteComment(int commentno);
	
	
}
