package com.ezen.springboard.service.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.CommentVO;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.UserVO;


public interface MypageService {
	// 자신의 회원정보 
	Map<String, String> getMypage(String userId);
	// 회원정보 수정 전 현 회원정보 
	UserVO getUser(String userId);
	// 회원정보 수정
	void updateUser(UserVO userVO);
	// 비밀번호 확인
	String pwdCheck(String userId);
	// 회원탈퇴
	void deleteUser(String userId);
	
	List<BoardVO> myBoardList(Map<String, String> paramMap, Criteria cri);
	
	int myBoardTotalCnt(Map<String, String> paramMap);
	
	List<CommentVO> myCommentList(@RequestParam Map<String, String> paramMap, Criteria cri);
	
	int myCommentTotalCnt(Map<String, String> paramMap);
}
