/**
 * 
 */
package com.bonc.activity.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ThreadPoolExecutor;

import org.apache.log4j.Logger;


/**
 * <p>Title:ComCurrentmapWithMap </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年7月5日 下午3:31:20*/
public class ComCurrentmapWithMap {
	private static Map<String,Long> mapWordCounts = new HashMap<>();
	private static ConcurrentMap<String,Long> concurrentMapWordCounts = new ConcurrentHashMap<>();
	public static Logger logger = Logger.getLogger(ThreadPoolExecutor.class);
	public static int count = 0;
	
	public static long mapIncrease(String word){
		Long oldValue = mapWordCounts.get(word);
		Long newValue = (oldValue == null) ? 1L : oldValue + 1;
		mapWordCounts.put(word, newValue);
		return newValue;
	}
	
	public static long ConcurrentMapIncrease(String word){
		Long oldValue,newValue;
		while(true){
			oldValue = concurrentMapWordCounts.get(word);
			if(oldValue == null){
				newValue = 1L;
				if(concurrentMapWordCounts.putIfAbsent(word, newValue) == null){
					break;
				}
			}else{
				newValue = oldValue + 1;
				if(concurrentMapWordCounts.replace(word, oldValue,newValue)){
					break;
				}
			}
		}
		return newValue;
	}
	
	public static void mapWordCount(){
		new Thread(new Runnable(){
			public void run(){
				int count = 0;
				while(count ++ < 100){
					logger.info("mapIncrease num is " + ComCurrentmapWithMap.mapIncrease("work"));
				}
			}
		}).start();
		
		new Thread(new Runnable(){
			public void run(){
				int count = 0;
				while(count ++ < 100){
					logger.info("mapIncrease num is " + ComCurrentmapWithMap.mapIncrease("work"));
				}
			}
		}).start();
	}
	
	public static void concurrentWordCount() throws InterruptedException, ExecutionException {  
        new Thread(new Runnable(){    
            public void run() {  
                int count=0;  
                while(count++<100)   
                    logger.info("mapIncrease num is " + ComCurrentmapWithMap.ConcurrentMapIncrease("work"));  
            }  
        }).start();  
        new Thread(new Runnable(){    
            public void run() {  
                int count=0;  
                while(count++<100)   
                    logger.info("mapIncrease num is " + ComCurrentmapWithMap.ConcurrentMapIncrease("work"));  
            }  
        }).start();  
        new Thread(new Runnable(){    
            public void run() {  
                int count=0;  
                while(count++<100)   
                    logger.info("mapIncrease num is " + ComCurrentmapWithMap.ConcurrentMapIncrease("work"));  
            }  
        }).start();  
        new Thread(new Runnable(){    
            public void run() {  
                int count=0;  
                while(count++<100)   
                    logger.info("mapIncrease num is " + ComCurrentmapWithMap.ConcurrentMapIncrease("work"));  
            }  
        }).start();  
    }
	
	public static void main(String[] args) throws InterruptedException, ExecutionException{
		ComCurrentmapWithMap.mapWordCount();
		Thread.sleep(100);
		logger.info("final count map" + ComCurrentmapWithMap.mapWordCounts.get("work"));
		ComCurrentmapWithMap.concurrentWordCount();
		Thread.sleep(100);
		logger.info("final count concurrentMap" + ComCurrentmapWithMap.concurrentMapWordCounts.get("work"));
	}
}
