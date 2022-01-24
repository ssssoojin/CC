package org.cc.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cc.domain.MemberAttachVO;
import org.cc.domain.MemberVO;
import org.cc.service.FeedService;
import org.cc.service.MemberService;
import org.cc.service.ProductService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member")
@AllArgsConstructor
public class MemberController {
	private FeedService fservice;
	private MemberService service;
    private JavaMailSender mailSender;
    private ProductService productService;
	
    @GetMapping("/start")
	public void viewHeader() {
		log.info("start");
	}
    
	@GetMapping("/login")
	public void login() {
		log.info("login 진입");
	}
	
	@PostMapping("/login")
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		log.info("====================로그인=====================");
		
		HttpSession session = req.getSession();//세션 초기화
		MemberVO login = service.login(vo);
		List<MemberAttachVO> image = vo.getAttachImg();
		
		if(login == null) { // 일치하지 않는 아이디, 비밀번호 입력 경우
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/login";
			
		}else {  // 일치하는 아이디, 비밀번호 경우 (로그인 성공)
			session.setAttribute("member", login);
			session.setAttribute("img", image);
		}
		
		return "redirect:/member/main";
	}

	@GetMapping("/main")
	public void viewMain(Model model) {
		log.info("main");
		model.addAttribute("cg3", productService.getSales1());
		model.addAttribute("cg4", productService.getSales2());
		model.addAttribute("feed", fservice.getList());
		model.addAttribute("feed2", fservice.getListTop2());
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	//회원가입
	@PostMapping("/join")
	public String join(MemberVO vo) throws Exception{
		log.info("===================회원가입====================");
			// 회원가입 서비스 실행
			service.register(vo);
			
			log.info("join Service 성공");
			log.info("생일 : "+ vo.getUserBirth());
			
			return "redirect:/member/login";
			
		}
	@GetMapping("/join")
	public void join() {
		log.info("join 진입");
	}
	// 아이디 중복 검사
	@PostMapping("/joinIdChk")
	@ResponseBody
	public String joinIdChk(String userId) throws Exception{
		log.info("joinIdChk() 진입");
		int result = service.idCheck(userId);
		
		log.info("결과값 = " + result);
		if(result != 0) {
			return "fail";	// 중복 아이디가 존재
		} else {
			return "success";	// 중복 아이디 x
		}	
	}

    /* 메인페이지 로그아웃 */
    @GetMapping("logout.do")
    public String logout(HttpServletRequest request) throws Exception{
    	log.info("logout() 진입");
    	HttpSession session = request.getSession();
    	 session.invalidate();
         return "redirect:/member/main";   
    }
 
	 /* 이메일 인증 */
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111; // 111111 ~ 999999
        log.info("인증번호 " + checkNum);
        
        /* 이메일 보내기 */
        String setFrom = "colorcustom@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
	     try {
	            
	            MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(setFrom);
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	     String num = Integer.toString(checkNum);
	     return num;
    }
  
   
	
			
	// 첨부파일 목록
		@GetMapping(value = "/getAttachImg", produces = MediaType.APPLICATION_JSON_VALUE)
		@ResponseBody
		public ResponseEntity<List<MemberAttachVO>> getAttachImg(String userId) {
			log.info("getAttachImg " + userId);
			return new ResponseEntity<>(service.getAttachImg(userId), HttpStatus.OK);
		}
		
		// 삭제 처리
		@PostMapping("/delete")
		public String remove(MemberVO vo,HttpSession session,@RequestParam("userId") String userId, RedirectAttributes rttr){
		
			log.info("delete..." + userId);
			List<MemberAttachVO> attachList = service.getAttachImg(userId);
			if (service.remove(userId)) {
				deleteFiles(attachList);  // 첨부파일 삭제
				rttr.addFlashAttribute("result", "success");
			}
			session.invalidate();
			return "redirect:/member/main";
		}
		private void deleteFiles(List<MemberAttachVO> attachList) {
			if(attachList == null || attachList.size() == 0) {
				return;
			}
			log.info("delete attach files........");
			log.info(attachList);
			
			attachList.forEach(attach -> {
				try {
					Path file = Paths.get("C:\\Users\\BIT\\Desktop\\ColorCustom\\upload\\"+attach.getUploadPath()+"\\"+attach.getUuid()+"_"+attach.getFileName());
					Files.deleteIfExists(file);
					if(Files.probeContentType(file).startsWith("image")) {
						Path thumbNail = Paths.get("C:\\Users\\BIT\\Desktop\\ColorCustom\\upload\\"+attach.getUploadPath()+"\\s_"+attach.getUuid()+"_"+attach.getFileName());
						Files.delete(thumbNail);
					}
				} catch(Exception e) {
					log.error("delete file error" + e.getMessage());
				}
			});
		}
}
