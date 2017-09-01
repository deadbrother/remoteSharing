/**
 * 
 */
package com.bonc.hashmap;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;


/**
 * <p>Title:testConvert </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年8月10日 下午5:03:36*/
public class testConvert {
	public static String LetterChanges(String str) {
		String converted = "";
		String patternString = "[a-z]";
		Pattern pattern = Pattern.compile(patternString); 
	    
	    for(int i =0;i < str.length();i ++){
	    	Matcher matcher = pattern.matcher(String.valueOf(str.charAt(i)));
	    	if(matcher.find())
	    		converted = str.replaceFirst(String.valueOf(str.charAt(i)), String.valueOf(str.charAt(i)+1));
	    }
		
		return converted.toUpperCase();
	  } 
	public static String sl(char c){
		return (c=='z' || c == 'Z') ? "a" : String.valueOf((c + 1)).toString();
	}
	  public static void main (String[] args) {  
	    // keep this function call here     
	   /* Scanner s = new Scanner(System.in);
	    System.out.print(LetterChanges(s.nextLine())); */
		  Map<String,String> map = null;
		  Map<String,String> jsonMap = new HashMap<String,String>();
			CloseableHttpClient httpClient = null;
			CloseableHttpResponse httpResponse = null;
			SimpleDateFormat simple = new SimpleDateFormat("yyyyMMddHHmmss");
			try {
				httpClient = HttpClients.createDefault();
				String urlstr = "http://sit3.portal.unicom.local:8080/eip_task_app/rest/taskappservice/updatependingstatus/na098/666666";
				HttpPost httpPost = new HttpPost(urlstr);
				httpPost.addHeader("Content-Type", "application/json; charset=utf-8");
				jsonMap.put("pendingCode", "78227");
				jsonMap.put("pendingTitle", "省分维系主管审批");
				jsonMap.put("pendingDate",simple.format(new Date()));
				jsonMap.put("lastUpdateDate", simple.format(new Date()));
				jsonMap.put("pendingLevel", "0");
				jsonMap.put("pendingNote", "na098");
				jsonMap.put("pendingSource", "xueying17");
				jsonMap.put("0endingSourceUserID", "xueying17");
				jsonMap.put("pendingStatus", "1");
				jsonMap.put("pendingURL", "http://10.0.206.162:8088/mrtsrv/clyx/activity/activity-bpm/activity-process!newProc.action?apbo.taskId=895555917943144449&apbo.processInstanceId=895555875341598720&apbo.activityId=87772&apbo.is_Prov_activity=1&apbo.is_City_activity=0&apbo.step=12&epmFrameLayout=thin");
				JSONArray json = JSONArray.fromObject(jsonMap);
				String jsonStr = json.toString();
				StringEntity inputEntity = new StringEntity(jsonStr,"utf-8");
				inputEntity.setContentType("application/json");
				inputEntity.setContentEncoding("utf-8");
				httpPost.setEntity(inputEntity);

				httpResponse = httpClient.execute(httpPost);
				if (httpResponse.getStatusLine().getStatusCode() != 200) {
					System.out.println(httpResponse.getStatusLine().getStatusCode());
				}

				String output = "";
				BufferedReader bufferedReader = new BufferedReader(new InputStreamReader((httpResponse.getEntity().getContent())));
				StringBuffer buf = new StringBuffer();
				while ((output = bufferedReader.readLine()) != null) {
					buf.append(output);
				}
				if(buf.length()>1){
					JSONObject jb = JSONObject.fromObject(buf.toString());
					map = jsonToObject(jb);
				}
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				if(httpResponse!=null){
					try {
						httpResponse.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			System.out.println(map.toString()); 
		  
	  }   
	  
	  private static Map<String, String> jsonToObject(JSONObject jsonObj){
			@SuppressWarnings("rawtypes")
			Iterator it = jsonObj.keys();
			String key;
			Map<String, String> outMap = new HashMap<String,String>();
			while (it.hasNext()) {
				key = String.valueOf(it.next());
				outMap.put(key,jsonObj.getString(key));
			}
			return outMap;
		}
}
