package com.ezen.springboard.service.user;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.UserVO;

public interface UserService {
	//ID 以묐났泥댄겕
	int idCheck(String userId);
	
	//Nickname 以묐났泥댄겕
	int nmCheck(String userNm);
	
	//�쉶�썝媛��엯
	int join(UserVO userVO);
	
	//濡쒓렇�씤
	UserVO login(UserVO userVO);
	
	// �븘�씠�뵒李얘린
	UserVO findId(UserVO userVO);
	
	// �뙣�뒪�썙�뱶 李얘린
	UserVO findPassword(UserVO userVO);
	
	// �뙣�뒪�썙�뱶 蹂�寃�
	void updateUserRole(String userId);
	
	List<UserVO> getUserList(Map<String, String> paramMap, Criteria cri);
	
	int getUserTotalCnt(Map<String, String> paramMap);
	
	void updatePassword(UserVO userVO);
}
