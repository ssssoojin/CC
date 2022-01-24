package org.cc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cc.domain.FeedVO;
import org.cc.domain.MemberVO;
import org.cc.domain.PaymentItemVO;
import org.cc.service.FeedService;
import org.cc.service.PaymentItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/feed/*")
@AllArgsConstructor
public class FeedController {
	
	private FeedService service;
	@Autowired
	private PaymentItemService paymentItemService;

	@GetMapping("/feedClick")
	public void feed(Model model) {
		log.info("------------다 출력------------");
		model.addAttribute("all",service.getAll());
	}
	@GetMapping("/feed")
	public void feedfeed(Model model) {
		log.info("------------다 출력------------");
		model.addAttribute("all",service.getAll());
	}
	
	@GetMapping("/feedDetail2")
	//public void feedDetail(@RequestParam("feedNo") Long feedNo,Model model) {
	public void feedDetail2(@RequestParam("feedNo") Long feedNo, Model model) {
		log.info(feedNo);
		log.info("/feedDetail");
		model.addAttribute("feed", service.get(feedNo));
	}
	
	
	@PostMapping(value="/saveHeart.do/{feedNo}", produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<Integer> saveHeart (@PathVariable("feedNo")Long feedNo){
		log.info("-------좋아요 누름 게시글 번호"+feedNo);
		int result = service.saveHeart(feedNo);
		return new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	@PostMapping(value="/removeHeart.do/{feedNo}", produces= {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<Integer> removeHeart (@PathVariable("feedNo")Long feedNo){
		log.info("-------좋아요 취소누름 게시글 번호"+feedNo);
		return new ResponseEntity<>(service.removeHeart(feedNo), HttpStatus.OK);
	}
	
	@GetMapping("/feedWrite")
	public void feedWrite(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = ((MemberVO) session.getAttribute("member")).getUserId();
		List<PaymentItemVO> itemList = paymentItemService.getList(userId);

		List<PaymentItemVO> categoryOne = new ArrayList<PaymentItemVO>();
		List<PaymentItemVO> categoryTwo = new ArrayList<PaymentItemVO>();
		List<PaymentItemVO> categoryThree = new ArrayList<PaymentItemVO>();
		List<PaymentItemVO> categoryFour = new ArrayList<PaymentItemVO>();

		for (PaymentItemVO item : itemList) {
			switch (item.getCategory()) {
			case 1:
				categoryOne.add(item);
				break;
			case 2:
				categoryTwo.add(item);
				break;
			case 3:
				categoryThree.add(item);
				break;
			case 4:
				categoryFour.add(item);
				break;
			}
		}

		model.addAttribute("categoryOne", categoryOne);
		model.addAttribute("categoryTwo", categoryTwo);
		model.addAttribute("categoryThree", categoryThree);
		model.addAttribute("categoryFour", categoryFour);
	}

	@PostMapping("/feedWrite")
	public String insertFeedWrite(@RequestParam("title") String title, @RequestParam("color") String color,
			@RequestParam("sizeTop") String sizeTop, @RequestParam("sizeBottom") String sizeBottom,
			@RequestParam("description") String description, @RequestParam("imgTop") String imgTop,
			@RequestParam("imgBottom") String imgBottom, @RequestParam("imgAccCustom") String imgAccCustom,
			@RequestParam("imgAccReal") String imgAccReal, @RequestParam("userId") String userId) {
		FeedVO feed = new FeedVO();
		feed.setTitle(title);
		feed.setColor(color);
		feed.setSize(sizeTop+sizeBottom);
		feed.setDescription(description);
		feed.setImgTop(imgTop);
		feed.setImgBottom(imgBottom);
		feed.setImgAccCustom(imgAccCustom);
		feed.setImgAccReal(imgAccReal);
		feed.setUserId(userId);
		service.insert(feed);
		
		return "redirect:/mypage/myPage";
	}
}