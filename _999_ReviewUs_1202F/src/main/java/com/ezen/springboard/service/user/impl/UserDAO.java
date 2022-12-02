package com.ezen.springboard.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int idCheck(String userId) {
		return mybatis.selectOne("UserDAO.idCheck", userId);
	}
	
	public int nmCheck(String userNm) {
		return mybatis.selectOne("UserDAO.nmCheck", userNm);
	}
	
	public int join(UserVO userVO) {
		return mybatis.insert("UserDAO.join", userVO);
	}
	
	public UserVO login(UserVO userVO) {
		return mybatis.selectOne("UserDAO.login", userVO);
	}
	
	public UserVO findId(UserVO userVO) {
		System.out.println("Mybatis濡� findId() 湲곕뒫 泥섎━");
		return mybatis.selectOne("UserDAO.findId", userVO);
	}

	public UserVO findPassword(UserVO userVO) {
		System.out.println("Mybatis濡� findPassword() 湲곕뒫 泥섎━");
		return mybatis.selectOne("UserDAO.findPassword", userVO);
	}

	public void updatePassword(UserVO userVO) {
		System.out.println("Mybatis濡� updatePassword() 湲곕뒫 泥섎━");
		mybatis.update("UserDAO.updatePassword", userVO);
	}
	//관리자용
	public List<UserVO> getUserList(@RequestParam Map<String, String> paramMap, Criteria cri) {
		Map<String, Object> adUserList = new HashMap<String, Object>();
			
		adUserList.put("userSearch", paramMap);
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		
		adUserList.put("cri", cri);
	
		return mybatis.selectList("UserDAO.getAduserlist", adUserList);
	}
	
	public void updateUserRole(String userId) {
		mybatis.update("UserDAO.updateUserRole", userId);
	}
	public int getUserTotalCnt(Map<String, String> paramMap) {
		return mybatis.selectOne("UserDAO.getUserTotalCnt", paramMap);
	}
	
	
}