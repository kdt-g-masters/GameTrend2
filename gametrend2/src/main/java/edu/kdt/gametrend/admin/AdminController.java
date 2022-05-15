package edu.kdt.gametrend.admin;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import edu.kdt.gametrend.game.GameDTO;
import edu.kdt.gametrend.promotion.PromotionDTO;

@Controller
public class AdminController {

	@Autowired
	@Qualifier("adminservice")
	AdminService service;
	
	// 관리자 로그인
	@RequestMapping(value="/admin")
	public String adminLogin() {
		return "adminLogin";
	}
	
	// 관리자 로그인 시도
	@RequestMapping(value="/adminLogin", method=RequestMethod.POST, produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public String adminLogin(HttpServletRequest request, AdminDTO dto) throws Exception {
		AdminDTO admin = service.loginAdmin(dto);
		
		if(admin != null && admin.getId() != null) {
			// 세션
			HttpSession session = request.getSession();
			
			// 관리자 로그인 상태로 설정
			session.setAttribute("isAdmin", true);
			
			// 관리자 정보 세션에 저장
			session.setAttribute("admin", admin);
				
			return "1";	
		}
		else {
			return "2";	
		}
	}
	
	@RequestMapping(value="/adminPage")
	public ModelAndView adminPage(int page) {
		int[] limit = new int[2];
		limit[0] = (page - 1) * 5;
		limit[1] = 5;
		ModelAndView mv = new ModelAndView();
		List<GameDTO> list = service.selectGameList(limit);
		mv.addObject("gameList", list);
		mv.setViewName("admin");
		return mv;
	}
	
	// 게임 추가
	@RequestMapping(value="/addGame", method=RequestMethod.POST)
	public String addGame(GameDTO dto, MultipartFile image, HttpServletRequest request) throws IOException {
		
		// 파일 저장 경로
		String resourceSrc = request.getServletContext().getRealPath("");
		// resourceSrc: GameTrend2\gametrend2\src\main\webapp\
		String savePath = resourceSrc.substring(0, resourceSrc.lastIndexOf("webapp")) + "resources\\static\\images\\thumbnail";
		System.out.println(savePath);
		
		// 가장 최근 추가된 게임 항목 가져오기
		int[] limit = new int[2];
		limit[0] = 0;
		limit[1] = 1;
		List<GameDTO> list = service.selectGameList(limit);
		
		
		if (!image.isEmpty()) {
			// 파일 이름
			String originName = image.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = list.get(0).getNo()+1 + ext;
			
			// 파일 저장
			File serverfile = new File(savePath, fileName);
			image.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setThumbnail(fileName);
			dto.setNo(list.get(0).getNo()+1);
		}
		else {
			dto.setThumbnail(null);
		}
		
		service.insertGame(dto);
		
		return "redirect:/adminPage?page=1";
	}
	
	// 게임 삭제
	@RequestMapping(value="/deleteGame")
	public String deleteGame(int no) {
		int row = service.deleteGame(no);
		return "redirect:/adminPage?page=1";
	}
	
	// 게임 수정 페이지
	@RequestMapping(value="/updateGame")
	public ModelAndView updateGameForm(int no) {
		ModelAndView mv = new ModelAndView();
		GameDTO dto = service.selectGame(no);
		mv.addObject("gameDTO", dto);
		mv.setViewName("adminEditGame");
		return mv;
	}
	
	// 게임 수정 완료
	@RequestMapping(value="/updateGame", method=RequestMethod.POST)
	public String updateGame(GameDTO dto, MultipartFile mfThumbnail, HttpServletRequest request) throws IOException {
		
		// 스크린샷 저장
		
		// 파일 저장 경로
		String resourceSrc = request.getServletContext().getRealPath("");
		// resourceSrc: GameTrend2\gametrend2\src\main\webapp\
		String savePathThumbnail = resourceSrc.substring(0, resourceSrc.lastIndexOf("webapp")) + "resources\\static\\images\\thumbnail";
		String savePathScreenshot = resourceSrc.substring(0, resourceSrc.lastIndexOf("webapp")) + "resources\\static\\images\\screenshot";	
		
		MultipartFile screenshot1 = dto.getFile1();
		MultipartFile screenshot2 = dto.getFile2();
		MultipartFile screenshot3 = dto.getFile3();
		MultipartFile screenshot4 = dto.getFile4();
		
		if (!mfThumbnail.isEmpty()) {
			// 파일 이름
			String originName = mfThumbnail.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getNo() + ext;
			
			// 파일 저장
			File serverfile = new File(savePathThumbnail, fileName);
			mfThumbnail.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setThumbnail(fileName);
		}
		else {
			dto.setThumbnail(service.selectGame(dto.getNo()).getThumbnail()); 
		}
		
		if (!screenshot1.isEmpty()) {
			// 파일 이름
			String originName = screenshot1.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getNo() + "_1" + ext;
			
			// 파일 저장
			File serverfile = new File(savePathScreenshot, fileName);
			screenshot1.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setScreenshot1(fileName);
		}
		else {
			dto.setScreenshot1(null);
		}
		
		if (!screenshot2.isEmpty()) {
			// 파일 이름
			String originName = screenshot2.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getNo() + "_2" + ext;
			
			// 파일 저장
			File serverfile = new File(savePathScreenshot, fileName);
			screenshot2.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setScreenshot2(fileName);
		}
		else {
			dto.setScreenshot2(null);
		}
		
		if (!screenshot3.isEmpty()) {
			// 파일 이름
			String originName = screenshot3.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getNo() + "_3" + ext;
			
			// 파일 저장
			File serverfile = new File(savePathScreenshot, fileName);
			screenshot3.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setScreenshot3(fileName);
		}
		else {
			dto.setScreenshot3(null);
		}
		
		if (!screenshot4.isEmpty()) {
			// 파일 이름
			String originName = screenshot4.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getNo() + "_4" + ext;
			
			// 파일 저장
			File serverfile = new File(savePathScreenshot, fileName);
			screenshot4.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setScreenshot4(fileName);
		}
		else {
			dto.setScreenshot4(null);
		}
		
		int row = service.updateGame(dto);
		return "redirect:/adminPage?page=1";
	}
	
	// 프로모션 설정 페이지
	@RequestMapping(value="/adminPromotion")
	public ModelAndView adminPromotion() {
		ModelAndView mv = new ModelAndView();
		List<PromotionDTO> list = service.selectPromotionList();
		mv.addObject("promotionList", list);
		mv.setViewName("adminPromotion");
		return mv;
	}
	
	// 프로모션 추가
	@RequestMapping(value="/addPromotion", method=RequestMethod.POST)
	public String addPromotion(PromotionDTO dto, HttpServletRequest request) throws IOException {
		
		// 파일 저장 경로
		String resourceSrc = request.getServletContext().getRealPath("");
		// resourceSrc: GameTrend2\gametrend2\src\main\webapp\
		String savePath = resourceSrc.substring(0, resourceSrc.lastIndexOf("webapp")) + "resources\\static\\images\\jm";
		
		MultipartFile mainImage = dto.getFile1();
		MultipartFile image = dto.getFile2();
		
		if (!mainImage.isEmpty()) {
			// 파일 이름
			String originName = mainImage.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getPlatform() + "_Event" + ext;
			
			// 파일 저장
			File serverfile = new File(savePath, fileName);
			mainImage.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setMainImage(fileName);			
		}
		
		if (!image.isEmpty()) {
			// 파일 이름
			String originName = image.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getPlatform() + "_EventList" + ext;
			
			// 파일 저장
			File serverfile = new File(savePath, fileName);
			image.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setImage(fileName);			
		}
		
		service.insertPromotion(dto);
		
		return "redirect:/adminPromotion";
	}
	
	// 프로모션 삭제
	@RequestMapping(value="/deletePromotion")
	public String deletePromotion(String platform) {
		int row = service.deletePromotion(platform);
		return "redirect:/adminPromotion";
	}
	
	// 게임 수정 페이지
	@RequestMapping(value="/updatePromotion")
	public ModelAndView updatePromotionForm(String platform) {
		ModelAndView mv = new ModelAndView();
		PromotionDTO dto = service.selectPromotion(platform);
		mv.addObject("promotionDTO", dto);
		mv.setViewName("adminEditPromotion");
		return mv;
	}
	
	// 프로모션 수정 완료
	@RequestMapping(value="/updatePromotion", method=RequestMethod.POST)
	public String updatePromotion(PromotionDTO dto, HttpServletRequest request) throws IOException {
		
		// 파일 저장 경로
		String resourceSrc = request.getServletContext().getRealPath("");
		// resourceSrc: GameTrend2\gametrend2\src\main\webapp\
		String savePath = resourceSrc.substring(0, resourceSrc.lastIndexOf("webapp")) + "resources\\static\\images\\jm";
		
		MultipartFile mainImage = dto.getFile1();
		MultipartFile image = dto.getFile2();
		
		if (!mainImage.isEmpty()) {
			// 파일 이름
			String originName = mainImage.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getPlatform() + "_Event" + ext;
			
			// 파일 저장
			File serverfile = new File(savePath, fileName);
			mainImage.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setMainImage(fileName);
		}
		else {
			dto.setMainImage(service.selectPromotion(dto.getPlatform()).getMainImage()); 
		}
		
		if (!image.isEmpty()) {
			// 파일 이름
			String originName = image.getOriginalFilename();			
			String ext = originName.substring(originName.indexOf("."));
			String fileName = dto.getPlatform() + "_EventList" + ext;
			
			// 파일 저장
			File serverfile = new File(savePath, fileName);
			image.transferTo(serverfile);
			
			// dto에 파일 정보 설정
			dto.setImage(fileName);
		}
		else {
			dto.setImage(service.selectPromotion(dto.getPlatform()).getImage());
		}
		
		int row = service.updatePromotion(dto);
		return "redirect:/adminPromotion";
	}
}
