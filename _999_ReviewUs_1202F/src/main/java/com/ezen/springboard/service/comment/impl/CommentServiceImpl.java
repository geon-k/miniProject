package com.ezen.springboard.service.comment.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springboard.service.comment.CommentService;
import com.ezen.springboard.vo.CommentVO;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDAO;

	@Override
	public List<CommentVO> getComment(int boardNo) throws Exception {
		return commentDAO.getComment(boardNo);
	}

	@Override
	public void insertComment(CommentVO commentVO) throws Exception {
		commentDAO.insertComment(commentVO);
	}

	@Override
	public void updateComment(CommentVO commentVO) throws Exception {
		commentDAO.updateComment(commentVO);
	}

	@Override
	public void deleteComment(CommentVO commentVO) throws Exception {
		commentDAO.deleteComment(commentVO);
	}

	@Override
	public CommentVO commentSelect(CommentVO commentVO) throws Exception {
		return commentDAO.commentSelect(commentVO);
	}
	


}
