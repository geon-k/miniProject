package com.ezen.springboard.service.comment.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springboard.vo.CommentVO;

@Repository
public class CommentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CommentVO> getComment(int boardNo) throws Exception {
		return mybatis.selectList("CommentDAO.getComment", boardNo);
	}
	
	public void insertComment(CommentVO commentVO) throws Exception {
		mybatis.insert("CommentDAO.insertComment", commentVO);
	}
	
	public void updateComment(CommentVO commentVO) throws Exception {
		mybatis.update("CommentDAO.updateComment", commentVO);
	}
	
	public void deleteComment(CommentVO commentVO) throws Exception {
		mybatis.delete("CommentDAO.deleteComment", commentVO);
	}
	
	public CommentVO commentSelect(CommentVO commentVO) throws Exception {
		return mybatis.selectOne("CommentDAO.commentSelect", commentVO);
	}
}
