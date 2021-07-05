package kr.green.spring.controller;

import lombok.Data;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.green.spring.sevice.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
    @Autowired
    MemberService memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET) //원하는 URL 뒷부분을 만들어 준다.
	public ModelAndView home(ModelAndView mv) {
		mv.setViewName("home");
		mv.addObject("name","홍길동");
		System.out.println(memberService.getMember("12345678"));
		return mv;
	}
	@RequestMapping(value = "/signin", method = RequestMethod.GET) //원하는 URL 뒷부분을 만들어 준다.
	public ModelAndView singinGet(ModelAndView mv, UserVo user , @RequestParam("hobby") String[] hobby) {
		mv.setViewName("signin");
		System.out.println("id:"+user.getId());
		System.out.println("pw:"+user.getPw());
		for(String tmp: hobby) {
			System.out.println("취미:"+tmp);
		}
		return mv;
	}
	
}
@Data
class UserVo{
	private String id;
	private String pw;
}
