/**
 * 
 */
package com.tomcat;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

/**
 * <p>Title:Response </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年9月4日 下午8:16:15*/
public class Response {
	private static final int BUFFER_SIZE = 1024;
	Request request;
	OutputStream outputStream;
	
	public Response(OutputStream outputStream){
		this.outputStream = outputStream;
	}
	
	public void setRequest(Request request){
		this.request = request;
	}
	
	public void sendStaticResource() throws IOException{
		byte bytes[] = new byte[BUFFER_SIZE];
		FileInputStream fis = null;
		File file = new File(HttpServer.WEB_ROOT,request.getUri());
		try {
			if(file.exists()){
				
					fis = new FileInputStream(file);
				
				int ch = fis.read(bytes,0,BUFFER_SIZE);
				while(ch != -1){
					outputStream.write(bytes,0,ch);
					ch = fis.read(bytes, 0, BUFFER_SIZE);
				}
			}else{
				String errorMessage = "<h1>File not found</h1>";
				outputStream.write(errorMessage.getBytes());
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally{
			if(fis != null)
				fis.close();
		}
	}
}
