package com.bonc.activity.utils;

import java.io.IOException;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.methods.ByteArrayRequestEntity;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.params.HttpMethodParams;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Http请求工具
 * 
 * @author zhangxiaonan
 */
public class HttpClientHelper {

    private final Logger logger = LoggerFactory.getLogger(HttpClientHelper.class);

	private static final HttpClientHelper instance = new HttpClientHelper();

    public static HttpClientHelper getInstance() {
        return instance;
    }

    private HttpClientHelper() {
    }

    public String post(String url, String jsonString) throws Exception {
        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(url);
        RequestEntity entity = new ByteArrayRequestEntity(jsonString.getBytes(), "application/json");
        method.setRequestEntity(entity);
        method.getParams().setParameter(HttpMethodParams.SO_TIMEOUT, Constants.SOCKET_TIME_OUT);
        logger.debug("Post json to \"" + url + "\". Json string: " + jsonString);
        client.executeMethod(method);
        byte[] bytes = method.getResponseBody();
        String rsString = new String(bytes, "UTF-8");
        logger.debug("Result from \"" + url + "\": " + rsString);
        return rsString;
    }
    
    public String get(String url) throws HttpException, IOException {
        HttpClient client = new HttpClient();
        GetMethod method = new GetMethod(url);
        client.executeMethod(method);
        byte[] bytes = method.getResponseBody();
        String rsString = new String(bytes, "UTF-8");
        logger.debug("Result from \"" + url + "\": " + rsString);
        return rsString;
    }
}
