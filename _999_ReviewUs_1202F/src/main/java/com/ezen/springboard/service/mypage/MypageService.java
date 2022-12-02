package com.ezen.springboard.service.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.CommentVO;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.UserVO;


public interface MypageService {
	// �ڽ��� ȸ������ 
	Map<String, String> getMypage(String userId);
	// ȸ������ ���� �� �� ȸ������ 
	UserVO getUser(String userId);
	// ȸ������ ����
	void updateUser(UserVO userVO);
	// ��й�ȣ Ȯ��
	String pwdCheck(String userId);
	// ȸ��Ż��
	void deleteUser(String userId);
	
	List<BoardVO> myBoardList(Map<String, String> paramMap, Criteria cri);
	
	int myBoardTotalCnt(Map<String, String> paramMap);
	
	List<CommentVO> myCommentList(@RequestParam Map<String, String> paramMap, Criteria cri);
	
	int myCommentTotalCnt(Map<String, String> paramMap);
}
