/**
 * 
 */
package com.tomcat;

import java.io.IOException;
import java.io.InputStream;

/**
 * <p>Title:Request </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年9月4日 下午8:11:07*/
public class Request {
	private InputStream inputStream;
	private String uri;
	public Request(InputStream inputStream){
		this.inputStream = inputStream;
	}
	
	public void parse(){
		StringBuffer request = new StringBuffer(2048);
		int i;
		byte[] buffer = new byte[2048];
		try {
			i = inputStream.read(buffer);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			i = -1;
		}
		
		for(int j = 0; j < i ;j ++){
			request.append((char)buffer[j]);
		}
		System.out.println(request.toString());
		uri = parseUri(request.toString());
	}
	
	private String parseUri(String requestString){
		int index1,index2;
		index1 = requestString.indexOf(" ");
		if(index1 != -1){
			index2 = requestString.indexOf(" ",index1 + 1);
			if(index2 > index1){
				return requestString.substring(index1+1,index2);
			}
			return null;
		}else{
			return null;
		}
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}
	
	
}
