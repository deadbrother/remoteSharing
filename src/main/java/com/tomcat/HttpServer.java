/**
 * 
 */
package com.tomcat;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;


/**
 * <p>Title:HttpServer </p>
 * <p>Description: </p>
 * <p>Company:BONC </p> 
 * @author wangwenqiang
 * @date 2017年9月4日 下午7:58:11*/
public class HttpServer {

	/**
	 * @author: wangwenqiang
	 * @param args
	 * <p>Description:</p>
	 * @date2017年9月4日下午7:58:11
	 */
	/**
	 * WEB_ROOT是存放HTML文件的目录
	 */
	public static final String WEB_ROOT = System.getProperty("user.dir") + File.separator + "webroot";
	
	//关闭命令
	private static final String SHUTDOWN_COMMAND = "/SHUTDOWN";
	
	//收到关闭命令
	private boolean shutdown = false;
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HttpServer server = new HttpServer();
		server.await();
	}

	/**
	 * @author: wangwenqiang
	 * <p>Description:</p>
	 * @date2017年9月4日下午8:03:35
	 */
	private void await() {
		ServerSocket serverSocket = null;
		int port = 8080;
		try {
			serverSocket  = new ServerSocket(port, 1, InetAddress.getByName("127.0.0.1"));
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.exit(1);
		}
		
		//等待请求
		while(!shutdown){
			Socket socket = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			try {
				socket = serverSocket.accept();
				inputStream = socket.getInputStream();
				outputStream = socket.getOutputStream();
				
				//创建请求对象并解析
				Request request = new Request(inputStream);
				request.parse();
				
				//创建响应对象
				Response response = new Response(outputStream);
				response.setRequest(request);
				response.sendStaticResource();
				
				//关闭socket
				if(socket != null){
					socket.close();
				}
				
				//检查URI是否是一个关闭命令
				shutdown = SHUTDOWN_COMMAND.equals(request.getUri());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
