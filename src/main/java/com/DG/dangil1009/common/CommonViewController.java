package com.DG.dangil1009.common;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class CommonViewController {
	private static final Logger logger = LoggerFactory.getLogger(CommonViewController.class);
	KCommon kcomm = new KCommon();
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "index" , session,"","home","menu_0_2",false);
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "login" , session,"","home","menu_0_2",true);
	}
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "map" , session,"","map","menu_0_2",false);
	}
	
	@RequestMapping(value = "/regform", method = RequestMethod.GET)
	public ModelAndView regform(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "regform" , session,"","menu_4","menu_0_2",false);
		//return "manager_login";
	}
	
	@RequestMapping(value = "/regformType1", method = RequestMethod.GET)
	public ModelAndView regformType1(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "regformType1" , session,"","menu_4","menu_0_2",false);
		//return "manager_login";
	}
	
	@RequestMapping(value = "/regformType2", method = RequestMethod.GET)
	public ModelAndView regformType2(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "regformType2" , session,"","menu_4","menu_0_2",false);
		//return "manager_login";
	}
	
	@RequestMapping(value = "/view/myinfo", method = RequestMethod.GET)
	public ModelAndView myinfo(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "myinfo" , session,"","myinfo","나의 정보",true);
		//return "manager_login";
	}
	
	@RequestMapping(value = "/app-ads.txt", method = RequestMethod.GET)
	public @ResponseBody String getText() {
	    return "google.com, pub-5618416997498093, DIRECT, f088c47fec942fa0";
	}
	
	@RequestMapping(value = "/view/viewLog", method = RequestMethod.GET)
	public ModelAndView viewLog(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		mav.setViewName("view_log");
		return mav;
	}
	
	
	@RequestMapping(value = "/view/joblist", method = RequestMethod.GET)
	public ModelAndView joblist(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "joblist" , session,"","joblist","menu_1",false);
	}
	
	@RequestMapping(value = "/view/main/{viewname}", method = RequestMethod.GET)
	public ModelAndView viewname(@PathVariable("viewname") String viewname ,ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , viewname , session,"","menu_1","menu_1",true);
	}
	
	
	@RequestMapping(value = "/view/idSearch", method = RequestMethod.GET)
	public ModelAndView idSearch(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "idSearch" , session,"","menu_1","menu_1",false);
	}
	
	@RequestMapping(value = "/view/pwdSearch", method = RequestMethod.GET)
	public ModelAndView pwdSearch(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "pwdSearch" , session,"","menu_1","menu_1",false);
	}
	
	@RequestMapping(value = "/view/myjobmanager", method = RequestMethod.GET)
	public ModelAndView myjobmanager(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		Map<String, String> dump = (Map<String, String>) session.getAttribute("dangil1009userLoginInfo");
		if(dump != null) {
			if(dump.get("type").equals("A02")) {
				return kcomm.mavReturn(mav , "userview/myjobmanager" , session,"","menu_1","나의 배정",true);
			}else {
				return kcomm.mavReturn(mav , "myjobmanager" , session,"","menu_1","나의 배정",true);
			}	
		}else {
			return kcomm.mavReturn(mav , "myjobmanager" , session,"","menu_1","나의 배정",true);
		}
	}
	@RequestMapping(value = "/view/my_profile", method = RequestMethod.GET)
	public ModelAndView my_profile(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "my_profile" , session,"","my_profile","프로필 정보 수정",true);
	}
	
	@RequestMapping(value = "/view/detail_write/{seq}", method = RequestMethod.GET)
	public ModelAndView detail_write(@PathVariable("seq") String seq ,ModelAndView mav,Locale locale, Model model , HttpSession session) {
		mav.addObject("c_seq",seq);
		return kcomm.mavReturn(mav , "detail_write" , session,"","detail_write","구인정보 등록",true);
	}
	@RequestMapping(value = "/view/detail/{seq}", method = RequestMethod.GET)
	public ModelAndView detail(@PathVariable("seq") String seq ,ModelAndView mav,Locale locale, Model model , HttpSession session) {
		mav.addObject("c_seq",seq);
		return kcomm.mavReturn(mav , "detail" , session,"","detail","상세정보",false);
	}
	
	@RequestMapping(value = "/view/my_profile_detail", method = RequestMethod.GET)
	public ModelAndView my_profile_detail(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "my_profile_detail" , session,"","my_profile_detail","my_profile_detail",true);
	}
	@RequestMapping(value = "/view/myjob", method = RequestMethod.GET)
	public ModelAndView myjob(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "myjob" , session,"","myjob","myjob",true);
	}
	@RequestMapping(value = "/view/myorder", method = RequestMethod.GET)
	public ModelAndView myorder(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "myorder" , session,"","myjob","myjob",true);
	}
	@RequestMapping(value = "/view/user/myjobmanager", method = RequestMethod.GET)
	public ModelAndView usermyjobmanager(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "userview/myjobmanager" , session,"","menu_1","menu_1",true);
	}
	
	@RequestMapping(value = "/view/notice_detailU/{seq}", method = RequestMethod.GET)
	public ModelAndView notice_detailU(ModelAndView mav,@PathVariable("seq") String seq , Locale locale, Model model , HttpSession session) {
		mav.addObject("c_seq",seq);
		return kcomm.mavReturn(mav , "notice_detail_user" , session,"공지사항","menu_4","",false);
	}
	
	@RequestMapping(value = "/view/userdetail/{seq}", method = RequestMethod.GET)
	public ModelAndView userdetail(ModelAndView mav,@PathVariable("seq") String seq , Locale locale, Model model , HttpSession session) {
		mav.addObject("c_seq",seq);
		return kcomm.mavReturn(mav , "userdetail" , session,"공지사항","menu_82","",false);
	}
	
	
	@RequestMapping(value = "/view/userview/userdetail/{seq}", method = RequestMethod.GET)
	public ModelAndView Uuserdetail(ModelAndView mav,@PathVariable("seq") String seq , Locale locale, Model model , HttpSession session) {
		mav.addObject("c_seq",seq);
		return kcomm.mavReturn(mav , "userview/userdetail" , session,"공지사항","menu_82","",false);
	}
	
	@RequestMapping(value = "/404", method = RequestMethod.GET)
	public ModelAndView err4(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		
			mav.setViewName("404");
			return mav;
		//return "manager_login";
	}
	@RequestMapping(value = "/view/calendar", method = RequestMethod.GET)
	public ModelAndView mycalendar(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "calendar" , session,"","calendar","calendar",true);
	}
	@RequestMapping(value = "/view/callist", method = RequestMethod.GET)
	public ModelAndView callist(ModelAndView mav,Locale locale, Model model , HttpSession session) {
		return kcomm.mavReturn(mav , "callist" , session,"","callist","callist",true);
	}
	
}
