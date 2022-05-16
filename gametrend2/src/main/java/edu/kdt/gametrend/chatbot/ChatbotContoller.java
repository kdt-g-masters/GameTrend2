package edu.kdt.gametrend.chatbot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ChatbotContoller {
	@Autowired
	@Qualifier("chatbotservice")
	ChatbotService service;
	
	@RequestMapping("/chatbottest")
	public String chatbottest() {
		return "chatbottest";
	}
	
	@RequestMapping("/chatbot")
	@ResponseBody
	public String chatbotajax2(String request, String event) {
		System.out.println(event);
		
		String response = "";
		if(event.equals("입력")) {
			response = service.test(request);
		}
		else if(event.equals("대화시작")) {
			response = service.test(request, "open");
		}
		System.out.println("==> " + response);
		
		return response;
	}
	
	@RequestMapping("/kindgenre")
	@ResponseBody
	public String kindgenre(String genre) {
		String menu [] = {"컴비네이션피자","고구마피자","파인애플피자"};
		int price[] = {10000, 12000, 15000};
		int pay = 0;
		for(int i = 0; i < menu.length; i++) {
			if(menu[i].equals(kind)) {
				if(size.equals("L")) pay = price[i] + 5000;
				else if(size.equals("M")) pay = price[i] + 2500;
				else if(size.equals("S")) pay = price[i];
			} 
		}
		System.out.println("총 "+ pay+ "원을 지불하셔야 합니다. " + phoneNum +  "로 안내드립니다.");
		return "총 "+ pay + "원을 지불하셔야 합니다. " + phoneNum +  "로 안내드립니다.";
		
	}
	
	
}
