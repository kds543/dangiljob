package com.DG.dangil1009.common;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Service
public class Sch {
	@Autowired
	private SqlSessionTemplate sqlSession;
	KCommon comm = new KCommon();
	
	/**
	 * 24시간마다 작업 클리어
	 */
	@Scheduled(cron="0 50 23 * * *")
	public void getgoldInfo() {
	try {
	  Map<String , Object> param2 = new HashMap<>();
		  	 comm.KInsert(sqlSession, comm.commonNamespace+"joblog", param2);
			 comm.KDelete(sqlSession, comm.commonNamespace+"todayjoblogclear", param2);
	}catch(Exception e){
		
	}
			 
	}
}
