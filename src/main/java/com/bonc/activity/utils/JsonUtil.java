/**
 * 
 */
package com.bonc.activity.utils;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONNull;
import net.sf.json.JSONObject;

/**
 * @Company BONC
 * @Project BONC Data Integration
 * @Version 1.0
 * @Author  xiyunfeng
 * @Date    2014年2月28日 下午3:32:27
 * @Description json工具类
 */

@SuppressWarnings("rawtypes")
public class JsonUtil {
    
    /**
     * json字符串转List对象
     * @param jsonStr json字符串
     * @return list对象
     */
    public static List jsonToList(String jsonStr) {
        JSONArray jsonArray = JSONArray.fromObject(jsonStr);
        return (List)jsonArray;
    }
    
    /**
     * List转json字符串
     * @param list list对象
     * @return json字符串
     */
    public static String listToJson(List list) {
        JSONArray json = JSONArray.fromObject(list); 
        return json.toString();
    }
   
    /**
     * json字符串转Map对象
     * @param jsonStr json字符串
     * @return Map对象
     */
    public static Map jsonToMap(String jsonStr) {
        JSONObject jsonObject = JSONObject.fromObject(jsonStr);   
        return JSONObject.fromObject(jsonObject); 
    }
    
    /** Map对象转json字符串
     * @param map Map对象
     * @return json字符串
     */
    public static String mapToJson(Map map) {
        JSONObject json = JSONObject.fromObject(map); 
        return json.toString();
    }
    
    public static String getString(Object object) {
        if(object==null||object instanceof JSONNull||"".equals(object.toString().trim())){
            return null;
        }
        return object.toString();
    }
}
