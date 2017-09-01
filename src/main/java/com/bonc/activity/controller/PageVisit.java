package com.bonc.activity.controller;

import io.codis.jodis.*;

import java.io.*;
import java.net.*;
import java.util.*;

import javax.servlet.http.*;

import org.apache.commons.io.*;
import org.apache.log4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.*;
import org.springframework.web.servlet.*;

import redis.clients.jedis.*;

import com.alibaba.fastjson.*;
import com.bonc.activity.model.*;
import com.bonc.activity.service.*;
import com.bonc.common.utils.*;
import com.bonc.common.utils.page.*;
import com.bonc.security.client.*;
import com.bonc.security.entity.*;
import com.bonc.security.util.*;

@Controller
@RequestMapping(value = "/page")
public class PageVisit {
	
	
	@RequestMapping(value = { "/show" })
	public String showSysConfig(Model model) {
		/*Map<String,Object> allConfig = new HashMap<String,Object>();
		allConfig.put("cacheSysConfig",service.getSysConfig());
		allConfig.put("dbConfig", service.getDbSysConfig());*/
		/*List<Map<String,String>> allConfig = new ArrayList<Map<String,String>>();
		allConfig.add(service.getSysConfig());
		allConfig.add(service.getDbSysConfig());*/
		/*model.addAttribute("cacheSysConfig", service.getSysConfig());
		model.addAttribute("dbConfig", service.getDbSysConfig());*/
		
		return "page/show/dragable";
	}
}
