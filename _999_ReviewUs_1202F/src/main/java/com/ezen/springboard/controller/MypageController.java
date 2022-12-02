
package com.ezen.springboard.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.springboard.service.board.BoardService;
import com.ezen.springboard.service.mypage.MypageService;
import com.ezen.springboard.vo.BoardVO;
import com.ezen.springboard.vo.CommentVO;
import com.ezen.springboard.vo.Criteria;
import com.ezen.springboard.vo.PageVO;
import com.ezen.springboard.vo.UserVO;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MypageService mypageService;
	private BoardService boardService;
	
	// �ڽ��� ȸ������ Ȯ���ϴ� �⺻������
	@RequestMapping("/getMypage.do")
	public String getMypage(Model model, @RequestParam("userId") String userId, HttpSession session) {
		Map<String, String> getMypage = mypageService.getMypage(userId);		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser.getUserRole().equals("admin")) {
			return "admin/adMain";
		}
		session.setAttribute("loginUser", loginUser);
		model.addAttribute("getMypage", getMypage);
		
		return "mypage/mypageBasic";
	}
	
	// ȸ������ �������������� �̵� �� ���� ȸ������ ��� 
	@RequestMapping("/updateMypage.do")
	public String updateMypage(@RequestParam("userId") String userId, Model model, HttpSession session) {
		UserVO getUser = mypageService.getUser(userId);
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		session.setAttribute("loginUser", loginUser);
		model.addAttribute("getUser", getUser);
		
		return "mypage/mypageModify";
	}
	
	// ȸ������ ���� �� �⺻�������� �̵�
	@PostMapping(value="/updateUser.do", produces="application/text; charset=UTF8")
	public String updateUser(Model model, HttpSession session, UserVO userVO) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		session.setAttribute("loginUser", loginUser);
		mypageService.updateUser(userVO);
		
		return "redirect:/mypage/getMypage.do?userId=" + loginUser.getUserId();
	}

	// ȸ��Ż�� �������� �̵�
	@RequestMapping("/deleteMypage.do")
	public String deleteMypage(@RequestParam("userId") String userId, HttpSession session) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		session.setAttribute("loginUser", loginUser);
		return "mypage/mypageWithdrawal";
	}
	
	// ȸ��Ż�� ���������� Ż���ϱ� �� ��й�ȣ ����
	@PostMapping("/pwdCheck.do")
	@ResponseBody
	public String pwdCheck(@RequestParam("userId") String userId, UserVO userVO)  {	
		String returnStr = " ";		
		String pwdCheck = mypageService.pwdCheck(userId);
		
		if(pwdCheck.equals(userVO.getUserPwd())) {
			returnStr = "deleteOk";
		}
		else {
			returnStr = "deleteFail";
		}
		
		return returnStr;
	}
	
	// ȸ��Ż�� �� ������������ �̵�
	@RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam("userId") String userId, HttpSession session) {
		
		mypageService.deleteUser(userId);
		session.invalidate();	
		
		return "redirect:/index.jsp";
	}
	
	// �ڽ��� �ۼ��� �Խ��� ��� ������
	@RequestMapping("/postMypage.do")
	public String myBoardList(@RequestParam Map<String, String> paramMap, 
			Criteria cri, HttpSession session, Model model) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			return "redirect:/user/login.do";
		}
		
		System.out.println(paramMap.get("searchKeyword"));
		
		paramMap.put("userId", loginUser.getUserId());
		
		List<BoardVO> boardList = mypageService.myBoardList(paramMap, cri);
		
		System.out.println(boardList);
		
		model.addAttribute("boardList", boardList);
	
		if(paramMap.get("searchKeyword") != null && !paramMap.get("searchKeyword").equals(""))
			model.addAttribute("searchKeyword", paramMap.get("searchKeyword"));		
				
		int total = mypageService.myBoardTotalCnt(paramMap);
		
		model.addAttribute("pageVO", new PageVO(cri, total));
			
		return "mypage/mypagePost";
	}
	
	// �ڽ��� �ۼ��� ��� ��� ������
	@RequestMapping("/commentMypage.do")
	public String getCommentList(@RequestParam Map<String, String> paramMap, 
			Criteria cri, HttpSession session, Model model) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		List<CommentVO> commentList = mypageService.myCommentList(paramMap, cri);
		
		model.addAttribute("commentList", commentList);
			
		int total = mypageService.myCommentTotalCnt(paramMap);
		

		model.addAttribute("pageVO", new PageVO(cri, total));
		session.setAttribute("loginUser", loginUser);
			
		return "mypage/mypageComment";
	}
}
