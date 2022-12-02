package com.ezen.springboard.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.vo.BoardFileVO;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.Criteria;

@Component
public interface BoardService {
	// 寃뚯떆湲� �벑濡�
	void insertBoard(BoardVO boardVO, List<BoardFileVO> fileList);
	
	// 怨듭�湲� �벑濡�
	void insertAdminboard(BoardVO boardVO);
	
	// 寃뚯떆湲� �궘�젣
	void deleteBoard(int boardNo);
	
	// 怨듭�湲� �궘�젣
	void deleteAdminboard(int boardNo);
	
	// 怨듭�湲� �닔�젙
	void updateAdminboard(BoardVO boardVO);
	
	// 寃뚯떆湲� 紐⑸줉 議고쉶
	List<BoardVO> getBoardList(@RequestParam Map<String, String> paramMap, Criteria cri);
	
	//寃뚯떆湲� 珥� 媛쒖닔 議고쉶
	//寃��깋�뻽�쓣 �븣�뒗 寃��깋�맂 寃뚯떆湲��쓽 珥� 媛쒖닔瑜� 議고쉶
	int getBoardTotalCnt(Map<String, String> paramMap);
	
	// 寃뚯떆湲� �긽�꽭 議고쉶
	BoardVO getBoard(int boardNo);
	
	// 議고쉶�닔 利앷�
	void updateBoardCnt(int boardNo);
	
	// 泥⑤��뙆�씪 由ъ뒪�듃 議고쉶
	List<BoardFileVO> getBoardFileList(int boardNo);
	
	// 寃뚯떆湲� �닔�젙
	void updateBoard(BoardVO boardVO, List<BoardFileVO> uFileList);
	
	// 공지글 상세 조회
	BoardVO getAdminboard(int boardNo);
	
	//관리자 게시글 목록 조회
	List<BoardVO> getAdboardList(@RequestParam Map<String, String> paramMap, Criteria cri);
	
	int getAdBoardTotalCnt(Map<String, String> paramMap);
}