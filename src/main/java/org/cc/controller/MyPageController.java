package org.cc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.cc.domain.CartVO;
import org.cc.domain.MemberVO;
import org.cc.domain.PaymentItemVO;
import org.cc.domain.PaymentVO;
import org.cc.service.CartService;
import org.cc.service.FeedService;
import org.cc.service.MemberService;
import org.cc.service.PaymentItemService;
import org.cc.service.PaymentService;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
@AllArgsConstructor
public class MyPageController {
	private FeedService feedService;
	private MemberService service;
	private PaymentService paymentService;
	private CartService cartService;

	@Autowired
	private PaymentItemService paymentItemService;

	@GetMapping("/myPage")
	public void mypage(HttpServletRequest req, Model model) {
		log.info("------------여기는 마이페이지------------");
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

		model.addAttribute("member", service.getMemberInfo(userId));
	}

	 /* 회원 수정 */
		@GetMapping("/updateInfo")
		public void updateInfo(@RequestParam("userId") String userId, Model model) {
			
			log.info("updateInfo()..........");
			model.addAttribute("member", service.getMemberInfo(userId));
			

		}
		/* 회원 수정 */
		@PostMapping("/updateInfo")
		public String updateInfo(MemberVO vo, RedirectAttributes rttr) {
				log.info("==========================");
				log.info("updateInfo: " + vo);
				log.info("vo.getAttachImg "+vo.getAttachImg());
				 if (vo.getAttachImg() != null) {
				        vo.getAttachImg().forEach(attach -> log.info("attach Img : "+attach));
				        
				    }
					
					service.updateInfo(vo);
					rttr.addFlashAttribute("result",vo.getUserId());
					
					return "redirect:/mypage/myInfo?userId="+vo.getUserId();
				}	
	@GetMapping("/cart")
	public void Cart(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = ((MemberVO) session.getAttribute("member")).getUserId();
		List<CartVO> list = cartService.getList(userId);
		model.addAttribute("cartList", list);
	}
	
	@ResponseBody
	@PostMapping("/cart")
	public void addCart(CartVO vo) {
		log.info("addCart");
		cartService.addCart(vo); // cart db에 저장
	}

	@PostMapping(value = "/cartDelete/{cartNo}", produces = { MediaType.APPLICATION_JSON_VALUE })
	@ResponseBody
	public ResponseEntity<String> cartDelete(@PathVariable("cartNo") int cartNo) {
		log.info("cartDelete Ajax.... : " + cartNo);
		cartService.cartDelete(cartNo);
		return new ResponseEntity<>("sss", HttpStatus.OK);
	}

	// 구매확인
	@GetMapping("/confirmation")
	public void Confirmation(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String userId = ((MemberVO) session.getAttribute("member")).getUserId();
		List<PaymentItemVO> itemList = paymentItemService.getList(userId);
		List<PaymentVO> list = paymentService.getList(userId);
		model.addAttribute("confirmation", list);
	}

	@PostMapping("/purchase")
	public void Purchase(@RequestParam("selectItem") int[] selectItem, @RequestParam("sumPrice") int sumPrice,
			Model model) {
		List<CartVO> list = cartService.getListId(selectItem);
		model.addAttribute("itemList", list);
		model.addAttribute("sumPrice", sumPrice);
	}
	
	//상품페이지 구매버튼 클릭 시 이동되는 구매 페이지
	@GetMapping("/purchase")
	public void GetPurchase(Model model) {
		List<CartVO> list = new ArrayList<CartVO>();
		list.add(cartService.getLastItem());
		int sumPrice = list.get(0).getPrice();
		model.addAttribute("itemList", list);
		model.addAttribute("sumPrice", sumPrice);
	}

	@PostMapping("/purchaseCompleted")
	public String PurchaseCompleted(HttpServletRequest req, @RequestParam("itemIndex") int[] itemIndex,
			@RequestParam("recipient") String recipient, @RequestParam("phone") String phoneNo,
			@RequestParam("address") String address, @RequestParam("detailaddress") String detailaddress,
			@RequestParam("deliveryMemo") String Delmemo, @RequestParam("price") int price) {
		List<CartVO> cartList = cartService.getListId(itemIndex);
		List<PaymentItemVO> paymentItemList = new ArrayList<PaymentItemVO>();
		
		HttpSession session = req.getSession();
		String payNo = session.getId()+Integer.toString(cartList.get(0).getCartNo());
		String Images=cartList.get(0).getImage();
		
		PaymentVO payment = new PaymentVO();
		payment.setPayNo(payNo);
		payment.setUserId(((MemberVO) session.getAttribute("member")).getUserId());
		payment.setPrice(price);
		for(int i = 1; i<cartList.size();i++) {
			Images+="/"+cartList.get(i).getImage();
		}
		payment.setImages(Images);
		payment.setRecipient(recipient);
		payment.setPhone(phoneNo);
		payment.setAddress(address);
		payment.setDetailAddress(detailaddress);
		payment.setDeliveryMemo(Delmemo);
		
		for(CartVO cart:cartList) {
			PaymentItemVO item = new PaymentItemVO();
			item.setPayNo(payNo);
			item.setCategory(cart.getCategory());
			item.setImage(cart.getImage());
			item.setSize(cart.getSize());
			item.setColor(cart.getColor());
			item.setUserId(((MemberVO) session.getAttribute("member")).getUserId());
			paymentItemList.add(item);
			cartService.cartDelete(cart.getCartNo());
		}
		
		paymentService.insert(payment);
		paymentItemService.insertList(paymentItemList);
		
		return "redirect:/member/main";
	}
	 /* 회원 상세 */
		@GetMapping("/myInfo")
		public void memberDetail(@RequestParam("userId") String userId, Model model) {
			
			log.info("memberDetail()..........");
			model.addAttribute("member", service.getMemberInfo(userId));
			model.addAttribute("uuid",service.getUuid(userId));
			log.info(service.getUuid(userId));
		
		}
	   @GetMapping("/myFeed")
	   public void myfeed(Model model,@RequestParam("userId") String userId) {
	      log.info("------------개인 피드리스트 출력------------");
	      model.addAttribute("member", service.getMemberInfo(userId));
		      model.addAttribute("myfeed", feedService.getList());
	   }

}
