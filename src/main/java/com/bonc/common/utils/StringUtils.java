/********************************************************************************
 * Copy Right Information	: 东方国信
 * Project					: ooxml解析引擎
 * JDK Version Used        	: 1.6.24
 * Comments         	    : StringUtils.java
 * Version                  ：1.0.1
 * Sr.		Date			Author				Why and What is Modified
 * 1.		Dec 2, 2011		黄小斌				初始化
 ********************************************************************************/

package com.bonc.common.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

public class StringUtils {

	public static SimpleDateFormat	df	= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	/**
	 * com.bonc.base.util.Utils.nextId() 处理批量导入的时候，如果多个用户同时导入，出现序列相同
	 * 
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public synchronized static String NextId() {
		return getShortUuid();
	}

	public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f",
		"g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s",
		"t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5",
		"6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I",
		"J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
		"W", "X", "Y", "Z" };

	public static String getShortUuid() {
		StringBuffer stringBuffer = new StringBuffer();
		String uuid = UUID.randomUUID().toString().replace("-", "");
		for (int i = 0; i < 8; i++) {
			String str = uuid.substring(i * 4, i * 4 + 4);
			int strInteger = Integer.parseInt(str, 16);
			stringBuffer.append(chars[strInteger % 0x3E]);
		}
		return stringBuffer.toString();
	}
	
	@SuppressWarnings("deprecation")
	public synchronized static String toText(String val) {
		return com.bonc.base.util.Utils.toText(val);
	}

	public synchronized static String getNowDateStr() {
		return df.format(getNowDate());
	}

	public synchronized static Date getNowDate() {
		long datel = System.currentTimeMillis();
		Date date = new Date(datel);
		return date;
	}

	@SuppressWarnings("deprecation")
	public synchronized static String getLoginAddr() {
		HttpServletRequest request = com.bonc.base.util.Utils.getRequest();
		return request.getRemoteAddr();
	}

	public synchronized static String getTimeBetween(String start, String end) {
		try {
			Date startD = df.parse(start);
			Date endD = df.parse(end);
			return "" + (endD.getTime() - startD.getTime()) / 1000;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
}
