package com.ezen.springboard.service.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.service.board.BoardService;
import com.ezen.springboard.vo.BoardFileVO;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.Criteria;

@Repository
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	// 寃뚯떆湲� �벑濡�
	@Override
	public void insertBoard(BoardVO boardVO, List<BoardFileVO> fileList) {
		boardDAO.insertBoard(boardVO, fileList);
	}
	
	// 怨듭�湲� �벑濡�
	@Override
	public void insertAdminboard(BoardVO boardVO) {
		boardDAO.insertAdminboard(boardVO);
	}
	
	// 寃뚯떆湲� �궘�젣
	@Override
	public void deleteBoard(int boardNo) {
		boardDAO.deleteBoard(boardNo);
	}
	
	// 怨듭�湲� �궘�젣
	@Override
	public void deleteAdminboard(int boardNo) {
		boardDAO.deleteAdminboard(boardNo);
	}
	
	// 怨듭�湲� �닔�젙
	@Override
	public void updateAdminboard(BoardVO boardVO) {
		boardDAO.updateAdminboard(boardVO);
		
	}

	// 寃뚯떆湲� 紐⑸줉 議고쉶
	@Override
	public List<BoardVO> getBoardList(@RequestParam Map<String, String> paramMap, Criteria cri){
		return boardDAO.getBoardList(paramMap, cri);
	}
	
	//寃뚯떆湲� 珥� 媛쒖닔 議고쉶
	//寃��깋�뻽�쓣 �븣�뒗 寃��깋�맂 寃뚯떆湲��쓽 珥� 媛쒖닔瑜� 議고쉶
	@Override
	public int getBoardTotalCnt(Map<String, String> paramMap) {
		return boardDAO.getBoardTotalCnt(paramMap);
	}
	
	// 寃뚯떆湲� �긽�꽭 議고쉶
	@Override
	public BoardVO getBoard(int boardNo) {
		return boardDAO.getBoard(boardNo);
	}
	
	// 議고쉶�닔 利앷�
	@Override
	public void updateBoardCnt(int boardNo) {
		boardDAO.updateBoardCnt(boardNo);
	}
	
	// 泥⑤��뙆�씪 由ъ뒪�듃 議고쉶
	@Override
	public List<BoardFileVO> getBoardFileList(int boardNo) {
		return boardDAO.getBoardFileList(boardNo);
	}
	
	// 寃뚯떆湲� �닔�젙
	@Override
	public void updateBoard(BoardVO boardVO, List<BoardFileVO> uFileList) {
		boardDAO.updateBoard(boardVO, uFileList);
	}
	@Override
	public List<BoardVO> getAdboardList(@RequestParam Map<String, String> paramMap, Criteria cri){
		return boardDAO.getAdboardList(paramMap, cri);
	}
	
	@Override
	public BoardVO getAdminboard(int boardNo) {
		return boardDAO.getAdminboard(boardNo);
	}
	@Override
	public int getAdBoardTotalCnt(Map<String, String> paramMap) {
		return boardDAO.getAdBoardTotalCnt(paramMap);
	}
}
