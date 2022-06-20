package com.DG.dangil1009.common;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


public class KCommon {
	public static String projectcode  = "dangil1009";
	public static String commonNamespace = "com.DG.dangil1009.commonMapper.";
	public static String managerNamespace = "com.DG.dangil1009.managerMapper.";
	public static String empNamespace = "com.DG.dangil1009.empMapper.";
	private String fromEmail = "dangil1009@naver.com";
	private String fromEmailpassword = "@p1168213@p";
	private String hostName = "smtp.naver.com";
	public int sendNotification(String title , String body , String type , String token ) throws IOException {
		// Creates the Client using the default settings location, which is System.getProperty("user.home") + "/.fcmjava/fcmjava.properties":
    	final String apiKey = "AAAA2SJmpp8:APA91bH4TOS8VMjn4cdXGC1ZP_q7ptndvzfi8BdSmiL3PwZY-ya4kfOPGpIZB18AGzbqdckrqilYlqgoWms7rHsFaG83XUEE6v7PGciLuRZbEvOE75kfKnZxtIzPkf21bufnR2S6eRzu";
		URL url = new URL("https://fcm.googleapis.com/fcm/send");
		int responseCode = 0;
		if(type.equals("token")) {
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "key="+apiKey);
			
			conn.setDoOutput(true);
			
				try {
					String tokeninput = "{\"notification\" : {\"title\" : \""+title+"\", \"body\" : \""+body+"\"}, \"to\":\""+token+"\"}";
					OutputStream os = conn.getOutputStream();
				    os.write(tokeninput.getBytes("UTF-8"));
				    os.flush();
				    os.close();
				}catch(Error e) {
					
				}
					
			
				
			
		        
		    responseCode = conn.getResponseCode();
		    
		}else if(type.equals("topic")) {
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");
			conn.setRequestProperty("Authorization", "key="+apiKey);
			
			conn.setDoOutput(true);
			
			String userId = "";
			String input = "{\"notification\" : {\"title\" : \""+title+" \", \"body\" : \""+body+"\"}, \"to\":\"/topics/"+token+"\"}";
		    OutputStream os = conn.getOutputStream();
		    os.write(input.getBytes("UTF-8"));
		    os.flush();
		    os.close();
		    responseCode = conn.getResponseCode();
		}
	
        
      
        return responseCode;
		
        
        
	}
	
	public void sendEmail(String title , String body , String sendEmailAddress){
		Properties prop = new Properties();
		prop.put("mail.smtp.host", hostName);
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", hostName);
		prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, fromEmailpassword);
            }
        });
		
		
		try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            //수신자메일주소
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(sendEmailAddress)); 
            // Subject
            message.setSubject(title); //메일 제목을 입력
            // Text
            message.setText(body);    //메일 내용을 입력
            // send the message
            Transport.send(message); ////전송
            System.out.println("message sent successfully...");
        } catch (AddressException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MessagingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

/*
		SimpleEmail email = new SimpleEmail();
		email.setCharset("euc-kr");
		try {
			email.addTo(sendEmailAddress);
			email.setHostName(hostName);
			email.setAuthenticator(new DefaultAuthenticator(fromEmail, fromEmailpassword));
			email.setFrom(fromEmail);
			email.setSubject(title);
			email.setContent(body, "text/plain; charset=euc-kr");
			email.send();
		} catch (EmailException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
				
	}
	
	public List<Map<String , String>> getToken(SqlSessionTemplate sqlSession ,Map<String, Object> param){
		return sqlSession.selectList(commonNamespace+"getToken", param);
	}
	
	
	public String KselectList(SqlSessionTemplate sqlSession ,String url , Map<String , Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String , String>> resultdata = sqlSession.selectList(url , param);
		if(resultdata != null) {
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
	public List<Map<String , String>> KselectOneListData(SqlSessionTemplate sqlSession ,String url , Map<String , Object> param) {
		return sqlSession.selectList(url, param);
	}
	public Map<String , String> KselectOneData(SqlSessionTemplate sqlSession ,String url , Map<String , Object> param) {
		Map<String , String> resultdata = sqlSession.selectOne(url , param);
		return resultdata;
	}
	
	public Map<String , Object> KselectOneObject(SqlSessionTemplate sqlSession ,String url , Map<String , Object> param) {
		Map<String , Object> resultdata = sqlSession.selectOne(url , param);
		return resultdata;
	}
	
	 
	
	public String KselectOne(SqlSessionTemplate sqlSession ,String url , Map<String , Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String , String> resultdata = sqlSession.selectOne(url , param);
		if(resultdata != null) {
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
	
	public String KUpdate(SqlSessionTemplate sqlSession ,String url , Map<String , Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		int resultdata = sqlSession.update(url , param);
		if(resultdata != 0) {
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
	
	public String KInsert(SqlSessionTemplate sqlSession ,String url , Map<String , Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		int resultdata = sqlSession.insert(url , param);
		if(resultdata != 0) {
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
	
	public String KDelete(SqlSessionTemplate sqlSession ,String url , Map<String , Object> param) {
		Map<String, Object> map = new HashMap<String, Object>();
		int resultdata = sqlSession.delete(url , param);
		if(resultdata != 0) {
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
	
	public void setPoint(SqlSessionTemplate sqlSession ,int r_point , String r_user_id , String r_insert_id , String contents , String key_seq , String type) {
		Map<String , Object> param = new HashMap<>();
		if(r_user_id != null)param.put("user_id", r_user_id);
		if(contents != null)param.put("contents", contents);
		if(r_insert_id != null)param.put("insert_id", r_insert_id);
		param.put("point", r_point);
		if(key_seq != null)param.put("key_seq", key_seq);
		if(type != null)param.put("type", type);
		Map<String , Object> pointdata = KselectOneObject(sqlSession, KCommon.commonNamespace+"pointHistoryLast", param);
		if(pointdata == null) {
			pointdata = new HashMap<>();
			pointdata.put("last_point", 0);
		}
		
		if(r_point > 0) {
			param.put("last_point", (int)pointdata.get("last_point")+r_point);	
		}else {
			param.put("last_point", (int)pointdata.get("last_point")-r_point);
		}
		
		KInsert(sqlSession, KCommon.commonNamespace+"insertPoint", param);
		KUpdate(sqlSession, KCommon.commonNamespace+"memberSetPoint", param);
		
	}
	
	
	public void setScore(SqlSessionTemplate sqlSession ,int r_point , String r_user_id , String r_insert_id , String contents , String key_seq , String type) {
		Map<String , Object> param = new HashMap<>();
		if(r_user_id != null)param.put("user_id", r_user_id);
		if(contents != null)param.put("contents", contents);
		if(r_insert_id != null)param.put("insert_id", r_insert_id);
		//등급에 따라 포인트 가산 필요
		param.put("score", r_point);
		if(key_seq != null)param.put("key_seq", key_seq);
		if(type != null)param.put("type", type);
		Map<String , Object> pointdata = KselectOneObject(sqlSession, KCommon.commonNamespace+"scoreHistoryLast", param);
		if(pointdata == null) {
			pointdata = new HashMap<>();
			pointdata.put("last_score", 0);
		}
		
		
		if(r_point > 0) {
			param.put("last_score", (int)pointdata.get("last_score")+r_point);	
		}else {
			param.put("last_score", (int)pointdata.get("last_score")-r_point);
		}
		
		if((int)pointdata.get("last_score") > 2000) {
			param.put("rating", 3);
		}else if((int)pointdata.get("last_score") > 1000) {
			param.put("rating", 2);
		}else {
			param.put("rating", 1);
		}
		
		
		KInsert(sqlSession, KCommon.commonNamespace+"insertScore", param);
		KUpdate(sqlSession, KCommon.commonNamespace+"memberSetScore", param);
	}
	
	public ModelAndView mavReturn(ModelAndView mav , String viewname , HttpSession session, String pagename,String menu , String submenu, Boolean authority ) {
		mav.addObject("system_name","당일Job");
		if(menu.equals("admin")) {
		}else {
			if(authority) {
				if(session.getAttribute("dangil1009userLoginInfo") != null) {
					Map<String, String> dump = (Map<String, String>) session.getAttribute("dangil1009userLoginInfo");
					mav.addObject("user_seq",dump.get("seq"));
					mav.addObject("name",dump.get("name"));
					mav.addObject("user_id",dump.get("id"));
					mav.addObject("jobtype",dump.get("jobtype"));
					mav.addObject("type",dump.get("type"));
					mav.addObject("page_name",pagename);
					mav.addObject("menu",menu);
					mav.addObject("submenu",submenu);
					
					mav.addObject("page_name",pagename);
					mav.addObject("menu",menu);
					mav.setViewName(viewname);
				}else {
					mav.setViewName("/login");
				}
			}else {
				if(session.getAttribute("dangil1009userLoginInfo") != null) {
					Map<String, String> dump = (Map<String, String>) session.getAttribute("dangil1009userLoginInfo");
					mav.addObject("user_seq",dump.get("seq"));
					mav.addObject("name",dump.get("name"));
					mav.addObject("user_id",dump.get("id"));
					mav.addObject("jobtype",dump.get("jobtype"));
					mav.addObject("type",dump.get("type"));
					mav.addObject("menu",menu);
					mav.addObject("submenu",submenu);
					/*
					if(dump.get("type").equals("A00")) {
						mav.setViewName("/manager/"+viewname);
					}else if(dump.get("type").equals("A02")) {
						mav.setViewName("/dashboard/"+viewname);
					}else {
						mav.setViewName(viewname);
					}
					*/
				}
				
				mav.addObject("page_name",pagename);
				mav.addObject("menu",menu);
				mav.setViewName(viewname);
			}
		}
		
		return mav;
	}
}

