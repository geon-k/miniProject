package com.ezen.springboard.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.springboard.service.user.UserService;
import com.ezen.springboard.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	
	@GetMapping("/join.do")
	public String joinView() {
		return"user/join";
	}
	
	@PostMapping(value="/join.do", produces="application/text; charset=UTF8")
	public String join(UserVO userVO, Model model) {
		int joinResult = userService.join(userVO);
		
		//ȸ������ ���� ��
		if(joinResult == 0) {
			model.addAttribute("joinMsg", "ȸ�����Կ� �����Ͽ����ϴ�. �ٽ� �� �� Ȯ�����ּ���.");
			return "user/join";
		}
		
		//ȸ������ ���� ��
		model.addAttribute("joinMsg", userVO.getUserNm() + " ������ ȯ���մϴ�!");
		return "user/login";
	}
	

	@PostMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(UserVO userVO) {
		String returnStr = "";
		
		int idCnt = userService.idCheck(userVO.getUserId());
		
		if(idCnt > 0) returnStr = "duplicatedId";
		else returnStr = "availableId";
		
		return returnStr;
	}
	

	@PostMapping("/nmCheck.do")
	@ResponseBody
	public String nmCheck(UserVO userVO) {
		String returnStr = "";
		
		int nmCnt = userService.nmCheck(userVO.getUserNm());
		
		if(nmCnt > 0) returnStr = "duplicatedNm";
		else returnStr = "availableNm";
		
		return returnStr;
	}

	//�α��� ȭ������ �̵�
	@GetMapping("/login.do")
	public String loginView() {
		return "user/login";
	}
	
	//�α��� ó��
	@PostMapping("/login.do")
	@ResponseBody
	//HttpSession: ���� WAS�� ������ ������ ���������� ����ִ� ��ü
	//			   ���ǿ��� ����� �����͸� ����� �� �ִ�.
	public String login(UserVO userVO, HttpSession session) {
		//1. ���̵� üũ
		int idCheck = userService.idCheck(userVO.getUserId());
		
		if(idCheck < 1) {
			return "idFail";
		} else {
			UserVO loginUser = userService.login(userVO);
			
			//2. ��й�ȣ üũ
			if(loginUser == null) {
				return "pwFail";
			}
			if(loginUser.getUserRole().equals("Stopped")) {
				session.invalidate();
				return "StoppedUser";
			}
			
			//3. �α��� ����
			//���ǿ� �α����� ������ ������ ��Ƽ� ����
			session.setAttribute("loginUser", loginUser);
			return "loginSuccess";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	// 아이디 찾기 페이지 이동
	@RequestMapping(value="find_id_form")
	public String findIdView() {
		return "user/findId";
	}
	
    // 아이디 찾기 실행
	@RequestMapping(value="find_id", method=RequestMethod.POST)
	public String findIdAction(UserVO userVO, Model model) {
		UserVO user = userService.findId(userVO);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getUserId());
		}
		
		return "user/findId";
	}
	
    // 비밀번호 찾기 페이지로 이동
	@RequestMapping(value="find_password_form")
	public String findPasswordView() {
		return "user/findPassword";
	}
	
    // 비밀번호 찾기 실행
	@RequestMapping(value="find_password", method=RequestMethod.POST)
	public String findPasswordAction(UserVO userVO, Model model) {
		UserVO user = userService.findPassword(userVO);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getUserId());
		}
		
		return "user/findPassword";
	}
	
    // 비밀번호 바꾸기 실행
	@RequestMapping(value="update_password", method=RequestMethod.POST)
	public String updatePasswordAction(@RequestParam (value="updateid", defaultValue="", required=false)
		String id, UserVO userVO) {
			userVO.setUserId(id);
			System.out.println(userVO);
			userService.updatePassword(userVO);
			return "user/findPasswordConfirm";
	}

}
