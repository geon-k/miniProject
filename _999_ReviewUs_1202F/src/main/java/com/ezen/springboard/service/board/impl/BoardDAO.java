package com.ezen.springboard.service.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.vo.BoardFileVO;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.Criteria;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 寃뚯떆湲� �벑濡�
	public void insertBoard(BoardVO boardVO, List<BoardFileVO> fileList) {
		mybatis.insert("BoardDAO.insertBoard", boardVO);
		
		if(fileList.size() > 0) {
			// 寃뚯떆湲� 踰덊샇瑜� �떞�븘二쇰뒗 �옉�뾽
			for(BoardFileVO boardFile : fileList) {
				boardFile.setBoardNo(boardVO.getBoardNo());
				
				// List瑜� 留ㅽ띁濡� 蹂대궡�뒗 諛⑹떇 1: �븯�굹�뵫 爰쇰궡�꽌 留ㅽ띁�쓽 荑쇰━ �샇異�
				mybatis.insert("BoardDAO.insertBoardFile", boardFile);
			}
		}
	}
	
	// 怨듭�湲� �벑濡�
	public void insertAdminboard(BoardVO boardVO) {
		mybatis.insert("BoardDAO.insertAdminboard", boardVO);
	}
	
	// 寃뚯떆湲� �궘�젣
	public void deleteBoard(int boardNo) {
		mybatis.delete("BoardDAO.deleteBoard", boardNo);
	}
	
	// 怨듭�湲� �궘�젣
	public void deleteAdminboard(int boardNo) {
		mybatis.delete("BoardDAO.deleteAdminboard", boardNo);
	}
	
	// 怨듭�湲� �닔�젙
	public void updateAdminboard(BoardVO boardVO) {
		mybatis.update("BoardDAO.updateAdminboard", boardVO);
	}
	
	// 寃뚯떆湲� 紐⑸줉 議고쉶
	public List<BoardVO> getBoardList(@RequestParam Map<String, String> paramMap, Criteria cri) {
		Map<String, Object> pMap = new HashMap<String, Object>();
		
		pMap.put("boardSearch", paramMap);
		
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		
		pMap.put("cri", cri);
		
		return mybatis.selectList("BoardDAO.getBoardList", pMap);
	}
	
	// 寃뚯떆湲��쓽 珥� 媛쒖닔
	// 寃��깋�뻽�쓣 �븣 寃뚯떆湲��쓽 珥� 媛쒖닔
	public int getBoardTotalCnt(Map<String, String> paramMap) {
		return mybatis.selectOne("BoardDAO.getBoardTotalCnt", paramMap);
	}
	
	// 寃뚯떆湲� �긽�꽭 議고쉶
	public BoardVO getBoard(int boardNo) {
		Map<String, Object> testMap = mybatis.selectOne("BoardDAO.getBoardMap", boardNo);
		System.out.println(testMap.toString());
		
		return mybatis.selectOne("BoardDAO.getBoard", boardNo);
	}
	
	// 議고쉶�닔 利앷�
	public void updateBoardCnt(int boardNo) {
		mybatis.update("BoardDAO.updateBoardCnt", boardNo);
	}
	
	// 泥⑤��뙆�씪 由ъ뒪�듃 議고쉶
	public List<BoardFileVO> getBoardFileList(int boardNo) {
		return mybatis.selectList("BoardDAO.getBoardFileList", boardNo);
	}
	
	// 寃뚯떆湲� �닔�젙
	public void updateBoard(BoardVO boardVO, List<BoardFileVO> uFileList) {
		mybatis.update("BoardDAO.updateBoard", boardVO);
		
		if(uFileList.size() > 0) {
			for(int i = 0; i < uFileList.size(); i++) {
				if(uFileList.get(i).getFileStatus().equals("U")) {
					mybatis.update("BoardDAO.updateBoardFile", uFileList.get(i));
				} else if(uFileList.get(i).getFileStatus().equals("D")) {
					mybatis.delete("BoardDAO.deleteBoardFile", uFileList.get(i));
				} else if(uFileList.get(i).getFileStatus().equals("I")) {
					mybatis.insert("BoardDAO.insertBoardFile", uFileList.get(i));
				}
			}
		}
	}
	//관리자용
	public List<BoardVO> getAdboardList(@RequestParam Map<String, String> paramMap, Criteria cri) {
		Map<String, Object> adboardList = new HashMap<String, Object>();
			
		adboardList.put("AdboardSearch", paramMap);
		cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
		
		adboardList.put("cri", cri);
		
		return mybatis.selectList("BoardDAO.getAdBoardList", adboardList);
	}
	// 공지글 상세 조회
	public BoardVO getAdminboard(int boardNo) {
		return mybatis.selectOne("BoardDAO.getAdminboard", boardNo);
	}
	public int getAdBoardTotalCnt(Map<String, String> paramMap) {
		return mybatis.selectOne("BoardDAO.getAdBoardTotalCnt", paramMap);
	}
}
