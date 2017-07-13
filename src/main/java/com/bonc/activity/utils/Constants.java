package com.bonc.activity.utils;

import java.nio.charset.Charset;

import org.springframework.stereotype.Service;

/**
 * 常量值
 * 
 * @author zhangxiaonan
 */

public class Constants {
    public static final int SOCKET_TIME_OUT = 30000; // 30 seconds
    public static final int SOCKET_TIME_OUT_CODE = -1;
    public static final String CHAR_ENCODING = "UTF-8";
    public static final Charset DEFAULT_CHAR_SET = Charset.forName(CHAR_ENCODING);
    public static final int IDLE_TIME = 180; //300 seconds
    public static final String TENANT_ID = "uni076";
    public static final String SYS_LOGINID = "uni076";
    public static final String SYS_REMARK = "系统自动执行";
    public static final String PROV_LEVEL = "1";
}
