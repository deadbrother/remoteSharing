/**
 * 
 */
package com.bonc.activity.controller;

import java.nio.ByteBuffer;
import java.util.HashMap;

/**
 * <p>Title:testAllocate </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年6月26日 上午9:37:49*/
public class TestAccessDirectBuffer {
	
	 public static void directAllocate() {  
	        long startTime = System.currentTimeMillis();  
	        for (int i = 0; i < 200000; i++) {  
	            ByteBuffer.allocateDirect(1000);  
	        }  
	        long endTime = System.currentTimeMillis();  
	        System.out.println("directAllocate:" + (endTime - startTime));  
	    }  
	  
	    public static void bufferAllocate() {  
	        long startTime = System.currentTimeMillis();  
	        for (int i = 0; i < 200000; i++) {  
	            ByteBuffer.allocate(1000);  
	        }  
	        long endTime = System.currentTimeMillis();  
	        System.out.println("bufferAllocate:" + (endTime - startTime));  
	    }  
	  
	    public static void directAccess() {  
	        long startTime = System.currentTimeMillis();  
	        ByteBuffer b = ByteBuffer.allocateDirect(500);  
	        for (int i = 0; i < 100000; i++) {  
	            for (int j = 0; j < 99; j++)  
	                b.putInt(j);  
	            b.flip();  
	            for (int j = 0; j < 99; j++)  
	                b.getInt();  
	            b.clear();  
	        }  
	        long endTime = System.currentTimeMillis();  
	        System.out.println("directAccess:" + (endTime - startTime));  
	    }  
	  
	    //分配堆内存  
	    public static void bufferAccess() {  
	        long startTime = System.currentTimeMillis();  
	        ByteBuffer b = ByteBuffer.allocate(500);  
	        for (int i = 0; i < 100000; i++) {  
	            for (int j = 0; j < 99; j++)  
	                b.putInt(j);  
	            b.flip();  
	            for (int j = 0; j < 99; j++)  
	                b.getInt();  
	            b.clear();  
	        }  
	        long endTime = System.currentTimeMillis();  
	        System.out.println("bufferAccess" + (endTime - startTime));  
	    }  
	public static void main(String[] args) {
		bufferAllocate();  
        directAllocate();  
        bufferAllocate();  
        directAllocate();
		/*bufferAccess();
		directAccess();
		bufferAccess();
		directAccess();*/
        
	}
}
