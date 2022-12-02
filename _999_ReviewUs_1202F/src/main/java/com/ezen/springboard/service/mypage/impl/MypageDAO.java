package com.ezen.springboard.service.mypage.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.CommentVO;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.UserVO;


@Repository
public class MypageDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public Map<String, String> getMypage(String userId) {
		return mybatis.selectOne("UserDAO.getMypage", userId);
	}

	public UserVO getUser(String userId) {
		return mybatis.selectOne("UserDAO.getUser", userId);
	}
	
	public void updateUser(UserVO userVO) {	
		mybatis.update("UserDAO.updateUser", userVO);
	}
	
	public String pwdCheck(String userId) {
		return mybatis.selectOne("UserDAO.pwdCheck", userId);
	}
	
	public void deleteUser(String userId) {
		mybatis.delete("UserDAO.deleteUser", userId);
	}
	
	public List<BoardVO> myBoardList(Map<String, String> paramMap, Criteria cri) {
		Map<String, Object> pMap = new HashMap<String, Object>();
		
		System.out.println("paramMap : " +paramMap);
		
		
		pMap.put("boardSearch", paramMap);		
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());		
		pMap.put("cri", cri);
		
		System.out.println("PMaP : " + pMap);
		System.out.println(pMap.get("boardSearch"));
		
		return mybatis.selectList("BoardDAO.myBoardList", pMap);
	}
	
	public int myBoardTotalCnt(Map<String, String> paramMap) {
		return mybatis.selectOne("BoardDAO.myBoardTotalCnt", paramMap);
	}
	
	public List<CommentVO> myCommentList(Map<String, String> paramMap, Criteria cri) {
		Map<String, Object> pMap = new HashMap<String, Object>();
		
		pMap.put("boardSearch", paramMap);
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		pMap.put("cri", cri);
		
		return mybatis.selectList("CommentDAO.myCommentList",pMap);
	}
	
	public int myCommentTotalCnt(Map<String, String> paramMap) {
		return mybatis.selectOne("CommentDAO.myCommentTotalCnt", paramMap);
	}
}
