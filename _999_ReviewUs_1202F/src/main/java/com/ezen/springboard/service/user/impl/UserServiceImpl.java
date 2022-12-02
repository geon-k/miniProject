package com.ezen.springboard.service.user.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springboard.service.user.UserService;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
	public int idCheck(String userId) {
		return userDAO.idCheck(userId);
	}

	@Override
	public int nmCheck(String userNm) {
		return userDAO.nmCheck(userNm);
	}

	@Override
	public int join(UserVO userVO) {
		return userDAO.join(userVO);
	}

	@Override
	public UserVO login(UserVO userVO) {
		return userDAO.login(userVO);
	}

	@Override
	public UserVO findId(UserVO userVO) {
		return userDAO.findId(userVO);
	}

	@Override
	public UserVO findPassword(UserVO userVO) {
		return userDAO.findPassword(userVO);
	}

	@Override
	public void updatePassword(UserVO userVO) {
		userDAO.updatePassword(userVO);
	}
	@Override
	public List<UserVO> getUserList(Map<String, String> paramMap, Criteria cri){
		return userDAO.getUserList(paramMap, cri);
	}
	@Override
	public void updateUserRole(String userId) {
		userDAO.updateUserRole(userId);
	}
	@Override
	public int getUserTotalCnt(Map<String, String> paramMap) {
		return userDAO.getUserTotalCnt(paramMap);
	}
}