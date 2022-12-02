package com.ezen.springboard.service.mypage.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.service.mypage.MypageService;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.CommentVO;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.UserVO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public Map<String, String> getMypage(String userId) {
		return mypageDAO.getMypage(userId);
	}	
	@Override
	public UserVO getUser(String userId) {
		return mypageDAO.getUser(userId);
	}
	@Override
	public void updateUser(UserVO userVO) {
		mypageDAO.updateUser(userVO);
	}
	@Override 
	public String pwdCheck(String userId) {
		return mypageDAO.pwdCheck(userId);
	}
	@Override
	public void deleteUser(String userId) {
		mypageDAO.deleteUser(userId);
	}
	@Override
	public List<BoardVO> myBoardList(Map<String, String> paramMap, Criteria cri) {
		return mypageDAO.myBoardList(paramMap, cri);
	}
	@Override
	public int myBoardTotalCnt(Map<String, String> paramMap) {
		return mypageDAO.myBoardTotalCnt(paramMap);
	}
	@Override
	public List<CommentVO> myCommentList(Map<String, String> paramMap, Criteria cri) {

		return mypageDAO.myCommentList(paramMap, cri);
	}
	@Override
	public int myCommentTotalCnt(Map<String, String> paramMap) {
		return mypageDAO.myCommentTotalCnt(paramMap);
	}
}
