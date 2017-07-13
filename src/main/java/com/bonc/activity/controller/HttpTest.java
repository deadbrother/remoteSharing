/**
 * 
 */
package com.bonc.activity.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;

/**
 * <p>Title:HttpTest </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年7月6日 下午3:26:24*/
public class HttpTest {
	public static void main(String[] args) {
		

	String httpURLId = "http://10.245.2.222:8088/security/rest/user/list?p=loginId&v=081_sys_008";
    String publicUserId = "";
    //pure_user鐨勭敤鎴峰悕
    String userName = "";
    //缁勭粐id锛岀敤浜庡鎴风兢鍒楄〃闄愬埗
    String orgs = "";
    String orgName ="";
    String classLevel = "";
    InputStream inputStream = null;
    try{
        URL fileUrl = new URL(httpURLId);  
        HttpURLConnection uc = (HttpURLConnection) fileUrl.openConnection();  
        uc.setRequestMethod("GET");  
        uc.setRequestProperty("Accept", "application/json");  
        uc.setRequestProperty("Accept-Charset", "UTF-8");  
        uc.setRequestProperty("contentType", "UTF-8");  
        uc.setDoInput(true);//璁剧疆鏄惁瑕佷粠 URL 杩炴帴璇诲彇鏁版嵁,榛樿涓簍rue  
        uc.connect();
        //System.out.println("------uc-------"+uc.getInputStream());
        inputStream = uc.getInputStream();
        String result = convertStreamToString(inputStream);
        System.out.println(result);
        JSONArray resultJson = JSONObject.parseArray(result);
       
        System.out.println( resultJson.getJSONObject(0));
        Object id = resultJson.getJSONObject(0).get("id");
        System.out.println(id);
        //List list = new Gson().toJson(new InputStreamReader(inputStream,"UTF-8"), ArrayList.class);
        System.out.println("list >>>" + "0");
        String pubId =id.toString();
        //pubId=String.valueOf(JSONObject.fromObject(list.get(0)).get("id")).replace(".0", "");
        /*if(String.valueOf(JSONObject.fromObject(list.get(0)).get("id")).endsWith(".0")){
        	pubId=String.valueOf(JSONObject.fromObject(list.get(0)).get("id")).replace(".0", "");
        }else{
        	pubId=String.valueOf(JSONObject.fromObject(list.get(0)).get("id"));
        }*/
        //System.out.println(JSONObject.parseObject(list.get(0).toString()));
        //pubId=String.valueOf(JSONObject.parseObject(list.get(0).toString()).get("id"));
        System.out.println("pubId------->"+pubId);
        publicUserId=new BigDecimal(pubId).toPlainString();
        System.out.println("publicUserId------->"+publicUserId);
    }catch(Exception e){
    	e.printStackTrace();
    }
	}
	
	public static String convertStreamToString(InputStream is) {      
        /*  
          * To convert the InputStream to String we use the BufferedReader.readLine()  
          * method. We iterate until the BufferedReader return null which means  
          * there's no more data to read. Each line will appended to a StringBuilder  
          * and returned as String.  
          */     
         BufferedReader reader = new BufferedReader(new InputStreamReader(is));      
         StringBuilder sb = new StringBuilder();      
     
         String line = null;      
        try {      
            while ((line = reader.readLine()) != null) {      
                 sb.append(line + "\n");      
             }      
         } catch (IOException e) {      
             e.printStackTrace();      
         } finally {      
            try {      
                 is.close();      
             } catch (IOException e) {      
                 e.printStackTrace();      
             }      
         }      
     
        return sb.toString();      
     }
	public String bts(InputStream is) throws IOException{
		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		StringBuilder sb = new StringBuilder();
		String line = null;
		while((line = reader.readLine()) != null){
			sb.append(line + "\n");
		}
		
		return sb.toString();
	}
}
