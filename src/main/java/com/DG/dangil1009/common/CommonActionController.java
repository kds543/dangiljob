package com.DG.dangil1009.common;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.sql.DriverManager;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSession;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;
import javax.print.attribute.HashPrintJobAttributeSet;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.RandomStringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class CommonActionController {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	KCommon comm = new KCommon();
	@RequestMapping(method = RequestMethod.POST, value = "/fileupload", produces = "application/text; charset=utf8")
    public @ResponseBody String uploadFile( MultipartHttpServletRequest multipartFile) throws Exception{
		String atchFileId = "";
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String , String>> resultdata = new ArrayList<Map<String,String>>();
		
		try{
			java.util.Calendar cal = java.util.Calendar.getInstance();
			int year = cal.get ( cal.YEAR);
			int month = cal.get ( cal.MONTH ) + 1 ;
			int date = cal.get ( cal.DATE ) ;
			//String root = multipartFile.getSession().getServletContext().getRealPath("/");
			String root = System.getProperty("catalina.base");
			File dir_year = new File(root+"/upload/" + year);
			if(!dir_year.exists()){ dir_year.mkdirs();	}
			
			File dir_month = new File(root+"/upload/" + year + "/" + month);
			if(!dir_month.exists()){ dir_month.mkdirs();	}
			
			File dir_date = new File(root+"/upload/" + year + "/" + month + "/" + date);
			if(!dir_date.exists()){ dir_date.mkdirs();	}
			String newFileName = "";
		//	Util util = new Util();	
			//atchFileId = util.getNextStringId();
		//	multipartFile.transferTo(new File("upload/"  + year + "/" + month + "/" + date +  "/" + multipartFile.getOriginalFilename()));
			
	        String path = root+"/upload/" + year + "/" + month + "/" + date;

			 Iterator<String> files = multipartFile.getFileNames();
			    while(files.hasNext()){
		            String uploadFile = files.next();
		            Map<String, String> map2 = new HashMap<String, String>();        
		            MultipartFile mFile = multipartFile.getFile(uploadFile);
		            String fileName = mFile.getOriginalFilename();
		            
		            System.out.println("실제 파일 이름 : " +fileName);
		            newFileName = System.currentTimeMillis()+"."
		                    +fileName.substring(fileName.lastIndexOf(".")+1);
		            
		           
		            try {
		                mFile.transferTo(new File(path +  "/"+newFileName));
		                map2.put("filename", fileName);
		                map2.put("fileurl",  year + "/" + month + "/" + date +  "/"+newFileName);
		                map2.put("filecode", newFileName);
		                resultdata.add(map2);
		            } catch (Exception e) {
		                e.printStackTrace();
		            }
		        }

			
		 }catch(Exception e){
	            System.out.println("fileSave Exception: "+e);
	     }finally{
		       
		 }
		
		
		if(resultdata.size() != 0) {
			map.put("rows", resultdata);
			map.put("success", true);
		}else
		{
			map.put("success", false);
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		String result = ""; 
		try {
			result = mapper.writeValueAsString(map);
			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		 
		return result;
		//return atchFileId;
    }
	
	
	
	@RequestMapping(value = "/action/getLog" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getLog(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getLog", param);
	}
	
	@RequestMapping(value = "/action/addMember" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String addMember(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		int resultdata = sqlSession.insert(KCommon.commonNamespace+"addMember" , param);
		if(resultdata != 0) {
			map.put("rows", resultdata);
			map.put("success", true);
			map.put("seq", param.get("seq"));
		}else
		{
			map.put("success", false);
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		String result = ""; 
		try {
			result = mapper.writeValueAsString(map);
			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return result;
	
	}
	
	@RequestMapping(value = "/action/checkid" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String checkid(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectOne(sqlSession, KCommon.commonNamespace+"checkid", param);
	}
	
	
	@RequestMapping(value = "/login/login" , method = RequestMethod.POST)
	@ResponseBody
	public String login(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String , String> resultdata = sqlSession.selectOne(KCommon.commonNamespace+"Login",param);
		if(resultdata != null && resultdata.get("result") != "") {
			session.setAttribute("dangil1009userLoginInfo", resultdata);
			map.put("rows", resultdata);
			map.put("success", true);
		}else
		{
			map.put("success", false);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String result = ""; 
		try {
			result = mapper.writeValueAsString(map);
			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return result;
	}
	
	@RequestMapping(value = "/getCodeList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getCodeList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String , String>> resultdata = sqlSession.selectList(KCommon.commonNamespace+"getCodeList",param);
		if(resultdata.size() != 0) {
			map.put("rows", resultdata);
			map.put("success", true);
		}else
		{
			map.put("success", false);
		}
		
		
		ObjectMapper mapper = new ObjectMapper();
		String result = ""; 
		try {
			result = mapper.writeValueAsString(map);
			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	return result;
	}
	
	//config
	@RequestMapping(value = "/login/logout" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String logout(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		Map<String, Object> map = new HashMap<String, Object>();
		session.setAttribute("dangil1009userLoginInfo", null);
		map.put("success", true);
	
	ObjectMapper mapper = new ObjectMapper();
	String result = ""; 
	try {
		result = mapper.writeValueAsString(map);
		
	} catch (JsonProcessingException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
return result;
	}
	@RequestMapping(value = "/action/deviceTokenCheck" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String deviceTokenCheck(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectOne(sqlSession, KCommon.commonNamespace+"deviceTokenCheck", param);
	}
	@RequestMapping(value = "/action/deviceTokenUpdate" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String deviceTokenUpdate(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"deviceTokenUpdate", param);
	}
	@RequestMapping(value = "/action/listLoad" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String listLoad(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"listLoad", param);
	}
	
	@RequestMapping(value = "/action/jobloadlist" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String jobloadlist(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"jobloadlist", param);
	}
	
	@RequestMapping(value = "/action/getJoblist" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getJoblist(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getJoblist", param);
	}
	
	@RequestMapping(value = "/action/getUserJoblist" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getUserJoblist(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getUserJoblist", param);
	}
	
	
	@RequestMapping(value = "/action/getUserJobloglist" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getUserJobloglist(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getUserJobloglist", param);
	}
	
	@RequestMapping(value = "/action/updateJob" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateJob(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updateJob", param);
	}
	
	
	
	@RequestMapping(value = "/action/getJobloglist" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getJobloglist(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getJobloglist", param);
	}
	
	@RequestMapping(value = "/action/getTypelist" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getTypelist(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getTypelist", param);
	}
	
	@RequestMapping(value = "/action/addTypes" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String addTypes(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KInsert(sqlSession, KCommon.commonNamespace+"addTypes", param);
	}
	
	@RequestMapping(value = "/action/addJob" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String addJob(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		param.put("seq", param.get("target_user_seq"));
		Map<String , String> resultdata = sqlSession.selectOne(KCommon.commonNamespace+"getMyinfo",param);
		try {
			if(resultdata.get("token") != null && !resultdata.get("token").isEmpty()) {
				comm.sendNotification("알림.","작업요청이 도착하였습니다.", "token", resultdata.get("token"));	
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comm.KInsert(sqlSession, KCommon.commonNamespace+"addJob", param);
	}
	
	@RequestMapping(value = "/action/cancelJob" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String cancelJob(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		param.put("seq", param.get("target_user_seq"));
		Map<String , String> resultdata = sqlSession.selectOne(KCommon.commonNamespace+"getMyinfo",param);
		try {
			if(resultdata.get("token") != null && !resultdata.get("token").isEmpty()) {
				comm.sendNotification("알림.","작업요청이 취소되었습니다.", "token", resultdata.get("token"));	
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return comm.KDelete(sqlSession, KCommon.commonNamespace+"cancelJob", param);
	}
	
	@RequestMapping(value = "/action/idSearch" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idSearch(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		String dump = "";
		Map<String , String> dumpdata = comm.KselectOneData(sqlSession, KCommon.commonNamespace+"idSearch", param);
		dump = comm.KselectOne(sqlSession, KCommon.commonNamespace+"idSearch", param);
		if(dumpdata.size() != 0) {
			comm.sendEmail("아이디찾기 안내 메일입니다.", "고객님의 아이디는 : "+String.valueOf(dumpdata.get("user_id"))+" 입니다.", String.valueOf(dumpdata.get("email")));
		}
		return dump;
	}
	
	@RequestMapping(value = "/action/pwdSearch" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String pwdSearch(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		String dump = "";
		Map<String , String> dumpdata = comm.KselectOneData(sqlSession, KCommon.commonNamespace+"pwdSearch", param);
		dump = comm.KselectOne(sqlSession, KCommon.commonNamespace+"pwdSearch", param);
		if(dumpdata.size() != 0) {
			param.put("seq", dumpdata.get("seq"));
			String key = RandomStringUtils.randomNumeric(10);
			param.put("pwd", key);
			comm.KUpdate(sqlSession, KCommon.commonNamespace+"pwdinit", param);
			comm.sendEmail("비밀번호 안내 메일입니다.", "고객님의 비밀번호는 초기화되었습니다. 초기화된 비밀번호는 : "+key+" 입니다.", String.valueOf(dumpdata.get("email")));
		}
		return dump;
	}
	
	@RequestMapping(value = "/action/getMyinfo" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getMyinfo(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectOne(sqlSession, KCommon.commonNamespace+"getMyinfo", param);
	}
	
	@RequestMapping(value = "/action/updateType" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateType(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		String returndata = comm.KDelete(sqlSession, KCommon.commonNamespace+"deleteType", param);
		String[] typedata = param.get("type").toString().split(",");
		for(int i = 0 ; i < typedata.length; i++) {
			param.put("code", typedata[i]);
			comm.KUpdate(sqlSession, KCommon.commonNamespace+"addTypes", param);
		}
		return returndata;
	}
	
	@RequestMapping(value = "/action/updateTypeSub" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateTypeSub(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		String returndata = comm.KDelete(sqlSession, KCommon.commonNamespace+"deleteTypeSub", param);
		String[] typedata = param.get("type").toString().split(",");
		for(int i = 0 ; i < typedata.length; i++) {
			param.put("job_type_sub", typedata[i]);
			comm.KUpdate(sqlSession, KCommon.commonNamespace+"addTypesSub", param);
		}
		return returndata;
	}
	
	
	
	@RequestMapping(value = "/action/updateAddress" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateAddress(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updateAddress", param);
	}
	
	@RequestMapping(value = "/action/updateLocation" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateLocation(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updateLocation", param);
	}
	
	@RequestMapping(value = "/action/updateContetns" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateContetns(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updateContetns", param);
	}
	
	@RequestMapping(value = "/action/updatelogoImg" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updatelogoImg(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updatelogoImg", param);
	}
	
	@RequestMapping(value = "/action/memberOut" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String memberOut(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		session.setAttribute("dangil1009userLoginInfo", null);
		comm.KDelete(sqlSession, KCommon.commonNamespace+"deleteType", param);
		return comm.KDelete(sqlSession, KCommon.commonNamespace+"memberOut", param);
	}
	
	@RequestMapping(value = "/action/updatelogStar" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updatelogStar(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updatelogStar", param);
	}
	
	@RequestMapping(value = "/action/updateMyjob" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateMyjob(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updateMyjob", param);
	}
	
	@RequestMapping(value = "/action/saveCal" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String saveCal(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KInsert(sqlSession, KCommon.commonNamespace+"saveCal", param);
	}
	
	@RequestMapping(value = "/action/calJobList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String calJobList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"calJobList", param);
	}
	
	@RequestMapping(value = "/action/setJobList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String setJobList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"setJobList", param);
	}
	
	@RequestMapping(value = "/action/caltjList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String caltjList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"caltjList", param);
	}
	
	@RequestMapping(value = "/action/settjList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String settjList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"settjList", param);
	}
	
	@RequestMapping(value = "/action/calLoadList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String calLoadList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"calLoadList", param);
	}
	
	@RequestMapping(value = "/action/setCalLoadList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String setCalLoadList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"setCalLoadList", param);
	}
	
	@RequestMapping(value = "/action/updateCal" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateCal(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updateCal", param);
	}	
	
	@RequestMapping(value = "/action/deleteCal" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String deleteCal(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KDelete(sqlSession, KCommon.commonNamespace+"deleteCal", param);
	}
	
	@RequestMapping(value = "/action/addBoard" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String addBoard(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KInsert(sqlSession, KCommon.commonNamespace+"addBoard", param);
	}
	
	@RequestMapping(value = "/action/getBoardList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBoardList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getBoardList", param);
	}
	
	@RequestMapping(value = "/action/getBoardView" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getBoardView(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getBoardView", param);
	}
	
	@RequestMapping(value = "/action/updateBoard" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateBoard(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updateBoard", param);
	}	
	
	@RequestMapping(value = "/action/saveCom" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String saveCom(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KInsert(sqlSession, KCommon.commonNamespace+"saveCom", param);
	}
	
	@RequestMapping(value = "/action/getCommentList" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getCommentList(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getCommentList", param);
	}
	
	@RequestMapping(value = "/action/saveReCom" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String saveReCom(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KInsert(sqlSession, KCommon.commonNamespace+"saveReCom", param);
	}
	
	@RequestMapping(value = "/action/updateComment" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updateComment(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updateComment", param);
	}	
	
	@RequestMapping(value = "/action/getKeyward" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getKeyward(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+"getKeyward", param);
	}
	
	@RequestMapping(value = "/actionone/{actionname}" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String actionone(@PathVariable("actionname") String actionname ,@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectOne(sqlSession, KCommon.commonNamespace+actionname, param);
	}
	
	@RequestMapping(value = "/actionlist/{actionname}" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String actionlist(@PathVariable("actionname") String actionname ,@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KselectList(sqlSession, KCommon.commonNamespace+actionname, param);
	}
	@RequestMapping(value = "/actionupdate/{actionname}" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String actionupdate(@PathVariable("actionname") String actionname ,@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+actionname, param);
	}
	
	@RequestMapping(value = "/actioninsert/{actionname}" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String actioninsert(@PathVariable("actionname") String actionname ,@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KInsert(sqlSession, KCommon.commonNamespace+actionname, param);
	}
	
	
	
	@RequestMapping(value = "/action/updatelogUserStar" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String updatelogUserStar(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		return comm.KUpdate(sqlSession, KCommon.commonNamespace+"updatelogUserStar", param);
	}
	
	@RequestMapping(value = "/action/sendNotification" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String sendNotification(@RequestParam Map<String , Object> param , HttpSession session) throws ParseException{
		param.put("seq", param.get("seq"));
		Map<String , String> resultdata = sqlSession.selectOne(KCommon.commonNamespace+"getMyinfo",param);
		int resultcode = 0;
		try {
			if(resultdata.get("token") != null && !resultdata.get("token").isEmpty()) {
				resultcode = comm.sendNotification(param.get("title").toString(),param.get("contents").toString(), "token", resultdata.get("token"));	
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			Map<String, Object> map = new HashMap<String, Object>();
			if(resultcode != 0) {
				map.put("success", true);
			}else
			{
				map.put("success", false);
			}
			
			
			ObjectMapper mapper = new ObjectMapper();
			String result = ""; 
			try {
				result = mapper.writeValueAsString(map);
				
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return result;
	}
	
	
	
	
}
