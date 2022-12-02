package com.ezen.springboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springboard.service.comment.CommentService;
import com.ezen.springboard.vo.CommentVO;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private CommentService commentService;

	// 댓글 조회
	@RequestMapping("getComment.do")
	public void getComment(Model model, @RequestParam("boardNo") int boardNo) throws Exception {
		List<CommentVO> commentList = commentService.getComment(boardNo);
		System.out.println("comentList: " + commentList);

		model.addAttribute("commentList", commentList);
	}

	// 댓글 작성
	@RequestMapping("/insertComment.do")
	public String insertComment(CommentVO commentVO) throws Exception {
		commentService.insertComment(commentVO);
		System.out.println(commentVO.getBoardNo());
		return "redirect:/board/getBoard.do?boardNo=" + commentVO.getBoardNo();
	}

	// 댓글 수정
	@RequestMapping("/updateComment.do")
	public String updateComment(CommentVO commentVO) throws Exception {
		commentService.updateComment(commentVO);
		
		return "redirect:/board/getBoard.do?boardNo=" + commentVO.getBoardNo();
	}

	// 댓글 삭제
	@RequestMapping("/deleteComment.do")
	public String deleteComment(CommentVO commentVO) throws Exception {
		System.out.println(commentVO.getBoardNo());
		commentService.deleteComment(commentVO);
		System.out.println("commentVO.toString(): " + commentVO);
		System.out.println("보드 넘버: " + commentVO.getBoardNo());
		return "redirect:/board/getBoard.do?boardNo=" + commentVO.getBoardNo();

	}


	 //댓글 단일 조회 (수정 페이지)
	
	 @GetMapping("/commentSelect.do") public void commentSelect(@RequestParam("cno") int cno, @RequestParam("boardNo")
	 int boardNo, Model model) throws Exception {
	 
	 CommentVO vo = new CommentVO();
	 vo.setCno(cno);
	 vo.setBoardNo(boardNo); 
	 
	 CommentVO commentVO = commentService.commentSelect(vo);
	 
	 model.addAttribute("commentVO", commentVO); 
	 }

}
